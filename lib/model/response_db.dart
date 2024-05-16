/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 2021/11/16
 * Module Auth: paxhz
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 2021/11/16              paxhz                       Create
 * ============================================================================
 */
import 'package:flutter/cupertino.dart';
import 'package:poslink2/auto_data_source/auto_admin_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_batch_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_device_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_form_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_report_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_transaction_response_data_source.dart';

class ResponseDataBase extends ChangeNotifier {
  List<Map>? _transactionData;
  List<Map>? _adminData;
  List<Map>? _batchData;
  List<Map>? _deviceData;
  List<Map>? _reportData;
  List<Map>? _formData;

  set setTransactionData(value) {
    _transactionData = value;
  }

  /// 保存着当前transaction界面的表单数据，实时更新
  get transactionData {
    if (_transactionData == null) {
      _transactionData = TransactionRspData.initSourceData();
    }
    return _transactionData;
  }

  set setAdminData(value) {
    _adminData = value;
  }

  get adminData {
    if (_adminData == null) {
      _adminData = AdminRspData.initSourceData();
    }
    return _adminData;
  }

  set setBatchData(value) {
    _batchData = value;
  }

  get batchData {
    if (_batchData == null) {
      _batchData = BatchRspData.initSourceData();
    }
    return _batchData;
  }

  set setDeviceData(value) {
    _deviceData = value;
  }

  get deviceData {
    if (_deviceData == null) {
      _deviceData = DeviceRspData.initSourceData();
    }
    return _deviceData;
  }

  set setReportData(value) {
    _reportData = value;
  }

  get reportData {
    if (_reportData == null) {
      _reportData = ReportRspData.initSourceData();
    }
    return _reportData;
  }

  set setFormData(value) {
    _formData = value;
  }

  get formData {
    if (_formData == null) {
      _formData = FormRspData.initSourceData();
    }
    return _formData;
  }
}
