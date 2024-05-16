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
import 'package:poslink2/auto_pigeon/poslink_sdk_device.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class DeviceRspData {
  static List<Map> initSourceData() {
    return DeviceRspData.mifareClassicReadData();
  }
  static List<Map> mifareClassicGetUIDData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicGetUIDRsp-responseCode',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseMessage',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicGetUIDRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'uid',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicGetUIDRsp-uid',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspDeviceMifareClassicGetUIDRsp(DeviceMifareClassicGetUIDRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicGetUIDRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = DeviceRspData._parseDeviceMifareClassicGetUIDRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicGetUIDRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = DeviceRspData._parseDeviceMifareClassicGetUIDRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicGetUIDRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseDeviceMifareClassicGetUIDRsp(String id, DeviceMifareClassicGetUIDRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Device_Response_MifareClassicGetUIDRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Device_Response_MifareClassicGetUIDRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Device_Response_MifareClassicGetUIDRsp-uid':
             result = rsp.uid;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> mifareClassicWriteData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicWriteRsp-responseCode',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseMessage',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicWriteRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspDeviceMifareClassicWriteRsp(DeviceMifareClassicWriteRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicWriteRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = DeviceRspData._parseDeviceMifareClassicWriteRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicWriteRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = DeviceRspData._parseDeviceMifareClassicWriteRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicWriteRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseDeviceMifareClassicWriteRsp(String id, DeviceMifareClassicWriteRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Device_Response_MifareClassicWriteRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Device_Response_MifareClassicWriteRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> mifareClassicReadData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicReadRsp-responseCode',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseMessage',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicReadRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'blockValue',
                kValue: ' ',
                kID: 'Device_Response_MifareClassicReadRsp-blockValue',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspDeviceMifareClassicReadRsp(DeviceMifareClassicReadRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicReadRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = DeviceRspData._parseDeviceMifareClassicReadRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicReadRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = DeviceRspData._parseDeviceMifareClassicReadRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = DeviceRspData._parseDeviceMifareClassicReadRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseDeviceMifareClassicReadRsp(String id, DeviceMifareClassicReadRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Device_Response_MifareClassicReadRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Device_Response_MifareClassicReadRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Device_Response_MifareClassicReadRsp-blockValue':
             result = rsp.blockValue;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'MifareClassicReadReq':
        list = DeviceRspData.mifareClassicReadData();
        break;
      case 'MifareClassicGetUIDReq':
        list = DeviceRspData.mifareClassicGetUIDData();
        break;
      case 'MifareClassicWriteReq':
        list = DeviceRspData.mifareClassicWriteData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
