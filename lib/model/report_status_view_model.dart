/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2022/10/14
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2022/10/14              paxhz                       Create
 * ============================================================================
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_report_status.dart';
import 'package:poslink2/log/dart_log.dart';

class ReportStatusViewModel extends ChangeNotifier {
  bool? stop;

  startPolling() {
    if(Platform.isAndroid) {
      return;
    }
    Timer.periodic(Duration(milliseconds: 100), (timer) async {
      if (stop == true) {
        timer.cancel();
      } else {
        String value = await _start();
        Fluttertoast.showToast(msg: value);
      }
    });
  }

  Future<String> _start() async {
    POSLinkGetReportStatusApi api = POSLinkGetReportStatusApi();
    int value = await api.getReportStatus();
    return value.toString();
  }
}
