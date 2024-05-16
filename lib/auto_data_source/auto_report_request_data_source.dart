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
class ReportReqData {
  static List<Map> initSourceData() {
    return ReportReqData.getCardInfoData();
  }
  static List<Map> getCardInfoData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'ReportCommand',
                kID: 'ReportCommand',
                kMenuID: 'ReportCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: ReportCommand.GetCardInfoReq,
                kData: [
                  {
                    kData: ReportCommand.GetCardInfoReq,
                    kID: 'ReportCommand_GetCardInfoReq',
                  },
                  {
                    kData: ReportCommand.GetTraceInfoByCardReq,
                    kID: 'ReportCommand_GetTraceInfoByCardReq',
                  },
                  {
                    kData: ReportCommand.GetCardStatusReq,
                    kID: 'ReportCommand_GetCardStatusReq',
                  },
                  {
                    kData: ReportCommand.GetTransactionInfoReq,
                    kID: 'ReportCommand_GetTransactionInfoReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'timeout',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Report_Request_GetCardInfoReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static ReportGetCardInfoReq formGetCardInfoReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    ReportGetCardInfoReq req = ReportGetCardInfoReq();
    req.timeout = RequestListModelQuery.query('Report_Request_GetCardInfoReq-timeout',queryList);
    return req;
  }

  static List<Map> getTraceInfoByCardData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'ReportCommand',
                kID: 'ReportCommand',
                kMenuID: 'ReportCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: ReportCommand.GetCardInfoReq,
                kData: [
                  {
                    kData: ReportCommand.GetCardInfoReq,
                    kID: 'ReportCommand_GetCardInfoReq',
                  },
                  {
                    kData: ReportCommand.GetTraceInfoByCardReq,
                    kID: 'ReportCommand_GetTraceInfoByCardReq',
                  },
                  {
                    kData: ReportCommand.GetCardStatusReq,
                    kID: 'ReportCommand_GetCardStatusReq',
                  },
                  {
                    kData: ReportCommand.GetTransactionInfoReq,
                    kID: 'ReportCommand_GetTransactionInfoReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'timeout',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Report_Request_GetTraceInfoByCardReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'transactionAmount',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Report_Request_GetTraceInfoByCardReq-transactionAmount',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static ReportGetTraceInfoByCardReq formGetTraceInfoByCardReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    ReportGetTraceInfoByCardReq req = ReportGetTraceInfoByCardReq();
    req.timeout = RequestListModelQuery.query('Report_Request_GetTraceInfoByCardReq-timeout',queryList);
    req.transactionAmount = RequestListModelQuery.query('Report_Request_GetTraceInfoByCardReq-transactionAmount',queryList);
    return req;
  }

  static List<Map> getCardStatusData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'ReportCommand',
                kID: 'ReportCommand',
                kMenuID: 'ReportCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: ReportCommand.GetCardInfoReq,
                kData: [
                  {
                    kData: ReportCommand.GetCardInfoReq,
                    kID: 'ReportCommand_GetCardInfoReq',
                  },
                  {
                    kData: ReportCommand.GetTraceInfoByCardReq,
                    kID: 'ReportCommand_GetTraceInfoByCardReq',
                  },
                  {
                    kData: ReportCommand.GetCardStatusReq,
                    kID: 'ReportCommand_GetCardStatusReq',
                  },
                  {
                    kData: ReportCommand.GetTransactionInfoReq,
                    kID: 'ReportCommand_GetTransactionInfoReq',
                  },
                ],
              },
           ];
  }

  static ReportGetCardStatusReq formGetCardStatusReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    ReportGetCardStatusReq req = ReportGetCardStatusReq();
    req.classID = RequestListModelQuery.query('Report_Request_GetCardStatusReq-classID',queryList);
    return req;
  }

  static List<Map> getTransactionInfoData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'ReportCommand',
                kID: 'ReportCommand',
                kMenuID: 'ReportCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: ReportCommand.GetCardInfoReq,
                kData: [
                  {
                    kData: ReportCommand.GetCardInfoReq,
                    kID: 'ReportCommand_GetCardInfoReq',
                  },
                  {
                    kData: ReportCommand.GetTraceInfoByCardReq,
                    kID: 'ReportCommand_GetTraceInfoByCardReq',
                  },
                  {
                    kData: ReportCommand.GetCardStatusReq,
                    kID: 'ReportCommand_GetCardStatusReq',
                  },
                  {
                    kData: ReportCommand.GetTransactionInfoReq,
                    kID: 'ReportCommand_GetTransactionInfoReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'registerReferenceNumber',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Report_Request_GetTransactionInfoReq-registerReferenceNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static ReportGetTransactionInfoReq formGetTransactionInfoReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    ReportGetTransactionInfoReq req = ReportGetTransactionInfoReq();
    req.registerReferenceNumber = RequestListModelQuery.query('Report_Request_GetTransactionInfoReq-registerReferenceNumber',queryList);
    return req;
  }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'GetCardInfoReq':
        list = ReportReqData.getCardInfoData();
        break;
      case 'GetTraceInfoByCardReq':
        list = ReportReqData.getTraceInfoByCardData();
        break;
      case 'GetCardStatusReq':
        list = ReportReqData.getCardStatusData();
        break;
      case 'GetTransactionInfoReq':
        list = ReportReqData.getTransactionInfoData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
