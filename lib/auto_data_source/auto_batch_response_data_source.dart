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
import 'package:poslink2/auto_pigeon/poslink_sdk_batch.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class BatchRspData {
  static List<Map> initSourceData() {
    return BatchRspData.batchCloseData();
  }
  static List<Map> batchClearData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Batch_Response_BatchClearRsp-responseCode',
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
                kID: 'Batch_Response_BatchClearRsp-responseMessage',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspBatchBatchClearRsp(BatchBatchClearRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = BatchRspData._parseBatchBatchClearRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = BatchRspData._parseBatchBatchClearRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = BatchRspData._parseBatchBatchClearRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = BatchRspData._parseBatchBatchClearRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = BatchRspData._parseBatchBatchClearRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseBatchBatchClearRsp(String id, BatchBatchClearRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Batch_Response_BatchClearRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Batch_Response_BatchClearRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         default:
             break;
     }
     return result;
 }

  static List<Map> batchCloseData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'responseCode',
                kValue: ' ',
                kID: 'Batch_Response_BatchCloseRsp-responseCode',
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
                kID: 'Batch_Response_BatchCloseRsp-responseMessage',
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
                kID: 'Batch_Response_BatchCloseRsp-hostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'totalCount',
                kValue: ' ',
                kID: 'Batch_Response_BatchCloseRsp-totalCount',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: false,
                kLevel: 1,
                kName: 'totalAmount',
                kValue: ' ',
                kID: 'Batch_Response_BatchCloseRsp-totalAmount',
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
                kID: 'Batch_Response_BatchCloseRsp-timeStamp',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

   static void parseRspBatchBatchCloseRsp(BatchBatchCloseRsp rsp, List<Map> rspDataSource) {
      rspDataSource.forEach((element) {
          DataItemType itemType = element[kType];
          String id = element[kID];
          switch (itemType) {
              case DataItemType.CellInput:
                element[kValue] = BatchRspData._parseBatchBatchCloseRsp(id, rsp);
                break;
              case DataItemType.Group:
                if (element[kBitmapEnable] != null) {
                    element[kBitmapEnable] = true;
                    element[kGroupArrowOpen] = true;
                }
                break;
              case DataItemType.ModelList:
                List<dynamic> map = BatchRspData._parseBatchBatchCloseRsp(id, rsp) ?? [];
                element[kData] = ResponseListModelQuery.query(id, map);
                break;
              case DataItemType.Menu:
                element[kValue] = BatchRspData._parseBatchBatchCloseRsp(id, rsp);
                break;
              case DataItemType.StringList:
                List<String> tempData = [];
                List<String?> resData = BatchRspData._parseBatchBatchCloseRsp(id, rsp) ?? [];
                for (int i = 0; i < resData.length; i++) {
                  String str = resData[i]!;
                  tempData.add(str);
                }
                element[kData] = tempData;
                break;
            case DataItemType.Boolen:
                element[kValue] = BatchRspData._parseBatchBatchCloseRsp(id, rsp);
                element[kShow] = true;
                break;
              default:
                break;
           }
        });
  }


   static dynamic _parseBatchBatchCloseRsp(String id, BatchBatchCloseRsp rsp) {
      dynamic result;
      switch (id) {
         case 'Batch_Response_BatchCloseRsp-responseCode':
             result = rsp.responseCode;
             break;
         case 'Batch_Response_BatchCloseRsp-responseMessage':
             result = rsp.responseMessage;
             break;
         case 'Batch_Response_BatchCloseRsp-hostData':
             result = rsp.hostData;
             break;
         case 'Batch_Response_BatchCloseRsp-totalCount':
             result = rsp.totalCount;
             break;
         case 'Batch_Response_BatchCloseRsp-totalAmount':
             result = rsp.totalAmount;
             break;
         case 'Batch_Response_BatchCloseRsp-timeStamp':
             result = rsp.timeStamp;
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
      case 'BatchCloseReq':
        list = BatchRspData.batchCloseData();
        break;
      case 'BatchClearReq':
        list = BatchRspData.batchClearData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
