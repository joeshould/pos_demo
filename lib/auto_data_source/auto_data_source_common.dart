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

enum DataItemType { Menu, Group, CellInput, ModelList, StringList, Boolen}
const kName = 'name';
const kData = 'data';
const kType = 'type';
const kLevel = 'level';
const kSuperGroupName = 'kSuperGroupName';
const kShow = 'kShow';
const kValue = 'kValue';
const kID = 'kID';
const kTextShowType = 'kTextShowType';
const kEnable = 'kEnable';
const kMenuID = 'kMenuID';
const kClass = 'kClass';
const kGroupArrowOpen = 'kGroupArrowOpen';
const kBitmapEnable = 'kBitmapEnable';
const kTextAttribute = 'kTextAttribute';
const kTextFieldButtonName = 'kTextFieldButtonName';


enum TransactionCommand {
    TransactionStartReq,
    TransactionIncrementalReq,
    TransactionCompletionReq,
    TransactionReversalReq,
}


enum FormCommand {
    InputTextReq,
}


enum AdminCommand {
    GetConfigurationReq,
    RebootReq,
    PingReq,
    ResetReq,
    GetTerminalInfoReq,
    SetConfigurationReq,
}


enum BatchCommand {
    BatchCloseReq,
    BatchClearReq,
}


enum ReportCommand {
    GetCardInfoReq,
    GetTraceInfoByCardReq,
    GetCardStatusReq,
    GetTransactionInfoReq,
}


enum DeviceCommand {
    MifareClassicReadReq,
    MifareClassicGetUIDReq,
    MifareClassicWriteReq,
}
