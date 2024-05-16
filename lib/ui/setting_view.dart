import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poslink2/generated/l10n.dart';
import 'package:poslink2/model/comm_setting_view_model.dart';
import 'package:provider/provider.dart';
import 'package:poslink2/log/dart_log.dart';

class SettingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  late List<String> typeList;

  List<String> baudrateList = ["9600", "115200"];

  @override
  void initState() {
    if (Platform.isAndroid) {
      typeList = [
        "AIDL",
        "TCP",
        "SSL",
        "USB",
        "UART",
      ];
    } else if (Platform.isWindows) {
      typeList = [
        "TCP",
        "SSL",
        "UART",
      ];
    } else {
      typeList = [
        "AIDL",
        "TCP",
        "SSL",
        "USB",
        "UART",
      ];
    }
    super.initState();
  }

  String _getShowMenuString(String string) {
    if (string.contains('.')) {
      List list = string.split('.');
      return list[1];
    }
    return string;
  }

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem<CommSettingType>> popItem = [];
    if (Platform.isAndroid) {
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.AIDL,
          child: Text(typeList[0]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.TCP,
          child: Text(typeList[1]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.SSL,
          child: Text(typeList[2]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.USB,
          child: Text(typeList[3]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.UART,
          child: Text(typeList[4]),
        ),
      );
    } else if (Platform.isWindows) {
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.TCP,
          child: Text(typeList[0]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.SSL,
          child: Text(typeList[1]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.UART,
          child: Text(typeList[2]),
        ),
      );
    } else {
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.AIDL,
          child: Text(typeList[0]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.TCP,
          child: Text(typeList[1]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.SSL,
          child: Text(typeList[2]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.USB,
          child: Text(typeList[3]),
        ),
      );
      popItem.add(
        PopupMenuItem(
          value: CommSettingType.UART,
          child: Text(typeList[4]),
        ),
      );
    }

    return Consumer<CommSettingViewModel>(
      builder: (context, viewModel, child) {
        List<Widget> list = [
          PopupMenuButton(
            tooltip: "",
            itemBuilder: (context) {
              return popItem;
            },
            onSelected: (CommSettingType type) {
              viewModel.type = type;
            },
            offset: Offset(1, 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Comm Type",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(_getShowMenuString(viewModel.type.toString())),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Text(
          //       "Enable JSON",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     Spacer(),
          //     Switch(
          //         value: viewModel.enableJson,
          //         onChanged: (bool newValue) {
          //           setState(() {
          //             viewModel.enableJson = newValue;
          //           });
          //         })
          //   ],
          // ),
        ];

        if (viewModel.type != CommSettingType.AIDL) {
          list.add(TextField(
            controller:
                TextEditingController(text: viewModel.timeout.toString()),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            maxLines: null,
            maxLength: 9,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: S.of(context).timeout,
            ),
            onChanged: (String value) {
              viewModel.timeout = int.parse(value);
            },
            onSubmitted: (String value) {
              viewModel.timeout = int.parse(value);
            },
          ));
        }

        if (viewModel.type == CommSettingType.TCP ||
            // viewModel.type == CommSettingType.HTTP ||
            // viewModel.type == CommSettingType.HTTPS ||
            viewModel.type == CommSettingType.SSL) {
          list.add(TextField(
            controller: TextEditingController(text: viewModel.ip ?? ""),
            keyboardType: TextInputType.number,
            maxLines: null,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: S.of(context).ip,
            ),
            onChanged: (String value) {
              viewModel.ip = value;
            },
            onSubmitted: (String value) {
              viewModel.ip = value;
            },
          ));
          list.add(TextField(
            controller: TextEditingController(text: viewModel.port ?? ""),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            maxLines: null,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: S.of(context).port,
            ),
            onChanged: (String value) {
              viewModel.port = value;
            },
            onSubmitted: (String value) {
              viewModel.port = value;
            },
          ));
        }

        // if (viewModel.type == CommSettingType.USB) {
        //   list.add(TextField(
        //     controller: TextEditingController(text: viewModel.channel ?? ""),
        //     maxLines: null,
        //     textInputAction: TextInputAction.done,
        //     decoration: InputDecoration(
        //       labelText: S
        //           .of(context)
        //           .channel,
        //     ),
        //     onChanged: (String value) {
        //       viewModel.channel = value;
        //     },
        //     onSubmitted: (String value) {
        //       viewModel.channel = value;
        //     },
        //   ));
        // }

        if (viewModel.type == CommSettingType.UART) {
          list.add(viewModel.uartDevices.isNotEmpty
              ? PopupMenuButton(
                  tooltip: "",
                  itemBuilder: (context) {
                    List<PopupMenuItem> menuItemList = [];
                    for (String? name in viewModel.uartDevices) {
                      if (name != null) {
                        menuItemList.add(PopupMenuItem(
                          value: name,
                          child: Text(name),
                        ));
                      }
                    }
                    return menuItemList;
                  },
                  onSelected: (dynamic value) {
                    if (value is String) {
                      viewModel.serialPort = value;
                    }
                  },
                  offset: Offset(1, 30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).serialPort,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(viewModel.serialPort ?? ""),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                )
              : TextField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: viewModel.serialPort ?? "",
                      selection: TextSelection.fromPosition(
                        TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: (viewModel.serialPort ?? "").length,
                        ),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: S.of(context).serialPort,
                  ),
                  onChanged: (String value) {
                    viewModel.serialPort = value;
                  },
                  onSubmitted: (String value) {
                    viewModel.serialPort = value;
                  },
                ));

          list.add(PopupMenuButton(
            tooltip: "",
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: baudrateList[0],
                  child: Text(baudrateList[0]),
                ),
                PopupMenuItem(
                  value: baudrateList[1],
                  child: Text(baudrateList[1]),
                )
              ];
            },
            onSelected: (String baudrate) {
              viewModel.baudRate = baudrate;
            },
            offset: Offset(1, 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Baudrate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(viewModel.baudRate ?? ""),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ));
        }

        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: list,
        );
      },
    );
  }
}
