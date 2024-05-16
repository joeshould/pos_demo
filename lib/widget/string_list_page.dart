/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2022/5/10
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2022/5/10              paxhz                       Create
 * ============================================================================
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poslink2/widget/string_list_item_add_dialog.dart';
import 'package:poslink2/widget/display_textfield.dart';

import '../res/colors.dart';
import '../res/dimension.dart';

class StringListPage extends StatefulWidget {
  const StringListPage({
    Key? key,
    this.title = '',
    this.stringList = const [],
    this.callback,
  }) : super(key: key);
  final String title;
  final Function? callback;
  final List<String> stringList;
  @override
  _StringListPageState createState() => _StringListPageState();
}

class _StringListPageState extends State<StringListPage> {
  late List<String> _dataSource;
  double _itemHeight = 60;
  double _titleSizeHeight = 30;

  @override
  void initState() {
    _dataSource = [];
    _dataSource.addAll(widget.stringList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          title: Text('Add ${widget.title}'),
          leading: InkWell(
            onTap: () {
              widget.callback!(_dataSource);
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.check,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Map<String, dynamic> _data = {};
                showDialog(
                  context: context,
                  builder: (context) => StringListItemAddDialog(
                    data: _data,
                    labelText: 'Please input ' + widget.title,
                    refresh: () {
                      setState(() {
                        _dataSource.add(_data['data']);
                      });
                    },
                  ),
                );
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _dataSource.length,
          itemBuilder: (BuildContext context, int index) {
            String subList = _dataSource[index];
            return Dismissible(
              key: UniqueKey(),
              child: Padding(
                padding: EdgeInsets.all(kHorizontalPadding),
                child: InkWell(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => ModelListItemAddDialog(
                    //     data: subList,
                    //   ),
                    // );
                  },
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      color: kMainColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 2 * kHorizontalPadding,
                        child: Column(
                          children: [
                            Container(
                              height: _titleSizeHeight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  '${widget.title} -  ${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DisplayTextField(
                              text: _dataSource[index],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  _dataSource.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text('${widget.title} -  ${index + 1} dismissed')));
              },
              background: new Container(
                color: Colors.red,
                child: new ListTile(
                  title: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
