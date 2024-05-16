package com.pax.poslink2;

import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.pax.poscomm.usb.utils.USBUtil;
import com.pax.poscore.LogSetting;
import com.pax.poscore.commsetting.AidlSetting;
import com.pax.poscore.commsetting.CommunicationSetting;
import com.pax.poscore.commsetting.SslSetting;
import com.pax.poscore.commsetting.TcpSetting;
import com.pax.poscore.commsetting.UartSetting;
import com.pax.poscore.commsetting.UsbSetting;
import com.pax.poslink2.pigeon.POSLinkAdmin;
import com.pax.poslink2.pigeon.POSLinkBatch;
import com.pax.poslink2.pigeon.POSLinkDevice;
import com.pax.poslink2.pigeon.POSLinkForm;
import com.pax.poslink2.pigeon.POSLinkLogSet;
import com.pax.poslink2.pigeon.POSLinkReport;
import com.pax.poslink2.pigeon.POSLinkSet;
import com.pax.poslink2.pigeon.POSLinkTest;
import com.pax.poslink2.pigeon.POSLinkTransaction;
import com.pax.poslink2.utils.PlatformUtils;
import com.pax.poslinkupt.ExecutionResult;
import com.pax.poslinkupt.POSLinkUPT;
import com.pax.poslinkupt.ReportStatusListener;
import com.pax.poslinkupt.Terminal;
import com.pax.poslinkupt.admin.GetConfigurationReq;
import com.pax.poslinkupt.admin.GetConfigurationRsp;
import com.pax.poslinkupt.admin.GetTerminalInfoRsp;
import com.pax.poslinkupt.admin.PingReq;
import com.pax.poslinkupt.admin.PingRsp;
import com.pax.poslinkupt.admin.RebootRsp;
import com.pax.poslinkupt.admin.ResetRsp;
import com.pax.poslinkupt.admin.SetConfigurationReq;
import com.pax.poslinkupt.admin.SetConfigurationRsp;
import com.pax.poslinkupt.batch.BatchClearReq;
import com.pax.poslinkupt.batch.BatchClearRsp;
import com.pax.poslinkupt.batch.BatchCloseReq;
import com.pax.poslinkupt.batch.BatchCloseRsp;
import com.pax.poslinkupt.device.MifareClassicGetUIDReq;
import com.pax.poslinkupt.device.MifareClassicGetUIDRsp;
import com.pax.poslinkupt.device.MifareClassicReadReq;
import com.pax.poslinkupt.device.MifareClassicReadRsp;
import com.pax.poslinkupt.device.MifareClassicWriteReq;
import com.pax.poslinkupt.device.MifareClassicWriteRsp;
import com.pax.poslinkupt.report.GetCardInfoReq;
import com.pax.poslinkupt.report.GetCardInfoRsp;
import com.pax.poslinkupt.report.GetCardStatusReq;
import com.pax.poslinkupt.report.GetCardStatusRsp;
import com.pax.poslinkupt.report.GetTraceInfoByCardReq;
import com.pax.poslinkupt.report.GetTraceInfoByCardRsp;
import com.pax.poslinkupt.report.GetTransactionInfoReq;
import com.pax.poslinkupt.report.GetTransactionInfoRsp;
import com.pax.poslinkupt.transaction.TransactionCompletionReq;
import com.pax.poslinkupt.transaction.TransactionCompletionRsp;
import com.pax.poslinkupt.transaction.TransactionIncrementalReq;
import com.pax.poslinkupt.transaction.TransactionIncrementalRsp;
import com.pax.poslinkupt.transaction.TransactionReversalReq;
import com.pax.poslinkupt.transaction.TransactionReversalRsp;
import com.pax.poslinkupt.transaction.TransactionStartReq;
import com.pax.poslinkupt.transaction.TransactionStartRsp;
import com.pax.serialport.SerialPortFinderPax;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    static final String SPF = "SETTING_SPF";

    Terminal terminal;
    CommunicationSetting commSetting;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SharedPreferences sharedPreferences = getSharedPreferences(SPF, MODE_PRIVATE);
        LogSetting logSetting = new LogSetting();
        logSetting.setEnable(sharedPreferences.getBoolean("LOG_ENABLE", true));
        logSetting.setLevel(LogSetting.LogLevel.values()[sharedPreferences.getInt("LOG_LEVEL", 1)]);
        logSetting.setDays(sharedPreferences.getInt("LOG_DAYS", 30));
        logSetting.setFileName(sharedPreferences.getString("LOG_FILE_NAME", "POSLog"));
        POSLinkUPT.getInstance().setLogSetting(logSetting);

        commSetting = new AidlSetting();
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        boolean result = super.dispatchKeyEvent(event);
        if (PlatformUtils.isPAXAndroid()) {
            if (result && (event.getKeyCode() == KeyEvent.KEYCODE_HOME
                    || event.getKeyCode() == KeyEvent.KEYCODE_APP_SWITCH)) {
                // Virgo OS will return true and it will cause the no response for Home/Recent key
                return false;
            }
        }
        return result;
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        POSLinkSet.POSLinkSetApi.setUp(flutterEngine.getDartExecutor().getBinaryMessenger(), new POSLinkSet.POSLinkSetApi() {
            @Override
            public void setAIDLSetting() {
                commSetting = new AidlSetting();
            }

            @Override
            public void setTCPSetting(POSLinkSet.TCPSetting setting) {
                commSetting = new TcpSetting(setting.getIp(), setting.getPort(), setting.getTimeout().intValue());
            }

            @Override
            public void setHttpSetting(POSLinkSet.HttpSetting setting) {
//                commSetting = new HttpSetting(setting.getIp(), setting.getPort(), setting.getTimeout().intValue());
            }

            @Override
            public void setHttpsSetting(POSLinkSet.HttpsSetting setting) {
//                commSetting = new HttpsSetting(setting.getIp(), setting.getPort(), setting.getTimeout().intValue());
            }

            @Override
            public void setSslSetting(POSLinkSet.SslSetting setting) {
                commSetting = new SslSetting(setting.getIp(), setting.getPort(), setting.getTimeout().intValue());
            }

            @Override
            public void setUsbSetting(POSLinkSet.UsbSetting setting) {
                UsbSetting usbSetting = new UsbSetting();
                usbSetting.setTimeout(setting.getTimeout().intValue());
                commSetting = usbSetting;
                USBUtil.requestUSBPermissionIfNeed(MainActivity.this);
            }

            @Override
            public void setUartSetting(POSLinkSet.UartSetting setting) {
                commSetting = new UartSetting(setting.getSerialPort(), setting.getBaudRate(), setting.getTimeout().intValue());
            }

            @Override
            public List<String> getUartDevices() {
                List<String> devices = new ArrayList<>();
                SerialPortFinderPax serialPortFinderPax = new SerialPortFinderPax();
                String[] devicesPathList = serialPortFinderPax.getAllDevicesPath();
                for (String path : devicesPathList) {
                    if (path.startsWith("/dev/tty")) {
                        devices.add(path);
                    }
                }
                return devices;
            }

            @Override
            public void cancel() {
                if (terminal != null) {
                    terminal.cancel();
                }
            }
        });

        POSLinkLogSet.POSLinkLogSetApi.setUp(flutterEngine.getDartExecutor(), new POSLinkLogSet.POSLinkLogSetApi() {
            @Override
            public void setLogSetting(POSLinkLogSet.LogSetting setting) {
                POSLinkUPT.getInstance().getLogSetting().setEnable(setting.getEnable());
                POSLinkUPT.getInstance().getLogSetting().setLevel(setting.getLevel() == POSLinkLogSet.LogLevel.DEBUG ?
                        LogSetting.LogLevel.DEBUG : LogSetting.LogLevel.ERROR);
                POSLinkUPT.getInstance().getLogSetting().setDays(setting.getDays().intValue());
                POSLinkUPT.getInstance().getLogSetting().setFileName(setting.getFileName());
                POSLinkUPT.getInstance().getLogSetting().setFilePath(setting.getFilePath().isEmpty() ? "." : setting.getFilePath());
                SharedPreferences sharedPreferences = getSharedPreferences(SPF, MODE_PRIVATE);
                SharedPreferences.Editor editor = sharedPreferences.edit();
                editor.putBoolean("LOG_ENABLE", setting.getEnable());
                editor.putInt("LOG_LEVEL", setting.getLevel().ordinal());
                editor.putInt("LOG_DAYS", setting.getDays().intValue());
                editor.putString("LOG_FILE_NAME", setting.getFileName());
                editor.putString("LOG_FILE_PATH", setting.getFilePath());
                editor.apply();
            }
        });

        POSLinkTransaction.POSLinkTransactionApi.setUp(flutterEngine.getDartExecutor().getBinaryMessenger(), new POSLinkTransaction.POSLinkTransactionApi() {
            @Override
            public void transactionStart(POSLinkTransaction.TransactionTransactionStartReq req, POSLinkTransaction.Result<POSLinkTransaction.TransactionTransactionStartRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    TransactionStartReq transactionStartReq = jsonTransform(req, TransactionStartReq.class);
                    ExecutionResult<TransactionStartRsp> executionResult = terminal.getTransaction().start(transactionStartReq);
                    POSLinkTransaction.TransactionTransactionStartRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkTransaction.TransactionTransactionStartRsp.class);
                    } else {
                        rsp = new POSLinkTransaction.TransactionTransactionStartRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void transactionIncremental(@NonNull POSLinkTransaction.TransactionTransactionIncrementalReq req, @NonNull POSLinkTransaction.Result<POSLinkTransaction.TransactionTransactionIncrementalRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    TransactionIncrementalReq transactionIncrementalReq = jsonTransform(req, TransactionIncrementalReq.class);
                    ExecutionResult<TransactionIncrementalRsp> executionResult = terminal.getTransaction().incremental(transactionIncrementalReq);
                    POSLinkTransaction.TransactionTransactionIncrementalRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkTransaction.TransactionTransactionIncrementalRsp.class);
                    } else {
                        rsp = new POSLinkTransaction.TransactionTransactionIncrementalRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void transactionReversal(POSLinkTransaction.TransactionTransactionReversalReq req, POSLinkTransaction.Result<POSLinkTransaction.TransactionTransactionReversalRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    TransactionReversalReq transactionReversalReq = jsonTransform(req, TransactionReversalReq.class);
                    ExecutionResult<TransactionReversalRsp> executionResult = terminal.getTransaction().reversal(transactionReversalReq);
                    POSLinkTransaction.TransactionTransactionReversalRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkTransaction.TransactionTransactionReversalRsp.class);
                    } else {
                        rsp = new POSLinkTransaction.TransactionTransactionReversalRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void transactionCompletion(POSLinkTransaction.TransactionTransactionCompletionReq req, POSLinkTransaction.Result<POSLinkTransaction.TransactionTransactionCompletionRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    TransactionCompletionReq transactionCompletionReq = jsonTransform(req, TransactionCompletionReq.class);
                    ExecutionResult<TransactionCompletionRsp> executionResult = terminal.getTransaction().complete(transactionCompletionReq);
                    POSLinkTransaction.TransactionTransactionCompletionRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkTransaction.TransactionTransactionCompletionRsp.class);
                    } else {
                        rsp = new POSLinkTransaction.TransactionTransactionCompletionRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }
        });

        POSLinkAdmin.POSLinkAdminApi.setUp(flutterEngine.getDartExecutor().getBinaryMessenger(), new POSLinkAdmin.POSLinkAdminApi() {
            @Override
            public void reboot(POSLinkAdmin.AdminRebootReq req, POSLinkAdmin.Result<POSLinkAdmin.AdminRebootRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    ExecutionResult<RebootRsp> executionResult = terminal.getAdmin().reboot();
                    POSLinkAdmin.AdminRebootRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkAdmin.AdminRebootRsp.class);
                    } else {
                        rsp = new POSLinkAdmin.AdminRebootRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void reset(POSLinkAdmin.AdminResetReq req, POSLinkAdmin.Result<POSLinkAdmin.AdminResetRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    ExecutionResult<ResetRsp> executionResult = terminal.getAdmin().reset();
                    POSLinkAdmin.AdminResetRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkAdmin.AdminResetRsp.class);
                    } else {
                        rsp = new POSLinkAdmin.AdminResetRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void getTerminalInfo(POSLinkAdmin.AdminGetTerminalInfoReq req, POSLinkAdmin.Result<POSLinkAdmin.AdminGetTerminalInfoRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    ExecutionResult<GetTerminalInfoRsp> executionResult = terminal.getAdmin().getTerminalInfo();
                    POSLinkAdmin.AdminGetTerminalInfoRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkAdmin.AdminGetTerminalInfoRsp.class);
                    } else {
                        rsp = new POSLinkAdmin.AdminGetTerminalInfoRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void setConfiguration(POSLinkAdmin.AdminSetConfigurationReq req, POSLinkAdmin.Result<POSLinkAdmin.AdminSetConfigurationRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    SetConfigurationReq setConfigurationReq = jsonTransform(req, SetConfigurationReq.class);
                    ExecutionResult<SetConfigurationRsp> executionResult = terminal.getAdmin().setConfiguration(setConfigurationReq);
                    POSLinkAdmin.AdminSetConfigurationRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkAdmin.AdminSetConfigurationRsp.class);
                    } else {
                        rsp = new POSLinkAdmin.AdminSetConfigurationRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void getConfiguration(POSLinkAdmin.AdminGetConfigurationReq req, POSLinkAdmin.Result<POSLinkAdmin.AdminGetConfigurationRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    GetConfigurationReq getConfigurationReq = jsonTransform(req, GetConfigurationReq.class);
                    ExecutionResult<GetConfigurationRsp> executionResult = terminal.getAdmin().getConfiguration(getConfigurationReq);
                    POSLinkAdmin.AdminGetConfigurationRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkAdmin.AdminGetConfigurationRsp.class);
                    } else {
                        rsp = new POSLinkAdmin.AdminGetConfigurationRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void ping(POSLinkAdmin.AdminPingReq req, POSLinkAdmin.Result<POSLinkAdmin.AdminPingRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    PingReq pingReq = jsonTransform(req, PingReq.class);
                    ExecutionResult<PingRsp> executionResult = terminal.getAdmin().ping(pingReq);
                    POSLinkAdmin.AdminPingRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkAdmin.AdminPingRsp.class);
                    } else {
                        rsp = new POSLinkAdmin.AdminPingRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }
        });

        POSLinkBatch.POSLinkBatchApi.setUp(flutterEngine.getDartExecutor().getBinaryMessenger(), new POSLinkBatch.POSLinkBatchApi() {
            @Override
            public void batchClose(POSLinkBatch.BatchBatchCloseReq req, POSLinkBatch.Result<POSLinkBatch.BatchBatchCloseRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    BatchCloseReq batchCloseReq = jsonTransform(req, BatchCloseReq.class);
                    ExecutionResult<BatchCloseRsp> executionResult = terminal.getBatch().batchClose(batchCloseReq);
                    POSLinkBatch.BatchBatchCloseRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkBatch.BatchBatchCloseRsp.class);
                    } else {
                        rsp = new POSLinkBatch.BatchBatchCloseRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void batchClear(POSLinkBatch.BatchBatchClearReq req, POSLinkBatch.Result<POSLinkBatch.BatchBatchClearRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    BatchClearReq batchClearReq = jsonTransform(req, BatchClearReq.class);
                    ExecutionResult<BatchClearRsp> executionResult = terminal.getBatch().batchClear(batchClearReq);
                    POSLinkBatch.BatchBatchClearRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkBatch.BatchBatchClearRsp.class);
                    } else {
                        rsp = new POSLinkBatch.BatchBatchClearRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }
        });

        POSLinkDevice.POSLinkDeviceApi.setUp(flutterEngine.getDartExecutor(), new POSLinkDevice.POSLinkDeviceApi() {
            @Override
            public void mifareClassicRead(POSLinkDevice.DeviceMifareClassicReadReq req, POSLinkDevice.Result<POSLinkDevice.DeviceMifareClassicReadRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    MifareClassicReadReq mifareClassicReadReq = jsonTransform(req, MifareClassicReadReq.class);
                    ExecutionResult<MifareClassicReadRsp> executionResult = terminal.getDevice().mifareClassicRead(mifareClassicReadReq);
                    POSLinkDevice.DeviceMifareClassicReadRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkDevice.DeviceMifareClassicReadRsp.class);
                    } else {
                        rsp = new POSLinkDevice.DeviceMifareClassicReadRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void mifareClassicWrite(POSLinkDevice.DeviceMifareClassicWriteReq req, POSLinkDevice.Result<POSLinkDevice.DeviceMifareClassicWriteRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    MifareClassicWriteReq mifareClassicWriteReq = jsonTransform(req, MifareClassicWriteReq.class);
                    ExecutionResult<MifareClassicWriteRsp> executionResult = terminal.getDevice().mifareClassicWrite(mifareClassicWriteReq);
                    POSLinkDevice.DeviceMifareClassicWriteRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkDevice.DeviceMifareClassicWriteRsp.class);
                    } else {
                        rsp = new POSLinkDevice.DeviceMifareClassicWriteRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void mifareClassicGetUID(POSLinkDevice.DeviceMifareClassicGetUIDReq req, POSLinkDevice.Result<POSLinkDevice.DeviceMifareClassicGetUIDRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    MifareClassicGetUIDReq mifareClassicGetUIDReq = jsonTransform(req, MifareClassicGetUIDReq.class);
                    ExecutionResult<MifareClassicGetUIDRsp> executionResult = terminal.getDevice().mifareClassicGetUID(mifareClassicGetUIDReq);
                    POSLinkDevice.DeviceMifareClassicGetUIDRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkDevice.DeviceMifareClassicGetUIDRsp.class);
                    } else {
                        rsp = new POSLinkDevice.DeviceMifareClassicGetUIDRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }
        });

        POSLinkReport.POSLinkReportApi.setUp(flutterEngine.getDartExecutor(), new POSLinkReport.POSLinkReportApi() {
            @Override
            public void getTransactionInfo(POSLinkReport.ReportGetTransactionInfoReq req, POSLinkReport.Result<POSLinkReport.ReportGetTransactionInfoRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    GetTransactionInfoReq getTransactionInfoReq = jsonTransform(req, GetTransactionInfoReq.class);
                    ExecutionResult<GetTransactionInfoRsp> executionResult = terminal.getReport().getTransactionInfo(getTransactionInfoReq);
                    POSLinkReport.ReportGetTransactionInfoRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkReport.ReportGetTransactionInfoRsp.class);
                    } else {
                        rsp = new POSLinkReport.ReportGetTransactionInfoRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void getTraceInfoByCard(POSLinkReport.ReportGetTraceInfoByCardReq req, POSLinkReport.Result<POSLinkReport.ReportGetTraceInfoByCardRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    GetTraceInfoByCardReq getTraceInfoByCardReq = jsonTransform(req, GetTraceInfoByCardReq.class);
                    ExecutionResult<GetTraceInfoByCardRsp> executionResult = terminal.getReport().getTraceInfoByCard(getTraceInfoByCardReq);
                    POSLinkReport.ReportGetTraceInfoByCardRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkReport.ReportGetTraceInfoByCardRsp.class);
                    } else {
                        rsp = new POSLinkReport.ReportGetTraceInfoByCardRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void getCardStatus(POSLinkReport.ReportGetCardStatusReq req, POSLinkReport.Result<POSLinkReport.ReportGetCardStatusRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    GetCardStatusReq getCardStatusReq = jsonTransform(req, GetCardStatusReq.class);
                    ExecutionResult<GetCardStatusRsp> executionResult = terminal.getReport().getCardStatus();
                    POSLinkReport.ReportGetCardStatusRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkReport.ReportGetCardStatusRsp.class);
                    } else {
                        rsp = new POSLinkReport.ReportGetCardStatusRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }

            @Override
            public void getCardInfo(POSLinkReport.ReportGetCardInfoReq req, POSLinkReport.Result<POSLinkReport.ReportGetCardInfoRsp> result) {
                new Thread(() -> {
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    GetCardInfoReq getCardInfoReq = jsonTransform(req, GetCardInfoReq.class);
                    ExecutionResult<GetCardInfoRsp> executionResult = terminal.getReport().getCardInfo(getCardInfoReq);
                    POSLinkReport.ReportGetCardInfoRsp rsp;
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        rsp = jsonTransform(executionResult.response(), POSLinkReport.ReportGetCardInfoRsp.class);
                    } else {
                        rsp = new POSLinkReport.ReportGetCardInfoRsp();
                        rsp.setResponseCode(executionResult.code() + "");
                        rsp.setResponseMessage(executionResult.message());
                    }
                    runOnUiThread(() -> {
                        result.success(rsp);
                    });
                }).start();
            }
        });

        POSLinkForm.POSLinkFormApi.setUp(flutterEngine.getDartExecutor(), new POSLinkForm.POSLinkFormApi() {
            @Override
            public void inputText(@NonNull POSLinkForm.FormInputTextReq req, POSLinkForm.Result<POSLinkForm.FormInputTextRsp> result) {
                POSLinkForm.FormInputTextRsp rsp = new POSLinkForm.FormInputTextRsp();
                rsp.setResponseCode("Error");
                rsp.setResponseMessage("Not Support");
                result.success(rsp);
            }
        });

        POSLinkTest.POSLinkTestApi.setup(flutterEngine.getDartExecutor(), new POSLinkTest.POSLinkTestApi() {
            @Override
            public void transactionStartTest(String registerReferenceNumber, POSLinkTest.Result<String> result) {
                new Thread(() -> {
                    try {
                        Thread.sleep(3000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    terminal = POSLinkUPT.getInstance().getTerminal(MainActivity.this, commSetting);
                    setReportStatusListener(terminal);
                    TransactionStartReq transactionStartReq = new TransactionStartReq();
                    transactionStartReq.setTransactionAmount("100");
                    transactionStartReq.setRegisterReferenceNumber(registerReferenceNumber);
                    transactionStartReq.setReportStatus("0");
                    ExecutionResult<TransactionStartRsp> executionResult = terminal.getTransaction().start(transactionStartReq);
                    Gson gson = new Gson();
                    if (executionResult.isSuccessful() && executionResult.response() != null) {
                        runOnUiThread(() -> result.success(gson.toJson(executionResult.response())));
                    } else {
                        JsonObject responseObject = new JsonObject();
                        responseObject.addProperty("responseCode", executionResult.code() + "");
                        responseObject.addProperty("responseMessage", executionResult.message());
                        runOnUiThread(() -> result.success(responseObject.toString()));
                    }
                }).start();
            }
        });
    }

    private void setReportStatusListener(Terminal terminal) {
        terminal.setReportStatusListener(new ReportStatusListener() {
            @Override
            public void onReportStatus(int i, String message) {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(MainActivity.this, i + ", " + message, Toast.LENGTH_LONG).show();
                    }
                });
            }
        });
    }

    private <T> T jsonTransform(Object input, Class<T> classOfT) {
        Gson gson = new GsonBuilder()
                .registerTypeHierarchyAdapter(Enum.class, new JsonSerializer<Enum<?>>() {
                    @Override
                    public JsonElement serialize(Enum<?> src, Type typeOfSrc, JsonSerializationContext context) {
                        // 使用 ordinal 序列化成基本数据类型
                        return new JsonPrimitive(src.name());
                    }

                })
                .registerTypeHierarchyAdapter(Enum.class, new JsonDeserializer<Enum<?>>() {
                    @Override
                    public Enum<?> deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
                        try {
                            // 必须是基本数据类型
                            if (json.isJsonPrimitive()) {

                                JsonPrimitive jsonPrimitive = json.getAsJsonPrimitive();

                                // 反射读取所有得枚举实例
                                String name;
                                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                                    name = typeOfT.getTypeName();
                                } else {
                                    name = typeOfT.toString().split(" ")[1];
                                }
                                Enum<?>[] enumConstants = (Enum<?>[]) Class.forName(name).getEnumConstants();

                                if (jsonPrimitive.isNumber()) { // 数字
                                    return enumConstants[jsonPrimitive.getAsInt()];
                                } else if (jsonPrimitive.isString()) { // 字符串
                                    String val = jsonPrimitive.getAsString();
                                    for (Enum<?> constant : enumConstants) {
                                        String constantName = constant.name();
                                        if (constantName.replace("_", "").equalsIgnoreCase(val.replace("_", ""))) {
                                            return constant;
                                        }
                                    }

                                }
                            }
                        } catch (ClassNotFoundException | ArrayIndexOutOfBoundsException e) {
                            e.printStackTrace();
                        }
                        throw new IllegalArgumentException("bad param:" + json.getAsString());
                    }
                })
                .create();
        String jsonStr = gson.toJson(input);
        return gson.fromJson(jsonStr, classOfT);
    }
}
