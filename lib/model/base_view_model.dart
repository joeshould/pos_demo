/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2021/11/12
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2021/11/12              paxhz                       Create
 * ============================================================================
 */

import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_admin_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_admin_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_batch_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_batch_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_data_source/auto_device_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_device_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_report_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_report_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_transaction_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_transaction_response_data_source.dart';
import 'package:poslink2/log/dart_log.dart';
import 'package:poslink2/model/request_db.dart';
import 'package:poslink2/model/response_db.dart';
import 'package:provider/src/provider.dart';

import '../auto_data_source/auto_form_request_data_source.dart';
import '../auto_data_source/auto_form_response_data_source.dart';

enum Command {
  TRANSACTION,
  ADMIN,
  BATCH,
  REPORT,
  DEVICE,
  FORM,
}

class BaseViewModel extends ChangeNotifier {
  Command _command = Command.TRANSACTION;

  /// 1 request 2 response
  int? type;
  List<Map>? _dataSource;
  List<Map>? _showSource;

  void initData(List<Map> list, Command command) {
    if (_dataSource == null) {
      _dataSource = list;
      _command = command;
      _updateShowList();
    }
  }

  set setDataSource(List<Map>? value) {
    _dataSource = value;
    _updateShowList();
  }

  void updateShow(String selectName, int selectLevel, String id) {
    _dataSource!.forEach((map) {
      if (map[kLevel] == 1) {
        map[kShow] = true;
      } else {
        if (map[kSuperGroupName] == selectName &&
            map[kLevel] == selectLevel + 1) {
          bool show = map[kShow];
          map[kShow] = show == true ? false : true;
        }
      }
      if (map[kType] == DataItemType.Group && map[kID] == id) {
        map[kGroupArrowOpen] = !map[kGroupArrowOpen];
      }
    });
    _updateShowList();
  }

  /// todo 如果是list<model>这种 需要特殊处理其赋值
  void updateValue(String id, dynamic value, RequestDataBase requestDataBase) {
    if (value.runtimeType == TransactionCommand) return;
    if (value.runtimeType == AdminCommand) return;
    if (value.runtimeType == BatchCommand) return;
    if (value.runtimeType == DeviceCommand) return;
    if (value.runtimeType == ReportCommand) return;
    if (value.runtimeType == FormCommand) return;

    /// update _dataSource
    for (int i = 0; i < _dataSource!.length; i++) {
      Map element = _dataSource![i];
      if (element[kID] == id) {
        element[kValue] = value;
        break;
      }
    }
    _updateShowList();

    if (_command == Command.TRANSACTION) {
      requestDataBase.setTransactionData = _dataSource;
    } else if (_command == Command.ADMIN) {
      requestDataBase.setAdminData = _dataSource;
    } else if (_command == Command.BATCH) {
      requestDataBase.setBatchData = _dataSource;
    } else if (_command == Command.DEVICE) {
      requestDataBase.setDeviceData = _dataSource;
    } else if (_command == Command.REPORT) {
      requestDataBase.setReportData = _dataSource;
    } else if (_command == Command.FORM) {
      requestDataBase.setFormData = _dataSource;
    }
  }

  void checkCmd(BuildContext context, String id, dynamic value) {
    RequestDataBase requestDataBase = context.read<RequestDataBase>();
    ResponseDataBase responseDataBase = context.read<ResponseDataBase>();

    switch (value.runtimeType) {
      case TransactionCommand:

        /// request
        List<Map> requestList =
            TransactionReqData.queryDataByString(value.toString())!;
        _dataSource = requestList;
        Map firstMap = _dataSource!.first;
        firstMap[kValue] = value;
        requestDataBase.setTransactionData = requestList;

        /// response
        List<Map> rspList =
            TransactionRspData.queryDataByString(value.toString())!;
        responseDataBase.setTransactionData = rspList;
        break;
      case AdminCommand:

        /// request
        List<Map> requestList =
            AdminReqData.queryDataByString(value.toString())!;
        _dataSource = requestList;
        Map firstMap = _dataSource!.first;
        firstMap[kValue] = value;
        requestDataBase.setAdminData = requestList;

        /// response
        List<Map> rspList = AdminRspData.queryDataByString(value.toString())!;
        responseDataBase.setAdminData = rspList;
        break;
      case BatchCommand:

        /// request
        List<Map> requestList =
            BatchReqData.queryDataByString(value.toString())!;
        _dataSource = requestList;
        Map firstMap = _dataSource!.first;
        firstMap[kValue] = value;
        requestDataBase.setBatchData = requestList;

        /// response
        List<Map> rspList = BatchRspData.queryDataByString(value.toString())!;
        responseDataBase.setBatchData = rspList;
        break;
      case DeviceCommand:

        /// request
        List<Map> requestList =
            DeviceReqData.queryDataByString(value.toString())!;
        _dataSource = requestList;
        Map firstMap = _dataSource!.first;
        firstMap[kValue] = value;
        requestDataBase.setDeviceData = requestList;

        /// response
        List<Map> rspList = DeviceRspData.queryDataByString(value.toString())!;
        responseDataBase.setDeviceData = rspList;
        break;
      case ReportCommand:

        /// request
        List<Map> requestList =
            ReportReqData.queryDataByString(value.toString())!;
        _dataSource = requestList;
        Map firstMap = _dataSource!.first;
        firstMap[kValue] = value;
        requestDataBase.setReportData = requestList;

        /// response
        List<Map> rspList = ReportRspData.queryDataByString(value.toString())!;
        responseDataBase.setReportData = rspList;
        break;
      case FormCommand:

        /// request
        List<Map> requestList =
            FormReqData.queryDataByString(value.toString())!;
        _dataSource = requestList;
        Map firstMap = _dataSource!.first;
        firstMap[kValue] = value;
        requestDataBase.setFormData = requestList;

        /// response
        List<Map> rspList = FormRspData.queryDataByString(value.toString())!;
        responseDataBase.setFormData = rspList;
        break;
      default:
        break;
    }
    _updateShowList();
  }

  get showList {
    return _showSource;
  }

  get dataSource {
    return _dataSource;
  }

  void notifiy() {
    notifyListeners();
  }

  void _updateShowList() {
    List<Map> list = [];
    _dataSource!.forEach((element) {
      if (element[kShow] == true) {
        list.add(element);
      }
    });
    _showSource = list;
    notifyListeners();
  }

  @override
  void dispose() {
    Log.v('dealloc');
    super.dispose();
  }
}
