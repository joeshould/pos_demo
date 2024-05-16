import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/res/colors.dart';
import 'package:poslink2/res/dimension.dart';
import 'package:poslink2/widget/model_list_page.dart';
import 'menu_item_widget.dart';

class ModelListItemAddDialog extends Dialog {
  const ModelListItemAddDialog({
    required this.data,
    this.refresh,
  });

  final List<Map<String, dynamic>> data;
  final Function? refresh;

  Text _getNumberText(Map<String, dynamic> itemData) {
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
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
                    dynamic name = itemData[kName];
                    dynamic val = itemData[kValue];
                    if (type == DataItemType.CellInput) {
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
                    } else if (type == DataItemType.ModelList) {
                      return InkWell(
                        onTap: () async {
                          List<List<Map<String, dynamic>>> _currentItemList = [];
                          if (itemData[kData] != null) {
                            _currentItemList.addAll(itemData[kData]);
                          }
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ModelListPage(
                                title: name,
                                className: name,
                                propertys: val,
                                itemList: _currentItemList,
                                callback: (List<List<Map<String, dynamic>>> value) {
                                  itemData[kData] = value;
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                            child: Row(
                              children: [
                                Text(
                                  name,
                                  style: kMainLabelStyle,
                                ),
                                Expanded(
                                  child: Center(
                                    child: _getNumberText(itemData),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (type == DataItemType.Menu) {
                      return MenuItemView(
                        title: itemData[kName],
                        selectedCallback: (value) {
                          itemData[kValue] = value;
                        },
                        list: itemData[kData],
                        initValue: itemData[kValue],
                        menuBtnKeyString: '',
                        level: itemData[kLevel],
                        type: 1,
                      );
                    } else {
                      return Container(
                        height: 80,
                        color: Colors.orange,
                        child: Center(child: Text(type == null ? "Name $name has no type" : "Type $type is not implemented")),
                      );
                    }
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
