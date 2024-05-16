import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_data_source/auto_report_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_report_response_data_source.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_report.dart';
import 'package:poslink2/model/response_db.dart';

import 'comm_setting_view_model.dart';

class ReportViewModel extends ChangeNotifier {
  Future start(CommSettingViewModel commSettingViewModel, ResponseDataBase responseDataBase, List<Map> dataSource) async {
    POSLinkReportApi reportApi = POSLinkReportApi();

    /// setting
    await commSettingViewModel.setSetting();

    /// command
    Map cmdData = dataSource.first;
    switch (cmdData[kValue]) {
      case ReportCommand.GetTransactionInfoReq:

        /// 获取请求数据
        ReportGetTransactionInfoReq req = ReportReqData.formGetTransactionInfoReq(dataSource);

        /// 交易
        ReportGetTransactionInfoRsp rsp = await reportApi.getTransactionInfo(req);

        /// 响应数据更新到UI
        ReportRspData.parseRspReportGetTransactionInfoRsp(rsp, responseDataBase.reportData);
        break;
      case ReportCommand.GetTraceInfoByCardReq:
        ReportGetTraceInfoByCardReq req = ReportReqData.formGetTraceInfoByCardReq(dataSource);

        ReportGetTraceInfoByCardRsp rsp = await reportApi.getTraceInfoByCard(req);

        /// 测试数据
        // ReportGetTraceInfoByCardRsp rsp = ReportGetTraceInfoByCardRsp();
        // ReportTraceInfo info1 = ReportTraceInfo();
        // info1.hostReferenceNumber = '11111';
        // info1.registerReferenceNumber = '22222';
        // ReportTraceInfo info2 = ReportTraceInfo();
        // info2.hostReferenceNumber = '55555';
        // info2.registerReferenceNumber = '33333';
        // rsp.traceInfo = [info1, info2];
        ReportRspData.parseRspReportGetTraceInfoByCardRsp(rsp, responseDataBase.reportData);
        break;
      case ReportCommand.GetCardStatusReq:
        ReportGetCardStatusReq req = ReportReqData.formGetCardStatusReq(dataSource);
        ReportGetCardStatusRsp rsp = await reportApi.getCardStatus(req);
        ReportRspData.parseRspReportGetCardStatusRsp(rsp, responseDataBase.reportData);
        break;
      case ReportCommand.GetCardInfoReq:
        ReportGetCardInfoReq req = ReportReqData.formGetCardInfoReq(dataSource);
        ReportGetCardInfoRsp rsp = await reportApi.getCardInfo(req);
        ReportRspData.parseRspReportGetCardInfoRsp(rsp, responseDataBase.reportData);
        break;
      default:
        throw Exception('undefined function');
    }
  }
}
