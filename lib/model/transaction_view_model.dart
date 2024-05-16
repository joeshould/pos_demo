import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_data_source/auto_transaction_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_transaction_response_data_source.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_transaction.dart';
import 'package:poslink2/model/response_db.dart';

import 'comm_setting_view_model.dart';

class TransactionViewModel extends ChangeNotifier {
  Future start(CommSettingViewModel commSettingViewModel, ResponseDataBase responseDataBase, List<Map> dataSource) async {
    POSLinkTransactionApi transactionApi = POSLinkTransactionApi();

    /// setting
    await commSettingViewModel.setSetting();

    /// command
    Map cmdData = dataSource.first;
    switch (cmdData[kValue]) {
      case TransactionCommand.TransactionStartReq:

        /// 获取请求数据

        TransactionTransactionStartReq req = TransactionReqData.formTransactionStartReq(dataSource);

        /// 交易
        TransactionTransactionStartRsp rsp = await transactionApi.transactionStart(req);

        /// 响应数据更新到UI
        TransactionRspData.parseRspTransactionTransactionStartRsp(rsp, responseDataBase.transactionData);
        break;
      case TransactionCommand.TransactionReversalReq:
        TransactionTransactionReversalReq req =
            TransactionReqData.formTransactionReversalReq(dataSource);
        TransactionTransactionReversalRsp rsp = await transactionApi.transactionReversal(req);
        TransactionRspData.parseRspTransactionTransactionReversalRsp(
            rsp, responseDataBase.transactionData);
        break;
      case TransactionCommand.TransactionCompletionReq:
        TransactionTransactionCompletionReq req = TransactionReqData.formTransactionCompletionReq(dataSource);
        TransactionTransactionCompletionRsp rsp = await transactionApi.transactionCompletion(req);
        TransactionRspData.parseRspTransactionTransactionCompletionRsp(rsp, responseDataBase.transactionData);
        break;
      case TransactionCommand.TransactionIncrementalReq:
        TransactionTransactionIncrementalReq req = TransactionReqData.formTransactionIncrementalReq(dataSource);
        TransactionTransactionIncrementalRsp rsp = await transactionApi.transactionIncremental(req);
        TransactionRspData.parseRspTransactionTransactionIncrementalRsp(rsp, responseDataBase.transactionData);
        break;
      default:
        throw Exception('undefined function');
    }
  }
}
