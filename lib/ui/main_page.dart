import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poslink2/generated/l10n.dart';
import 'package:poslink2/model/admin_view_model.dart';
import 'package:poslink2/model/batch_view_model.dart';
import 'package:poslink2/model/comm_setting_view_model.dart';
import 'package:poslink2/model/device_view_model.dart';
import 'package:poslink2/model/form_view_model.dart';
import 'package:poslink2/model/log_setting_view_model.dart';
import 'package:poslink2/model/report_view_model.dart';
import 'package:poslink2/model/request_db.dart';
import 'package:poslink2/model/response_db.dart';
import 'package:poslink2/model/transaction_view_model.dart';
import 'package:poslink2/res/colors.dart';
import 'package:poslink2/ui/admin_view.dart';
import 'package:poslink2/ui/batch_view.dart';
import 'package:poslink2/ui/device_view.dart';
import 'package:poslink2/ui/form_view.dart';
import 'package:poslink2/ui/log_setting_view.dart';
import 'package:poslink2/ui/report_view.dart';
import 'package:poslink2/ui/setting_view.dart';
import 'package:poslink2/ui/test_view.dart';
import 'package:poslink2/ui/transaction_view.dart';
import 'package:provider/provider.dart';

import '../model/report_status_view_model.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loading = false;
  bool cancelling = false;

  late TransactionViewModel transactionViewModel;
  late AdminViewModel adminViewModel;
  late BatchViewModel batchViewModel;
  late LogSettingViewModel logSettingViewModel;
  late DeviceViewModel deviceViewModel;
  late ReportViewModel reportViewModel;
  late FormViewModel formViewModel;
  late RequestDataBase requestDataBase;
  late ResponseDataBase responseDataBase;
  late ReportStatusViewModel reportStatusViewModel;

  /// Global key
  final GlobalKey<TransactionViewState> _transactionKey = GlobalKey();
  final GlobalKey<AdminViewState> _adminKey = GlobalKey();
  final GlobalKey<BatchViewState> _batchKey = GlobalKey();
  final GlobalKey<DeviceViewState> _deviceKey = GlobalKey();
  final GlobalKey<ReportViewState> _reportKey = GlobalKey();
  final GlobalKey<FormViewState> _formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    transactionViewModel = context.read<TransactionViewModel>();
    adminViewModel = context.read<AdminViewModel>();
    batchViewModel = context.read<BatchViewModel>();
    logSettingViewModel = context.read<LogSettingViewModel>();
    deviceViewModel = context.read<DeviceViewModel>();
    reportViewModel = context.read<ReportViewModel>();
    formViewModel = context.read<FormViewModel>();
    requestDataBase = context.read<RequestDataBase>();
    responseDataBase = context.read<ResponseDataBase>();
    reportStatusViewModel = context.read<ReportStatusViewModel>();

    super.initState();
  }

  void showMsg(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.of(context).confirm),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommSettingViewModel>(
      builder: (context, viewModel, child) {
        String title = "";
        Widget? child;
        switch (viewModel.currentTab) {
          case CommSettingViewModel.TAB_PAYMENT:
            title = 'Transaction';
            child = TransactionView(
              key: _transactionKey,
            );
            break;
          case CommSettingViewModel.TAB_ADMIN:
            title = 'Admin';
            child = AdminView(
              key: _adminKey,
            );
            break;
          case CommSettingViewModel.TAB_BATCH:
            title = 'Batch';
            child = BatchView(
              key: _batchKey,
            );
            break;
          case CommSettingViewModel.TAB_DEVICE:
            title = 'Device';
            child = DeviceView(
              key: _deviceKey,
            );
            break;
          case CommSettingViewModel.TAB_REPORT:
            title = 'Report';
            child = ReportView(
              key: _reportKey,
            );
            break;
          case CommSettingViewModel.TAB_FORM:
            title = 'Form';
            child = FormView(
              key: _formKey,
            );
            break;
          case CommSettingViewModel.TAB_LOG_SETTING:
            title = 'Log Setting';
            child = LogSettingView();
            break;
          case CommSettingViewModel.TAB_COMM_SETTING:
            title = 'Setting';
            child = SettingView();
            break;
          case CommSettingViewModel.TAB_TEST:
            title = 'Test';
            child = TestView();
            break;
        }

        /// stop start button
        List<Widget> actionList = [];

        if (viewModel.currentTab == CommSettingViewModel.TAB_LOG_SETTING) {
          actionList.add(IconButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              logSettingViewModel.save();
              Fluttertoast.showToast(msg: "Saved");
            },
            icon: Icon(Icons.done),
          ));
        } else if (viewModel.currentTab !=
                CommSettingViewModel.TAB_COMM_SETTING &&
            viewModel.currentTab != CommSettingViewModel.TAB_TEST) {
          if (loading) {
            /// tcp stop action
            if (!cancelling) {
              actionList.add(IconButton(
                onPressed: () async {
                  await viewModel.cancel();
                  setState(() {
                    cancelling = true;
                  });
                },
                icon: Icon(Icons.stop),
              ));
            }
            actionList.add(Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ));
          } else {
            actionList.add(IconButton(
              onPressed: () async {
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  loading = true;
                });
                reportStatusViewModel.stop = false;
                reportStatusViewModel.startPolling();
                try {
                  if (viewModel.currentTab ==
                      CommSettingViewModel.TAB_PAYMENT) {
                    await transactionViewModel.start(viewModel,
                        responseDataBase, requestDataBase.transactionData!);
                    _transactionKey.currentState!.updateTab(1);
                    reportStatusViewModel.stop = true;
                  } else if (viewModel.currentTab ==
                      CommSettingViewModel.TAB_ADMIN) {
                    await adminViewModel.start(viewModel, responseDataBase,
                        requestDataBase.adminData!);
                    _adminKey.currentState!.updateTab(1);
                    reportStatusViewModel.stop = true;
                  } else if (viewModel.currentTab ==
                      CommSettingViewModel.TAB_BATCH) {
                    await batchViewModel.start(viewModel, responseDataBase,
                        requestDataBase.batchData!);
                    _batchKey.currentState!.updateTab(1);
                    reportStatusViewModel.stop = true;
                  } else if (viewModel.currentTab ==
                      CommSettingViewModel.TAB_DEVICE) {
                    await deviceViewModel.start(viewModel, responseDataBase,
                        requestDataBase.deviceData!);
                    _deviceKey.currentState!.updateTab(1);
                    reportStatusViewModel.stop = true;
                  } else if (viewModel.currentTab ==
                      CommSettingViewModel.TAB_REPORT) {
                    await reportViewModel.start(viewModel, responseDataBase,
                        requestDataBase.reportData!);
                    _reportKey.currentState!.updateTab(1);
                    reportStatusViewModel.stop = true;
                  } else if (viewModel.currentTab ==
                      CommSettingViewModel.TAB_FORM) {
                    await formViewModel.start(
                        viewModel, responseDataBase, requestDataBase.formData!);
                    _formKey.currentState!.updateTab(1);
                    reportStatusViewModel.stop = true;
                  }
                } catch (e, stackTrace) {
                  print(e);
                  print(stackTrace);
                  showMsg(e.toString());
                }
                setState(() {
                  loading = false;
                  cancelling = false;
                });
              },
              icon: Icon(Icons.play_arrow),
            ));
          }
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            elevation: 0,
            title: Text(title),
            actions: actionList,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: "",
                );
              },
            ),
          ),
          drawer: Drawer(
            child: IgnorePointer(
              ignoring: loading,
              child: ListView(
                children: [
                  ListTile(
                    leading: Image(
                      image: AssetImage("images/Transaction.png"),
                      width: 20,
                    ),
                    title: Text('Transaction'),
                    onTap: () {
                      viewModel.currentTab = CommSettingViewModel.TAB_PAYMENT;
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage("images/Manage.png"),
                      width: 20,
                    ),
                    title: Text('Admin'),
                    onTap: () {
                      viewModel.currentTab = CommSettingViewModel.TAB_ADMIN;
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage("images/Batch.png"),
                      width: 20,
                    ),
                    title: Text('Batch'),
                    onTap: () {
                      viewModel.currentTab = CommSettingViewModel.TAB_BATCH;
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage("images/Device.png"),
                      width: 20,
                    ),
                    title: Text('Device'),
                    onTap: () {
                      viewModel.currentTab = CommSettingViewModel.TAB_DEVICE;
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage("images/Report.png"),
                      width: 20,
                    ),
                    title: Text('Report'),
                    onTap: () {
                      viewModel.currentTab = CommSettingViewModel.TAB_REPORT;
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Image(
                      image: AssetImage("images/Form.png"),
                      width: 20,
                    ),
                    title: Text('Form'),
                    onTap: () {
                      viewModel.currentTab = CommSettingViewModel.TAB_FORM;
                      Navigator.of(context).pop();
                    },
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.bug_report),
                  //   title: Text('Test'),
                  //   onTap: () {
                  //     viewModel.currentTab = CommSettingViewModel.TAB_TEST;
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Log Setting'),
                    onTap: () {
                      viewModel.currentTab =
                          CommSettingViewModel.TAB_LOG_SETTING;
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                    onTap: () {
                      viewModel.currentTab =
                          CommSettingViewModel.TAB_COMM_SETTING;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
          body: IgnorePointer(
            ignoring: loading,
            child: child,
          ),
        );
      },
    );
  }
}
