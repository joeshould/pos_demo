import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_batch_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_batch_response_data_source.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_batch.dart';
import 'package:poslink2/model/response_db.dart';

import 'comm_setting_view_model.dart';

class BatchViewModel extends ChangeNotifier {
  Future start(CommSettingViewModel commSettingViewModel,
      ResponseDataBase responseDataBase, List<Map> dataSource) async {
    POSLinkBatchApi batchApi = POSLinkBatchApi();

    /// setting
    await commSettingViewModel.setSetting();

    /// command
    Map cmdData = dataSource.first;
    switch (cmdData[kValue]) {
      case BatchCommand.BatchCloseReq:

        /// 获取请求数据
        BatchBatchCloseReq req = BatchReqData.formBatchCloseReq(dataSource);

        /// 交易
        BatchBatchCloseRsp rsp = await batchApi.batchClose(req);

        /// 响应数据更新到UI
        BatchRspData.parseRspBatchBatchCloseRsp(
            rsp, responseDataBase.batchData);
        break;
      case BatchCommand.BatchClearReq:
        BatchBatchClearReq req = BatchReqData.formBatchClearReq(dataSource);
        BatchBatchClearRsp rsp = await batchApi.batchClear(req);
        BatchRspData.parseRspBatchBatchClearRsp(
            rsp, responseDataBase.batchData);
        break;
      default:
        throw Exception('undefined function');
    }
  }
}
