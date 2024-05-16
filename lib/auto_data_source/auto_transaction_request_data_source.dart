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
class TransactionReqData {
  static List<Map> initSourceData() {
    return TransactionReqData.transactionStartData();
  }
  static List<Map> transactionStartData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'TransactionCommand',
                kID: 'TransactionCommand',
                kMenuID: 'TransactionCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: TransactionCommand.TransactionStartReq,
                kData: [
                  {
                    kData: TransactionCommand.TransactionStartReq,
                    kID: 'TransactionCommand_TransactionStartReq',
                  },
                  {
                    kData: TransactionCommand.TransactionIncrementalReq,
                    kID: 'TransactionCommand_TransactionIncrementalReq',
                  },
                  {
                    kData: TransactionCommand.TransactionCompletionReq,
                    kID: 'TransactionCommand_TransactionCompletionReq',
                  },
                  {
                    kData: TransactionCommand.TransactionReversalReq,
                    kID: 'TransactionCommand_TransactionReversalReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'transactionAmount',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionStartReq-transactionAmount',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'registerReferenceNumber',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionStartReq-registerReferenceNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'account',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionStartReq-account',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'reportStatus',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionStartReq-reportStatus',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kGroupArrowOpen: true,
                kName: 'hostGateway',
                kValue: '',
                kID: 'Transaction_Request_TransactionStartReq-hostGateway',
                kType: DataItemType.Group,
                kShow: true,
              },
              {
                kSuperGroupName: 'hostGateway',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 2,
                kName: 'tokenRequestFlag',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionStartReq-hostGateway_tokenRequestFlag',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: 'hostGateway',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 2,
                kName: 'token',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionStartReq-hostGateway_token',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kGroupArrowOpen: true,
                kName: 'accountInformation',
                kValue: '',
                kID: 'Transaction_Request_TransactionStartReq-accountInformation',
                kType: DataItemType.Group,
                kShow: true,
              },
              {
                kSuperGroupName: 'accountInformation',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 2,
                kName: 'cardExpireDate',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionStartReq-accountInformation_cardExpireDate',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static TransactionTransactionStartReq formTransactionStartReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    TransactionTransactionStartReq req = TransactionTransactionStartReq();
    req.transactionAmount = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-transactionAmount',queryList);
    req.registerReferenceNumber = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-registerReferenceNumber',queryList);
    req.account = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-account',queryList);
    req.reportStatus = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-reportStatus',queryList);
    req.hostGateway = TransactionHostGateway();
    req.hostGateway!.tokenRequestFlag = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-hostGateway_tokenRequestFlag',queryList);
    req.hostGateway!.token = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-hostGateway_token',queryList);
    req.accountInformation = TransactionAccountReq();
    req.accountInformation!.cardExpireDate = RequestListModelQuery.query('Transaction_Request_TransactionStartReq-accountInformation_cardExpireDate',queryList);
    return req;
  }

  static List<Map> transactionIncrementalData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'TransactionCommand',
                kID: 'TransactionCommand',
                kMenuID: 'TransactionCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: TransactionCommand.TransactionStartReq,
                kData: [
                  {
                    kData: TransactionCommand.TransactionStartReq,
                    kID: 'TransactionCommand_TransactionStartReq',
                  },
                  {
                    kData: TransactionCommand.TransactionIncrementalReq,
                    kID: 'TransactionCommand_TransactionIncrementalReq',
                  },
                  {
                    kData: TransactionCommand.TransactionCompletionReq,
                    kID: 'TransactionCommand_TransactionCompletionReq',
                  },
                  {
                    kData: TransactionCommand.TransactionReversalReq,
                    kID: 'TransactionCommand_TransactionReversalReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'transactionAmount',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionIncrementalReq-transactionAmount',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'originalHostReferenceNumber',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionIncrementalReq-originalHostReferenceNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'originalHostData',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionIncrementalReq-originalHostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static TransactionTransactionIncrementalReq formTransactionIncrementalReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    TransactionTransactionIncrementalReq req = TransactionTransactionIncrementalReq();
    req.transactionAmount = RequestListModelQuery.query('Transaction_Request_TransactionIncrementalReq-transactionAmount',queryList);
    req.originalHostReferenceNumber = RequestListModelQuery.query('Transaction_Request_TransactionIncrementalReq-originalHostReferenceNumber',queryList);
    req.originalHostData = RequestListModelQuery.query('Transaction_Request_TransactionIncrementalReq-originalHostData',queryList);
    return req;
  }

  static List<Map> transactionCompletionData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'TransactionCommand',
                kID: 'TransactionCommand',
                kMenuID: 'TransactionCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: TransactionCommand.TransactionStartReq,
                kData: [
                  {
                    kData: TransactionCommand.TransactionStartReq,
                    kID: 'TransactionCommand_TransactionStartReq',
                  },
                  {
                    kData: TransactionCommand.TransactionIncrementalReq,
                    kID: 'TransactionCommand_TransactionIncrementalReq',
                  },
                  {
                    kData: TransactionCommand.TransactionCompletionReq,
                    kID: 'TransactionCommand_TransactionCompletionReq',
                  },
                  {
                    kData: TransactionCommand.TransactionReversalReq,
                    kID: 'TransactionCommand_TransactionReversalReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'transactionAmount',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionCompletionReq-transactionAmount',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'originalHostReferenceNumber',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionCompletionReq-originalHostReferenceNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'originalHostData',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionCompletionReq-originalHostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'verifyCard',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Transaction_Request_TransactionCompletionReq-verifyCard',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static TransactionTransactionCompletionReq formTransactionCompletionReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    TransactionTransactionCompletionReq req = TransactionTransactionCompletionReq();
    req.transactionAmount = RequestListModelQuery.query('Transaction_Request_TransactionCompletionReq-transactionAmount',queryList);
    req.originalHostReferenceNumber = RequestListModelQuery.query('Transaction_Request_TransactionCompletionReq-originalHostReferenceNumber',queryList);
    req.originalHostData = RequestListModelQuery.query('Transaction_Request_TransactionCompletionReq-originalHostData',queryList);
    req.verifyCard = RequestListModelQuery.query('Transaction_Request_TransactionCompletionReq-verifyCard',queryList);
    return req;
  }

  static List<Map> transactionReversalData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'TransactionCommand',
                kID: 'TransactionCommand',
                kMenuID: 'TransactionCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: TransactionCommand.TransactionStartReq,
                kData: [
                  {
                    kData: TransactionCommand.TransactionStartReq,
                    kID: 'TransactionCommand_TransactionStartReq',
                  },
                  {
                    kData: TransactionCommand.TransactionIncrementalReq,
                    kID: 'TransactionCommand_TransactionIncrementalReq',
                  },
                  {
                    kData: TransactionCommand.TransactionCompletionReq,
                    kID: 'TransactionCommand_TransactionCompletionReq',
                  },
                  {
                    kData: TransactionCommand.TransactionReversalReq,
                    kID: 'TransactionCommand_TransactionReversalReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'originalHostReferenceNumber',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionReversalReq-originalHostReferenceNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'originalHostData',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Transaction_Request_TransactionReversalReq-originalHostData',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static TransactionTransactionReversalReq formTransactionReversalReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    TransactionTransactionReversalReq req = TransactionTransactionReversalReq();
    req.originalHostReferenceNumber = RequestListModelQuery.query('Transaction_Request_TransactionReversalReq-originalHostReferenceNumber',queryList);
    req.originalHostData = RequestListModelQuery.query('Transaction_Request_TransactionReversalReq-originalHostData',queryList);
    return req;
  }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'TransactionStartReq':
        list = TransactionReqData.transactionStartData();
        break;
      case 'TransactionIncrementalReq':
        list = TransactionReqData.transactionIncrementalData();
        break;
      case 'TransactionCompletionReq':
        list = TransactionReqData.transactionCompletionData();
        break;
      case 'TransactionReversalReq':
        list = TransactionReqData.transactionReversalData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
