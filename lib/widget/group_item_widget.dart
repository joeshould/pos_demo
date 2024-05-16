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

import 'package:flutter/material.dart';
import 'package:poslink2/res/colors.dart';
import 'package:poslink2/res/dimension.dart';

class GroupItem extends StatefulWidget {
  const GroupItem({
    Key? key,
    @required this.open,
    @required this.groupName,
    @required this.level,
    @required this.groupInfoCallback,
  }) : super(key: key);

  final bool? open;
  final String? groupName;
  final Function? groupInfoCallback;

  final int? level;
  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kCellHeight,
      child: Padding(
        padding: EdgeInsets.only(
            left: widget.level! * kArrowLeadingHorizontalPadding,
            right: kHorizontalPadding),
        child: InkWell(
          onTap: () {
            widget.groupInfoCallback!();
          },
          child: Row(
            children: [
              Icon(widget.open == true
                  ? Icons.arrow_drop_down
                  : Icons.arrow_right),
              Text(
                widget.groupName!,
                style: kMainLabelStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
