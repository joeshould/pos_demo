import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/log/dart_log.dart';
import 'package:poslink2/model/base_view_model.dart';
import 'package:poslink2/model/request_db.dart';
import 'package:poslink2/model/response_db.dart';
import 'package:poslink2/widget/group_item_widget.dart';
import 'package:poslink2/widget/input_item_widget.dart';
import 'package:poslink2/widget/model_list_widget.dart';
import 'package:poslink2/widget/string_list_widget.dart';
import 'package:provider/provider.dart';
import 'menu_item_widget.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    @required this.type,
    required this.command,
    Key? key,
  }) : super(key: key);

  final int? type; // 1 request 2 response
  final Command command;

  @override
  Widget build(BuildContext context) {
    RequestDataBase requestDataBase = context.read<RequestDataBase>();
    ResponseDataBase responseDataBase = context.read<ResponseDataBase>();
    return ChangeNotifierProvider(
      create: (context) {
        BaseViewModel? model;
        model = BaseViewModel();
        if (command == Command.TRANSACTION) {
          if (this.type == 1) {
            model.type = 1;
            model.initData(
              requestDataBase.transactionData,
              Command.TRANSACTION,
            );
          } else {
            model.type = 2;
            model.initData(
              responseDataBase.transactionData,
              Command.TRANSACTION,
            );
          }
        } else if (command == Command.ADMIN) {
          if (this.type == 1) {
            model.type = 1;
            model.initData(
              requestDataBase.adminData,
              Command.ADMIN,
            );
          } else {
            model.type = 2;
            model.initData(
              responseDataBase.adminData,
              Command.ADMIN,
            );
          }
        } else if (command == Command.BATCH) {
          if (this.type == 1) {
            model.type = 1;
            model.initData(
              requestDataBase.batchData,
              Command.BATCH,
            );
          } else {
            model.type = 2;
            model.initData(
              responseDataBase.batchData,
              Command.BATCH,
            );
          }
        } else if (command == Command.REPORT) {
          if (this.type == 1) {
            model.type = 1;
            model.initData(
              requestDataBase.reportData,
              Command.REPORT,
            );
          } else {
            model.type = 2;
            model.initData(
              responseDataBase.reportData,
              Command.REPORT,
            );
          }
        } else if (command == Command.DEVICE) {
          if (this.type == 1) {
            model.type = 1;
            model.initData(
              requestDataBase.deviceData,
              Command.DEVICE,
            );
          } else {
            model.type = 2;
            model.initData(
              responseDataBase.deviceData,
              Command.DEVICE,
            );
          }
        } else if (command == Command.FORM) {
          if (this.type == 1) {
            model.type = 1;
            model.initData(
              requestDataBase.formData,
              Command.FORM,
            );
          } else {
            model.type = 2;
            model.initData(
              responseDataBase.formData,
              Command.FORM,
            );
          }
        }

        return model;
      },
      child: BaseRequestWidget(
        type: this.type,
      ),
    );
  }
}

class BaseRequestWidget extends StatefulWidget {
  BaseRequestWidget({
    @required this.type,
    Key? key,
  }) : super(key: key);

  final int? type; // 1 request 2 response

  @override
  _BaseRequestWidgetState createState() => _BaseRequestWidgetState();
}

class _BaseRequestWidgetState extends State<BaseRequestWidget> {
  RequestDataBase? _requestDataBase;
  @override
  void initState() {
    if (widget.type! == 1) {
      _requestDataBase = context.read<RequestDataBase>();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BaseViewModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.showList!.length,
            itemBuilder: (BuildContext context, int index) {
              Map map = model.showList![index];

              /// show
              DataItemType requestItemType = map[kType];

              /// enum cell
              if (requestItemType == DataItemType.Menu) {
                return MenuItemView(
                  menuBtnKeyString: map[kMenuID],
                  key: Key(map[kID]),
                  list: map[kData],
                  title: map[kName],
                  type: widget.type!,
                  selectedCallback: (dynamic value) {
                    map[kValue] = value;
                    model.updateValue(map[kID], value, _requestDataBase!);
                    model.checkCmd(context, map[kID], value);
                  },
                  initValue: map[kValue],
                  level: map[kLevel],
                );
              }

              /// group cell
              else if (requestItemType == DataItemType.Group) {
                return GroupItem(
                  key: Key(map[kID]),
                  open: map[kGroupArrowOpen],
                  groupName: map[kName],
                  level: 1,
                  groupInfoCallback: () {
                    model.updateShow(map[kName], map[kLevel], map[kID]);
                  },
                );
              }

              /// model list
              else if (requestItemType == DataItemType.ModelList) {
                return ModelListItem(
                  key: Key(map[kID]),
                  propertys: map[kValue],
                  level: map[kLevel],
                  labelText: map[kName],
                  enable: map[kEnable],
                  className: map[kClass],
                  itemList: map[kData],
                  callback: (value) {
                    setState(() {
                      map[kData] = value;
                    });
                  },
                );
              }

              /// string list
              else if (requestItemType == DataItemType.StringList) {
                return StringListItem(
                  type: map[kEnable] == true ? 1 : 2,
                  level: map[kLevel],
                  labelText: map[kName],
                  dataList: map[kData] ?? const [],
                  callback: (value) {
                    setState(() {
                      map[kData] = value;
                    });
                  },
                );
              }

              /// input cell
              else {
                return InputItem(
                  key: Key(map[kID]),
                  level: map[kLevel],
                  labelText: map[kName],
                  initValue: map[kValue],
                  enable: map[kEnable],
                  updateInput: (String value) {
                    map[kValue] = value;
                    model.updateValue(map[kID], value, _requestDataBase!);
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
