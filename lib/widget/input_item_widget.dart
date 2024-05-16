/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2021/11/11
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2021/11/11              paxhz                       Create
 * ============================================================================
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poslink2/log/dart_log.dart';
import 'package:poslink2/res/colors.dart';
import 'package:poslink2/res/dimension.dart';
import 'package:poslink2/widget/display_textfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputItem extends StatefulWidget {
  const InputItem({
    @required this.level,
    @required this.labelText,
    @required this.initValue,
    @required this.updateInput,
    @required this.enable,
    this.color,
    Key? key,
  }) : super(key: key);
  final int? level;
  final String? labelText;
  final String? initValue;
  final Function? updateInput;
  final bool? enable;
  final Color? color;
  @override
  _InputItemState createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  late String _text;

  @override
  Widget build(BuildContext context) {
    _text = widget.initValue == null ? '' : widget.initValue!;

    if (widget.enable == true) {
      return Container(
        height: 100,
        child: Padding(
          padding: EdgeInsets.only(
            left: widget.level! * kHorizontalPadding,
            right: kHorizontalPadding,
            top: kTextFVPadding,
            bottom: kTextFVPadding,
          ),
          child: TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                  text: _text,
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: _text.length))),
            ),
            textInputAction: TextInputAction.done,
            enabled: widget.enable!,
            decoration: InputDecoration(
              label: Text(
                widget.labelText!,
                style: kMainLabelStyle,
              ),
              // hintText: 'Input ${widget.labelText!}',
              // hintStyle: TextStyle(
              //   color: Colors.black26,
              //   fontSize: 12,
              // ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: kMainColor),
              ),
            ),
            onChanged: (value) {
              widget.updateInput!(value);
            },
          ),
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: widget.level! * kHorizontalPadding),
            child: Container(
              child: Text(
                '${widget.labelText!}:',
                style: kMainLabelStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: widget.level! * kHorizontalPadding, right: kHorizontalPadding),
            child: Container(
              child: InkWell(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: _text));
                  Fluttertoast.showToast(msg: "Copy to clipboard successful");
                },
                child: Text(
                  _text,
                  style: kMainUserInputStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
