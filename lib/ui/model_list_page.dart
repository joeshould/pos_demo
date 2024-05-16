import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/res/colors.dart';
import 'package:poslink2/res/dimension.dart';
import 'package:poslink2/ui/model_list_item_add_dialog.dart';

import '../widget/display_textfield.dart';

class ModelListPage extends StatefulWidget {
  const ModelListPage({
    this.title = '',
    this.className = '',
    required this.propertys,
    this.itemList = const [],
    this.needAddAction = true,
    @required this.callback,
  });

  final bool needAddAction;
  final String className;
  final String title;
  final List<Map<String, dynamic>> propertys;
  final List<List<Map<String, dynamic>>> itemList;
  final Function? callback;

  @override
  State<StatefulWidget> createState() => _ModelListPageState();
}

class _ModelListPageState extends State<ModelListPage> {
  late List<List<Map<String, dynamic>>> _dataSource;
  List<int> closeList = [];

  @override
  void initState() {
    _dataSource = [];
    _dataSource.addAll(widget.itemList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.callback!(_dataSource);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          title: Text(widget.className),
          leading: InkWell(
            onTap: () {
              widget.callback!(_dataSource);
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          // doing
          actions: widget.needAddAction == true
              ? [
                  IconButton(
                    onPressed: () {
                      List<Map<String, dynamic>> _tempList = [];
                      widget.propertys.forEach((element) {
                        Map<String, dynamic> map = {};
                        map[kType] = element[kType];
                        map[kID] = element[kID];
                        map[kName] = element[kName];
                        map[kValue] = element[kValue];
                        _tempList.add(map);
                      });

                      showDialog(
                        context: context,
                        builder: (context) => ModelListItemAddDialog(
                          data: _tempList,
                          refresh: () {
                            setState(() {
                              _dataSource.add(_tempList);
                            });
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ]
              : null,
        ),
        body: ListView.builder(
          itemCount: _dataSource.length,
          itemBuilder: (BuildContext context, int index) {
            List<Map<String, dynamic>> subList = _dataSource[index];
            return Dismissible(
              key: UniqueKey(),
              child: Padding(
                padding: EdgeInsets.all(kHorizontalPadding),
                child: ExpansionTile(
                  title: Text(
                    '${widget.className} -  ${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  initiallyExpanded: !closeList.contains(index),
                  onExpansionChanged: (bool expanded) {
                    expanded ? closeList.remove(index) : closeList.add(index);
                  },
                  children: subList.map((map) {
                    DataItemType requestItemType = map[kType];
                    if (requestItemType == DataItemType.CellInput) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kHorizontalPadding),
                            child: Text(
                              map[kName],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DisplayTextField(
                            text: map[kValue] ?? "",
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        color: Colors.red,
                        height: 50,
                        child: Text('undefined: $requestItemType'),
                      );
                    }
                  }).toList(),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return widget.needAddAction;
              },
              onDismissed: (direction) {
                setState(() {
                  _dataSource.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('${widget.className} -  ${index + 1} dismissed')));
              },
              background: widget.needAddAction
                  ? Container(
                      color: Colors.red,
                      child: ListTile(
                        title: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
