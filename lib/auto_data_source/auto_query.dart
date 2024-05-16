/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) Co., Ltd. PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) Co., Ltd. and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2023 PAX Computer Technology(Shenzhen) Co., Ltd. All rights reserved.
 * ============================================================================
 */

import 'auto_data_source_common.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_transaction.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_form.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_admin.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_batch.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_report.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_device.dart';


class RequestListModelQuery {
  static dynamic query(String id, List<Map> list) {
   if (id == 'Admin_Request_SetConfigurationReq-configurations') {
     List<List<Map<String, dynamic>>>? dataList;
     for (int i = 0; i < list.length; i++) {
       Map element = list[i];
       if (element[kID] == id) {
         dataList = element[kData];
         break;
       }
     }
     if (dataList == null) {
       return null;
     }
     List<AdminSConfigurationInfo> resList = [];
     dataList.forEach((List<Map<String, dynamic>> subList) {
       AdminSConfigurationInfo adminSConfigurationInfo = AdminSConfigurationInfo();
       subList.forEach((Map<String, dynamic> jsonObject) {
         String name = jsonObject[kName];
         dynamic subValue = jsonObject[kValue];
           switch (name) {
             case 'name':
               adminSConfigurationInfo.name = subValue;
               break;
             case 'value':
               adminSConfigurationInfo.value = subValue;
               break;
           }
       });
       resList.add(adminSConfigurationInfo);
     });
     return resList;
   }
    dynamic value;
    for (int i = 0; i < list.length; i++) {
      Map element = list[i];
      if (element[kID] == id) {
        value = element[kValue];
        break;
      }
    }
    return value;
  }
}


class ListStringQuery {
  static dynamic query(String id, List<Map> list) {
    for (int i = 0; i < list.length; i++) {
      Map element = list[i];
      if (element[kID] == id) {
        return element[kData];
      }
    }
  }
}




class GroupQuery {
  static bool queryIfNull(String id, List<Map> list) {
    for (int i = 0; i < list.length; i++) {
      Map element = list[i];
      if (element[kID] == id) {
        if (element[kType] == DataItemType.Group && element[kGroupArrowOpen] == false && element[kBitmapEnable] == false) {
          return true;
        }
      }
    }
    return false;
  }
}




class ResponseListModelQuery {
  static List<List<Map<String, dynamic>>>? query(String id, List<dynamic> modelList) {
    List<List<Map<String, dynamic>>>? res = [];
    for (int i = 0; i < modelList.length; i++) {
      List<Map<String, dynamic>> subList = [];
     if (id == 'Admin_Response_GetConfigurationRsp-configurations') {
       AdminGConfigurationInfo adminGConfigurationInfo = modelList[i];
       /// name
       Map<String, dynamic> name = {};
       name[kID] = id + '-' + 'name';
       name[kValue] = adminGConfigurationInfo.name;
       name[kType] = DataItemType.CellInput;
       name[kEnable] = false;
       name[kLevel] = 1;
       name[kName] = 'name';
       name[kShow] = true;
       subList.add(name);
       /// value
       Map<String, dynamic> value = {};
       value[kID] = id + '-' + 'value';
       value[kValue] = adminGConfigurationInfo.value;
       value[kType] = DataItemType.CellInput;
       value[kEnable] = false;
       value[kLevel] = 1;
       value[kName] = 'value';
       value[kShow] = true;
       subList.add(value);
      }
     if (id == 'Report_Response_GetTraceInfoByCardRsp-traceInfo') {
       ReportTraceInfo reportTraceInfo = modelList[i];
       /// registerReferenceNumber
       Map<String, dynamic> registerReferenceNumber = {};
       registerReferenceNumber[kID] = id + '-' + 'registerReferenceNumber';
       registerReferenceNumber[kValue] = reportTraceInfo.registerReferenceNumber;
       registerReferenceNumber[kType] = DataItemType.CellInput;
       registerReferenceNumber[kEnable] = false;
       registerReferenceNumber[kLevel] = 1;
       registerReferenceNumber[kName] = 'registerReferenceNumber';
       registerReferenceNumber[kShow] = true;
       subList.add(registerReferenceNumber);
       /// hostReferenceNumber
       Map<String, dynamic> hostReferenceNumber = {};
       hostReferenceNumber[kID] = id + '-' + 'hostReferenceNumber';
       hostReferenceNumber[kValue] = reportTraceInfo.hostReferenceNumber;
       hostReferenceNumber[kType] = DataItemType.CellInput;
       hostReferenceNumber[kEnable] = false;
       hostReferenceNumber[kLevel] = 1;
       hostReferenceNumber[kName] = 'hostReferenceNumber';
       hostReferenceNumber[kShow] = true;
       subList.add(hostReferenceNumber);
      }
      res.add(subList);
    }
    return res;
  }
}
