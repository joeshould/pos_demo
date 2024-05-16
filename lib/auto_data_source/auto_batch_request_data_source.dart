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
class BatchReqData {
  static List<Map> initSourceData() {
    return BatchReqData.batchCloseData();
  }
  static List<Map> batchCloseData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'BatchCommand',
                kID: 'BatchCommand',
                kMenuID: 'BatchCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: BatchCommand.BatchCloseReq,
                kData: [
                  {
                    kData: BatchCommand.BatchCloseReq,
                    kID: 'BatchCommand_BatchCloseReq',
                  },
                  {
                    kData: BatchCommand.BatchClearReq,
                    kID: 'BatchCommand_BatchClearReq',
                  },
                ],
              },
           ];
  }

  static BatchBatchCloseReq formBatchCloseReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    BatchBatchCloseReq req = BatchBatchCloseReq();
    req.classID = RequestListModelQuery.query('Batch_Request_BatchCloseReq-classID',queryList);
    return req;
  }

  static List<Map> batchClearData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'BatchCommand',
                kID: 'BatchCommand',
                kMenuID: 'BatchCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: BatchCommand.BatchCloseReq,
                kData: [
                  {
                    kData: BatchCommand.BatchCloseReq,
                    kID: 'BatchCommand_BatchCloseReq',
                  },
                  {
                    kData: BatchCommand.BatchClearReq,
                    kID: 'BatchCommand_BatchClearReq',
                  },
                ],
              },
           ];
  }

  static BatchBatchClearReq formBatchClearReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    BatchBatchClearReq req = BatchBatchClearReq();
    req.classID = RequestListModelQuery.query('Batch_Request_BatchClearReq-classID',queryList);
    return req;
  }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'BatchCloseReq':
        list = BatchReqData.batchCloseData();
        break;
      case 'BatchClearReq':
        list = BatchReqData.batchClearData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
