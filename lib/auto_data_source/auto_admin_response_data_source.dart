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
import 'package:poslink2/auto_pigeon/poslink_sdk_admin.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class AdminRspData {
  static List<Map> initSourceData() {
    return AdminRspData.getTerminalInfoData();
  }
  static List<Map> setConfigurationData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Admin_Response_SetConfigurationRsp-responseCode',
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
                kID: 'Admin_Response_SetConfigurationRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspAdminSetConfigurationRsp(AdminSetConfigurationRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = AdminRspData._parseAdminSetConfigurationRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = AdminRspData._parseAdminSetConfigurationRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = AdminRspData._parseAdminSetConfigurationRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = AdminRspData._parseAdminSetConfigurationRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = AdminRspData._parseAdminSetConfigurationRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseAdminSetConfigurationRsp(String id, AdminSetConfigurationRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Admin_Response_SetConfigurationRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Admin_Response_SetConfigurationRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> getTerminalInfoData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Admin_Response_GetTerminalInfoRsp-responseCode',
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
                kID: 'Admin_Response_GetTerminalInfoRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'sn',
                kValue: ' ',
                kID: 'Admin_Response_GetTerminalInfoRsp-sn',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'modelName',
                kValue: ' ',
                kID: 'Admin_Response_GetTerminalInfoRsp-modelName',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'osVersion',
                kValue: ' ',
                kID: 'Admin_Response_GetTerminalInfoRsp-osVersion',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspAdminGetTerminalInfoRsp(AdminGetTerminalInfoRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = AdminRspData._parseAdminGetTerminalInfoRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = AdminRspData._parseAdminGetTerminalInfoRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = AdminRspData._parseAdminGetTerminalInfoRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = AdminRspData._parseAdminGetTerminalInfoRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = AdminRspData._parseAdminGetTerminalInfoRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseAdminGetTerminalInfoRsp(String id, AdminGetTerminalInfoRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Admin_Response_GetTerminalInfoRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Admin_Response_GetTerminalInfoRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Admin_Response_GetTerminalInfoRsp-sn':
             result = rsp.sn;
             break;
         case 'Admin_Response_GetTerminalInfoRsp-modelName':
             result = rsp.modelName;
             break;
         case 'Admin_Response_GetTerminalInfoRsp-osVersion':
             result = rsp.osVersion;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> resetData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Admin_Response_ResetRsp-responseCode',
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
                kID: 'Admin_Response_ResetRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspAdminResetRsp(AdminResetRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = AdminRspData._parseAdminResetRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = AdminRspData._parseAdminResetRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = AdminRspData._parseAdminResetRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = AdminRspData._parseAdminResetRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = AdminRspData._parseAdminResetRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseAdminResetRsp(String id, AdminResetRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Admin_Response_ResetRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Admin_Response_ResetRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> pingData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Admin_Response_PingRsp-responseCode',
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
                kID: 'Admin_Response_PingRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'rtt',
                kValue: ' ',
                kID: 'Admin_Response_PingRsp-rtt',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspAdminPingRsp(AdminPingRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = AdminRspData._parseAdminPingRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = AdminRspData._parseAdminPingRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = AdminRspData._parseAdminPingRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = AdminRspData._parseAdminPingRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = AdminRspData._parseAdminPingRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseAdminPingRsp(String id, AdminPingRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Admin_Response_PingRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Admin_Response_PingRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Admin_Response_PingRsp-rtt':
             result = rsp.rtt;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> rebootData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Admin_Response_RebootRsp-responseCode',
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
                kID: 'Admin_Response_RebootRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspAdminRebootRsp(AdminRebootRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = AdminRspData._parseAdminRebootRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = AdminRspData._parseAdminRebootRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = AdminRspData._parseAdminRebootRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = AdminRspData._parseAdminRebootRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = AdminRspData._parseAdminRebootRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseAdminRebootRsp(String id, AdminRebootRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Admin_Response_RebootRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Admin_Response_RebootRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> getConfigurationData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Admin_Response_GetConfigurationRsp-responseCode',
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
                kID: 'Admin_Response_GetConfigurationRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kID: 'Admin_Response_GetConfigurationRsp-configurations',
                kType: DataItemType.ModelList,
                kClass: 'GConfigurationInfo',
                kShow: true,
                kName: 'configurations',
                kValue: [
                  {
                    kType: DataItemType.CellInput,
                    kID: 'Admin_Response_GetConfigurationRsp-configurations_name',
                    kName: 'name',
                  },
                  {
                    kType: DataItemType.CellInput,
                    kID: 'Admin_Response_GetConfigurationRsp-configurations_value',
                    kName: 'value',
                  },
                ],
              },
           ];
  }

   static void parseRspAdminGetConfigurationRsp(AdminGetConfigurationRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = AdminRspData._parseAdminGetConfigurationRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = AdminRspData._parseAdminGetConfigurationRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = AdminRspData._parseAdminGetConfigurationRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = AdminRspData._parseAdminGetConfigurationRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = AdminRspData._parseAdminGetConfigurationRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseAdminGetConfigurationRsp(String id, AdminGetConfigurationRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Admin_Response_GetConfigurationRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Admin_Response_GetConfigurationRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Admin_Response_GetConfigurationRsp-configurations':
             result = rsp.configurations;
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
      case 'GetConfigurationReq':
        list = AdminRspData.getConfigurationData();
        break;
      case 'RebootReq':
        list = AdminRspData.rebootData();
        break;
      case 'PingReq':
        list = AdminRspData.pingData();
        break;
      case 'ResetReq':
        list = AdminRspData.resetData();
        break;
      case 'GetTerminalInfoReq':
        list = AdminRspData.getTerminalInfoData();
        break;
      case 'SetConfigurationReq':
        list = AdminRspData.setConfigurationData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
