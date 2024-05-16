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
import 'package:poslink2/auto_pigeon/poslink_sdk_report.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class ReportRspData {
  static List<Map> initSourceData() {
    return ReportRspData.getCardInfoData();
  }
  static List<Map> getTransactionInfoData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Report_Response_GetTransactionInfoRsp-responseCode',
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
                kID: 'Report_Response_GetTransactionInfoRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'status',
                kValue: ' ',
                kID: 'Report_Response_GetTransactionInfoRsp-status',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'hostData',
                kValue: ' ',
                kID: 'Report_Response_GetTransactionInfoRsp-hostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'hostReferenceNumber',
                kValue: ' ',
                kID: 'Report_Response_GetTransactionInfoRsp-hostReferenceNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'timeStamp',
                kValue: ' ',
                kID: 'Report_Response_GetTransactionInfoRsp-timeStamp',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspReportGetTransactionInfoRsp(ReportGetTransactionInfoRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = ReportRspData._parseReportGetTransactionInfoRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = ReportRspData._parseReportGetTransactionInfoRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = ReportRspData._parseReportGetTransactionInfoRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = ReportRspData._parseReportGetTransactionInfoRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = ReportRspData._parseReportGetTransactionInfoRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseReportGetTransactionInfoRsp(String id, ReportGetTransactionInfoRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Report_Response_GetTransactionInfoRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Report_Response_GetTransactionInfoRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Report_Response_GetTransactionInfoRsp-status':
             result = rsp.status;
             break;
         case 'Report_Response_GetTransactionInfoRsp-hostData':
             result = rsp.hostData;
             break;
         case 'Report_Response_GetTransactionInfoRsp-hostReferenceNumber':
             result = rsp.hostReferenceNumber;
             break;
         case 'Report_Response_GetTransactionInfoRsp-timeStamp':
             result = rsp.timeStamp;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> getCardStatusData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Report_Response_GetCardStatusRsp-responseCode',
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
                kID: 'Report_Response_GetCardStatusRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'cardType',
                kValue: ' ',
                kID: 'Report_Response_GetCardStatusRsp-cardType',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'account',
                kValue: ' ',
                kID: 'Report_Response_GetCardStatusRsp-account',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kGroupArrowOpen: true,
                kName: 'accountInformation',
                kValue: '',
                kID: 'Report_Response_GetCardStatusRsp-accountInformation',
                kType: DataItemType.Group,
                kShow: true,
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'expireDate',
                kValue: ' ',
                kID: 'Report_Response_GetCardStatusRsp-accountInformation_expireDate',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'cardType',
                kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType',
                kMenuID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: ReportCardType.NotSet,
                kData: [
                  {
                    kData: ReportCardType.NotSet,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_NotSet',
                  },
                  {
                    kData: ReportCardType.Visa,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_Visa',
                  },
                  {
                    kData: ReportCardType.MasterCard,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_MasterCard',
                  },
                  {
                    kData: ReportCardType.Amex,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_Amex',
                  },
                  {
                    kData: ReportCardType.Discover,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_Discover',
                  },
                  {
                    kData: ReportCardType.DinerClub,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_DinerClub',
                  },
                  {
                    kData: ReportCardType.Cup,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_Cup',
                  },
                  {
                    kData: ReportCardType.Maestro,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_Maestro',
                  },
                  {
                    kData: ReportCardType.Other,
                    kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardType_Other',
                  },
                ],
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'cardTypeName',
                kValue: ' ',
                kID: 'Report_Response_GetCardStatusRsp-accountInformation_cardTypeName',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspReportGetCardStatusRsp(ReportGetCardStatusRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = ReportRspData._parseReportGetCardStatusRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = ReportRspData._parseReportGetCardStatusRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = ReportRspData._parseReportGetCardStatusRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = ReportRspData._parseReportGetCardStatusRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = ReportRspData._parseReportGetCardStatusRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseReportGetCardStatusRsp(String id, ReportGetCardStatusRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Report_Response_GetCardStatusRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Report_Response_GetCardStatusRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Report_Response_GetCardStatusRsp-cardType':
             result = rsp.cardType;
             break;
         case 'Report_Response_GetCardStatusRsp-account':
             result = rsp.account;
             break;
         case 'Report_Response_GetCardStatusRsp-accountInformation':
             result = rsp.accountInformation;
             break;
         case 'Report_Response_GetCardStatusRsp-accountInformation_expireDate':
             result = rsp.accountInformation?.expireDate;
             break;
         case 'Report_Response_GetCardStatusRsp-accountInformation_cardType':
             result = rsp.accountInformation?.cardType;
             break;
         case 'Report_Response_GetCardStatusRsp-accountInformation_cardTypeName':
             result = rsp.accountInformation?.cardTypeName;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> getTraceInfoByCardData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Report_Response_GetTraceInfoByCardRsp-responseCode',
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
                kID: 'Report_Response_GetTraceInfoByCardRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kID: 'Report_Response_GetTraceInfoByCardRsp-traceInfo',
                kType: DataItemType.ModelList,
                kClass: 'TraceInfo',
                kShow: true,
                kName: 'traceInfo',
                kValue: [
                  {
                    kType: DataItemType.CellInput,
                    kID: 'Report_Response_GetTraceInfoByCardRsp-traceInfo_registerReferenceNumber',
                    kName: 'registerReferenceNumber',
                  },
                  {
                    kType: DataItemType.CellInput,
                    kID: 'Report_Response_GetTraceInfoByCardRsp-traceInfo_hostReferenceNumber',
                    kName: 'hostReferenceNumber',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'account',
                kValue: ' ',
                kID: 'Report_Response_GetTraceInfoByCardRsp-account',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspReportGetTraceInfoByCardRsp(ReportGetTraceInfoByCardRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = ReportRspData._parseReportGetTraceInfoByCardRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = ReportRspData._parseReportGetTraceInfoByCardRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = ReportRspData._parseReportGetTraceInfoByCardRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = ReportRspData._parseReportGetTraceInfoByCardRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = ReportRspData._parseReportGetTraceInfoByCardRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseReportGetTraceInfoByCardRsp(String id, ReportGetTraceInfoByCardRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Report_Response_GetTraceInfoByCardRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Report_Response_GetTraceInfoByCardRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Report_Response_GetTraceInfoByCardRsp-traceInfo':
             result = rsp.traceInfo;
             break;
         case 'Report_Response_GetTraceInfoByCardRsp-account':
             result = rsp.account;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> getCardInfoData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Report_Response_GetCardInfoRsp-responseCode',
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
                kID: 'Report_Response_GetCardInfoRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'account',
                kValue: ' ',
                kID: 'Report_Response_GetCardInfoRsp-account',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kGroupArrowOpen: true,
                kName: 'accountInformation',
                kValue: '',
                kID: 'Report_Response_GetCardInfoRsp-accountInformation',
                kType: DataItemType.Group,
                kShow: true,
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'expireDate',
                kValue: ' ',
                kID: 'Report_Response_GetCardInfoRsp-accountInformation_expireDate',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'cardType',
                kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType',
                kMenuID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: ReportCardType.NotSet,
                kData: [
                  {
                    kData: ReportCardType.NotSet,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_NotSet',
                  },
                  {
                    kData: ReportCardType.Visa,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_Visa',
                  },
                  {
                    kData: ReportCardType.MasterCard,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_MasterCard',
                  },
                  {
                    kData: ReportCardType.Amex,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_Amex',
                  },
                  {
                    kData: ReportCardType.Discover,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_Discover',
                  },
                  {
                    kData: ReportCardType.DinerClub,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_DinerClub',
                  },
                  {
                    kData: ReportCardType.Cup,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_Cup',
                  },
                  {
                    kData: ReportCardType.Maestro,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_Maestro',
                  },
                  {
                    kData: ReportCardType.Other,
                    kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardType_Other',
                  },
                ],
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'cardTypeName',
                kValue: ' ',
                kID: 'Report_Response_GetCardInfoRsp-accountInformation_cardTypeName',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspReportGetCardInfoRsp(ReportGetCardInfoRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = ReportRspData._parseReportGetCardInfoRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = ReportRspData._parseReportGetCardInfoRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = ReportRspData._parseReportGetCardInfoRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = ReportRspData._parseReportGetCardInfoRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = ReportRspData._parseReportGetCardInfoRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseReportGetCardInfoRsp(String id, ReportGetCardInfoRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Report_Response_GetCardInfoRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Report_Response_GetCardInfoRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Report_Response_GetCardInfoRsp-account':
             result = rsp.account;
             break;
         case 'Report_Response_GetCardInfoRsp-accountInformation':
             result = rsp.accountInformation;
             break;
         case 'Report_Response_GetCardInfoRsp-accountInformation_expireDate':
             result = rsp.accountInformation?.expireDate;
             break;
         case 'Report_Response_GetCardInfoRsp-accountInformation_cardType':
             result = rsp.accountInformation?.cardType;
             break;
         case 'Report_Response_GetCardInfoRsp-accountInformation_cardTypeName':
             result = rsp.accountInformation?.cardTypeName;
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
      case 'GetCardInfoReq':
        list = ReportRspData.getCardInfoData();
        break;
      case 'GetTraceInfoByCardReq':
        list = ReportRspData.getTraceInfoByCardData();
        break;
      case 'GetCardStatusReq':
        list = ReportRspData.getCardStatusData();
        break;
      case 'GetTransactionInfoReq':
        list = ReportRspData.getTransactionInfoData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
