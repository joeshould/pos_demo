import 'dart:io';

import 'package:flutter/material.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_set.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CommSettingType {
  AIDL,
  TCP,
  // HTTP,
  // HTTPS,
  SSL,
  USB,
  UART,
}

class CommSettingViewModel extends ChangeNotifier {
  static const KEY_TYPE = "TYPE";
  static const KEY_TIMEOUT = "TIMEOUT";
  static const KEY_ENABLE_JSON = "ENABLE_JSON";
  static const KEY_IP = "IP";
  static const KEY_PORT = "PORT";
  static const KEY_CHANNEL = "CHANNEL";
  static const KEY_SERIAL_PORT = "SERIAL_PORT";
  static const KEY_BAUDRATE = "BAUDRATE";

  static const String TAB_PAYMENT = "PAYMENT";
  static const String TAB_ADMIN = "ADMIN";
  static const String TAB_BATCH = "BATCH";
  static const String TAB_DEVICE = "DEVICE";
  static const String TAB_REPORT = "REPORT";
  static const String TAB_FORM = "FORM";
  static const String TAB_TEST = "TEST";
  static const String TAB_LOG_SETTING = "LOG_SETTING";
  static const String TAB_COMM_SETTING = "COMM_SETTING";

  CommSettingType _type =
      Platform.isAndroid ? CommSettingType.AIDL : CommSettingType.TCP;
  int _timeout = 60000;
  bool _enableJson = true;
  String? _ip;
  String? _port = "10009";
  String? _channel;
  String? _serialPort;
  List<String?> uartDevices = [];
  String? _baudRate = "9600";

  String _currentTab = TAB_PAYMENT;

  CommSettingViewModel() {
    _getLocalData();
  }

  CommSettingType get type {
    return _type;
  }

  set type(CommSettingType type) {
    _type = type;
    _save();
    notifyListeners();

    if (_type == CommSettingType.UART) {
      getUARTDevices().then((value) => notifyListeners());
    } else if (_type == CommSettingType.USB) {
      setUSBSetting(); // request usb permission first.
    }
  }

  int get timeout => _timeout;

  set timeout(int value) {
    _timeout = value;
    _save();
  }

  bool get enableJson => _enableJson;

  set enableJson(bool value) {
    _enableJson = value;
    _save();
  }

  String? get port => _port;

  set port(String? value) {
    _port = value;
    _save();
  }

  String? get ip => _ip;

  set ip(String? value) {
    _ip = value;
    _save();
  }

  String? get channel => _channel;

  set channel(String? value) {
    _channel = value;
    _save();
  }

  String? get serialPort => _serialPort;

  set serialPort(String? value) {
    _serialPort = value;
    _save();
    notifyListeners();
  }

  String? get baudRate => _baudRate;

  set baudRate(String? value) {
    _baudRate = value;
    _save();
    notifyListeners();
  }

  String get currentTab => _currentTab;

  set currentTab(String value) {
    _currentTab = value;
    notifyListeners();
  }

  _save() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(KEY_TYPE, _type.index);
    pref.setInt(KEY_TIMEOUT, _timeout);
    pref.setBool(KEY_ENABLE_JSON, _enableJson);
    pref.setString(KEY_IP, _ip ?? "");
    pref.setString(KEY_PORT, _port ?? "");
    pref.setString(KEY_CHANNEL, _channel ?? "");
    pref.setString(KEY_SERIAL_PORT, _serialPort ?? "");
    pref.setString(KEY_BAUDRATE, _baudRate ?? "");
  }

  _getLocalData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (Platform.isWindows) {
      _type = CommSettingType.values[pref.getInt(KEY_TYPE) ?? 1];
    } else {
      _type = CommSettingType.values[pref.getInt(KEY_TYPE) ?? 0];
    }
    _timeout = pref.getInt(KEY_TIMEOUT) ?? 60000;
    _enableJson = pref.getBool(KEY_ENABLE_JSON) ?? true;
    _ip = pref.getString(KEY_IP);
    _port = pref.getString(KEY_PORT) ?? "10009";
    _channel = pref.getString(KEY_CHANNEL);
    _serialPort = pref.getString(KEY_SERIAL_PORT);
    _baudRate = pref.getString(KEY_BAUDRATE) ?? "9600";
    if (_type == CommSettingType.UART) {
      await getUARTDevices();
      if (uartDevices.isEmpty) {
        _serialPort = "";
      }
    }
    notifyListeners();
  }

  Future setAIDLSetting() async {
    await POSLinkSetApi().setAIDLSetting();
  }

  Future setTCPSetting() async {
    await POSLinkSetApi().setTCPSetting(TCPSetting()
      ..timeout = _timeout
      ..ip = _ip
      ..port = _port);
  }

  Future setHTTPSetting() async {
    await POSLinkSetApi().setHttpSetting(HttpSetting()
      ..timeout = _timeout
      ..ip = _ip
      ..port = _port);
  }

  Future setHTTPSSetting() async {
    await POSLinkSetApi().setHttpsSetting(HttpsSetting()
      ..timeout = _timeout
      ..ip = _ip
      ..port = _port);
  }

  Future setSSLSetting() async {
    await POSLinkSetApi().setSslSetting(SslSetting()
      ..timeout = _timeout
      ..ip = _ip
      ..port = _port);
  }

  Future setUSBSetting() async {
    await POSLinkSetApi().setUsbSetting(UsbSetting()
      ..timeout = _timeout
      ..channel = _channel);
  }

  Future setUARTSetting() async {
    await POSLinkSetApi().setUartSetting(UartSetting()
      ..timeout = _timeout
      ..serialPort = _serialPort
      ..baudRate = _baudRate);
  }

  Future getUARTDevices() async {
    uartDevices = await POSLinkSetApi().getUartDevices();
  }

  Future cancel() async {
    await POSLinkSetApi().cancel();
  }

  Future setSetting() async {
    switch (_type) {
      case CommSettingType.TCP:
        await setTCPSetting();
        break;
      case CommSettingType.AIDL:
        await setAIDLSetting();
        break;
      // case CommSettingType.HTTP:
      //   await setHTTPSetting();
      //   break;
      // case CommSettingType.HTTPS:
      //   await setHTTPSSetting();
      //   break;
      case CommSettingType.SSL:
        await setSSLSetting();
        break;
      case CommSettingType.USB:
        await setUSBSetting();
        break;
      case CommSettingType.UART:
        await setUARTSetting();
        break;
      default:
        break;
    }
  }
}
