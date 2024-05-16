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

import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/dimension.dart';

class StringListItemAddDialog extends Dialog {
  const StringListItemAddDialog({
    this.refresh,
    this.labelText = 'Please input',
    @required this.data,
  });
  final Function? refresh;
  final String labelText;
  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 120,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                  child: TextField(
                    onChanged: (value) {
                      data!['data'] = value;
                    },
                    decoration: InputDecoration(
                      hintText: labelText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
