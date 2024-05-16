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
import 'package:poslink2/auto_data_source/auto_query.dart';
class TransactionRspData {
  static List<Map> initSourceData() {
    return TransactionRspData.transactionStartData();
  }
  static List<Map> transactionReversalData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionReversalRsp-responseCode',
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
                kID: 'Transaction_Response_TransactionReversalRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspTransactionTransactionReversalRsp(TransactionTransactionReversalRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = TransactionRspData._parseTransactionTransactionReversalRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = TransactionRspData._parseTransactionTransactionReversalRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = TransactionRspData._parseTransactionTransactionReversalRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = TransactionRspData._parseTransactionTransactionReversalRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = TransactionRspData._parseTransactionTransactionReversalRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseTransactionTransactionReversalRsp(String id, TransactionTransactionReversalRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Transaction_Response_TransactionReversalRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Transaction_Response_TransactionReversalRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> transactionCompletionData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionCompletionRsp-responseCode',
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
                kID: 'Transaction_Response_TransactionCompletionRsp-responseMessage',
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
                kID: 'Transaction_Response_TransactionCompletionRsp-hostReferenceNumber',
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
                kID: 'Transaction_Response_TransactionCompletionRsp-hostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'timestamp',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionCompletionRsp-timestamp',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspTransactionTransactionCompletionRsp(TransactionTransactionCompletionRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = TransactionRspData._parseTransactionTransactionCompletionRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = TransactionRspData._parseTransactionTransactionCompletionRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = TransactionRspData._parseTransactionTransactionCompletionRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = TransactionRspData._parseTransactionTransactionCompletionRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = TransactionRspData._parseTransactionTransactionCompletionRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseTransactionTransactionCompletionRsp(String id, TransactionTransactionCompletionRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Transaction_Response_TransactionCompletionRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Transaction_Response_TransactionCompletionRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Transaction_Response_TransactionCompletionRsp-hostReferenceNumber':
             result = rsp.hostReferenceNumber;
             break;
         case 'Transaction_Response_TransactionCompletionRsp-hostData':
             result = rsp.hostData;
             break;
         case 'Transaction_Response_TransactionCompletionRsp-timestamp':
             result = rsp.timestamp;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> transactionIncrementalData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionIncrementalRsp-responseCode',
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
                kID: 'Transaction_Response_TransactionIncrementalRsp-responseMessage',
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
                kID: 'Transaction_Response_TransactionIncrementalRsp-hostReferenceNumber',
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
                kID: 'Transaction_Response_TransactionIncrementalRsp-hostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'timestamp',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionIncrementalRsp-timestamp',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspTransactionTransactionIncrementalRsp(TransactionTransactionIncrementalRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = TransactionRspData._parseTransactionTransactionIncrementalRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = TransactionRspData._parseTransactionTransactionIncrementalRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = TransactionRspData._parseTransactionTransactionIncrementalRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = TransactionRspData._parseTransactionTransactionIncrementalRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = TransactionRspData._parseTransactionTransactionIncrementalRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseTransactionTransactionIncrementalRsp(String id, TransactionTransactionIncrementalRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Transaction_Response_TransactionIncrementalRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Transaction_Response_TransactionIncrementalRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Transaction_Response_TransactionIncrementalRsp-hostReferenceNumber':
             result = rsp.hostReferenceNumber;
             break;
         case 'Transaction_Response_TransactionIncrementalRsp-hostData':
             result = rsp.hostData;
             break;
         case 'Transaction_Response_TransactionIncrementalRsp-timestamp':
             result = rsp.timestamp;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> transactionStartData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionStartRsp-responseCode',
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
                kID: 'Transaction_Response_TransactionStartRsp-responseMessage',
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
                kID: 'Transaction_Response_TransactionStartRsp-hostReferenceNumber',
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
                kID: 'Transaction_Response_TransactionStartRsp-hostData',
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
                kID: 'Transaction_Response_TransactionStartRsp-account',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'timestamp',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionStartRsp-timestamp',
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
                kID: 'Transaction_Response_TransactionStartRsp-accountInformation',
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
                kID: 'Transaction_Response_TransactionStartRsp-accountInformation_expireDate',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'cardType',
                kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType',
                kMenuID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: TransactionCardType.NotSet,
                kData: [
                  {
                    kData: TransactionCardType.NotSet,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_NotSet',
                  },
                  {
                    kData: TransactionCardType.Visa,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_Visa',
                  },
                  {
                    kData: TransactionCardType.MasterCard,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_MasterCard',
                  },
                  {
                    kData: TransactionCardType.Amex,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_Amex',
                  },
                  {
                    kData: TransactionCardType.Discover,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_Discover',
                  },
                  {
                    kData: TransactionCardType.DinerClub,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_DinerClub',
                  },
                  {
                    kData: TransactionCardType.Cup,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_Cup',
                  },
                  {
                    kData: TransactionCardType.Maestro,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_Maestro',
                  },
                  {
                    kData: TransactionCardType.Other,
                    kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardType_Other',
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
                kID: 'Transaction_Response_TransactionStartRsp-accountInformation_cardTypeName',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kGroupArrowOpen: true,
                kName: 'hostInformation',
                kValue: '',
                kID: 'Transaction_Response_TransactionStartRsp-hostInformation',
                kType: DataItemType.Group,
                kShow: true,
              },
              {
                kSuperGroupName: 'hostInformation',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 2,
                kName: 'token',
                kValue: ' ',
                kID: 'Transaction_Response_TransactionStartRsp-hostInformation_token',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspTransactionTransactionStartRsp(TransactionTransactionStartRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = TransactionRspData._parseTransactionTransactionStartRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = TransactionRspData._parseTransactionTransactionStartRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = TransactionRspData._parseTransactionTransactionStartRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = TransactionRspData._parseTransactionTransactionStartRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = TransactionRspData._parseTransactionTransactionStartRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseTransactionTransactionStartRsp(String id, TransactionTransactionStartRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Transaction_Response_TransactionStartRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Transaction_Response_TransactionStartRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Transaction_Response_TransactionStartRsp-hostReferenceNumber':
             result = rsp.hostReferenceNumber;
             break;
         case 'Transaction_Response_TransactionStartRsp-hostData':
             result = rsp.hostData;
             break;
         case 'Transaction_Response_TransactionStartRsp-account':
             result = rsp.account;
             break;
         case 'Transaction_Response_TransactionStartRsp-timestamp':
             result = rsp.timestamp;
             break;
         case 'Transaction_Response_TransactionStartRsp-accountInformation':
             result = rsp.accountInformation;
             break;
         case 'Transaction_Response_TransactionStartRsp-accountInformation_expireDate':
             result = rsp.accountInformation?.expireDate;
             break;
         case 'Transaction_Response_TransactionStartRsp-accountInformation_cardType':
             result = rsp.accountInformation?.cardType;
             break;
         case 'Transaction_Response_TransactionStartRsp-accountInformation_cardTypeName':
             result = rsp.accountInformation?.cardTypeName;
             break;
         case 'Transaction_Response_TransactionStartRsp-hostInformation':
             result = rsp.hostInformation;
             break;
         case 'Transaction_Response_TransactionStartRsp-hostInformation_token':
             result = rsp.hostInformation?.token;
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
      case 'TransactionStartReq':
        list = TransactionRspData.transactionStartData();
        break;
      case 'TransactionIncrementalReq':
        list = TransactionRspData.transactionIncrementalData();
        break;
      case 'TransactionCompletionReq':
        list = TransactionRspData.transactionCompletionData();
        break;
      case 'TransactionReversalReq':
        list = TransactionRspData.transactionReversalData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
