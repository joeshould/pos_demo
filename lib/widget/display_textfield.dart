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
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poslink2/res/dimension.dart';

class DisplayTextField extends StatelessWidget {
  const DisplayTextField({
    Key? key,
    this.text = '',
    this.horPadding = 0,
  }) : super(key: key);

  final String text;
  final double horPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: text));
        Fluttertoast.showToast(msg: "Copy to clipboard successful");
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: horPadding == 0 ? kHorizontalPadding : horPadding,
            right: kHorizontalPadding,
          ),
          child: TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: text,
              ),
            ),
            enabled: false,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
