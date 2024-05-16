/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2021/12/7
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2021/12/7              paxhz                       Create
 * ============================================================================
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poslink2/widget/string_list_page.dart';
import 'package:flutter/services.dart';
import '../res/colors.dart';
import '../res/dimension.dart';
import 'display_textfield.dart';

class StringListItem extends StatelessWidget {
  const StringListItem({
    Key? key,
    this.level = 0,
    this.labelText = '',
    this.callback,
    this.dataList = const [],
    this.type = 1, //1 request , 2 response
  }) : super(key: key);

  final int level;
  final String labelText;
  final Function? callback;
  final List<String> dataList;
  final int type;

  String _appendData(List<String> list) {
    String string = '';
    for (int i = 0; i < list.length; i++) {
      string = string + list[i];
      if (i < list.length - 1) {
        string = string + ',' + '\n';
      }
    }
    return string;
  }

  @override
  Widget build(BuildContext context) {
    if (type == 1) {
      return InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StringListPage(
                title: labelText,
                stringList: dataList,
                callback: (List<String> value) {
                  if (callback != null) {
                    callback!(value);
                  }
                },
              ),
            ),
          );
        },
        child: Container(
          height: 100,
          child: Padding(
            padding: EdgeInsets.only(
              left: level * kHorizontalPadding,
              right: kHorizontalPadding,
              top: kTextFVPadding,
              bottom: kTextFVPadding,
            ),
            child: Row(
              children: [
                Text(
                  labelText,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    dataList == null ? "item count: 0" : "item count: ${dataList.length}",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: level * kHorizontalPadding),
            child: Text(
              '${labelText}:',
              style: kMainLabelStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: level * kHorizontalPadding, right: kHorizontalPadding),
            child: GestureDetector(
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: _appendData(dataList)));
                Fluttertoast.showToast(msg: "Copy to clipboard successful");
              },
              child: Text(
                _appendData(dataList),
                style: kMainUserInputStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
