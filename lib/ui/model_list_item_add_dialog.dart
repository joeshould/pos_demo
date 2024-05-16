import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/log/dart_log.dart';
import 'package:poslink2/res/colors.dart';
import 'package:poslink2/res/dimension.dart';

class ModelListItemAddDialog extends Dialog {
  const ModelListItemAddDialog({
    required this.data,
    this.refresh,
  });

  final List<Map<String, dynamic>> data;
  final Function? refresh;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          color: Colors.white,
          width: 300,
          height: 450,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                  Expanded(child: Center(child: Text("Add"))),
                  IconButton(
                    onPressed: () {
                      if (this.refresh != null) {
                        this.refresh!();
                      }
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.check,
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> itemData = data[index];
                    dynamic type = itemData[kType];
                    String name = itemData[kName];
                    if (type is String) {
                      if (type == "String" || type == "string") {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                          child: TextField(
                            onChanged: (value) {
                              itemData[kValue] = value;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                name,
                                style: kMainLabelStyle,
                              ),
                            ),
                          ),
                        );
                      } else {
                        Log.v('type is $type, not implemented');
                      }
                    } else if (type == DataItemType.CellInput) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                        child: TextField(
                          onChanged: (value) {
                            itemData[kValue] = value;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              name,
                              style: kMainLabelStyle,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container(
                      height: 80,
                      color: Colors.red,
                      child: Center(child: Text(type == null ? "Name $name has no type" : "Type $type is not implemented")),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
