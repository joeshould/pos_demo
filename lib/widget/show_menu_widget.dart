/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2022/2/15
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2022/2/15              paxhz                       Create
 * ============================================================================
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poslink2/res/dimension.dart';

class ShowMenuWidget extends StatelessWidget {
  const ShowMenuWidget({Key? key, @required this.data, this.refresh}) : super(key: key);

  final List<dynamic>? data;
  final Function? refresh;

  Widget _menuItem(int index, BuildContext context) {
    dynamic value = this.data![index];
    return InkWell(
      onTap: () {
        if (this.refresh != null) {
          this.refresh!(value);
        }
        Navigator.of(context).pop();
      },
      child: Container(
        color: index % 2 == 0 ? Colors.black12 : Colors.black26,
        height: 40.0,
        child: Padding(
          padding: EdgeInsets.only(left: kHorizontalPadding, top: 11),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  _getShowMenuString(value.toString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            height: _getHeight(),
            width: 300,
            color: Colors.white,
            child: Scrollbar(
              child: ListView.builder(
                reverse: true,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return _menuItem(index, context);
                },
              ),
            )),
      ),
    );
  }

  double _getHeight() {
    if (this.data!.length > 8) {
      return 40.0 * 8 + 20.0;
    }
    return 40.0 * this.data!.length;
  }
}
