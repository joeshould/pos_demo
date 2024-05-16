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
import 'package:poslink2/auto_pigeon/poslink_sdk_device.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class DeviceReqData {
  static List<Map> initSourceData() {
    return DeviceReqData.mifareClassicReadData();
  }
  static List<Map> mifareClassicReadData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'DeviceCommand',
                kID: 'DeviceCommand',
                kMenuID: 'DeviceCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: DeviceCommand.MifareClassicReadReq,
                kData: [
                  {
                    kData: DeviceCommand.MifareClassicReadReq,
                    kID: 'DeviceCommand_MifareClassicReadReq',
                  },
                  {
                    kData: DeviceCommand.MifareClassicGetUIDReq,
                    kID: 'DeviceCommand_MifareClassicGetUIDReq',
                  },
                  {
                    kData: DeviceCommand.MifareClassicWriteReq,
                    kID: 'DeviceCommand_MifareClassicWriteReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'password',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Device_Request_MifareClassicReadReq-password',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'passwordType',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Device_Request_MifareClassicReadReq-passwordType',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'blockNumber',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Device_Request_MifareClassicReadReq-blockNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'timeout',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Device_Request_MifareClassicReadReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static DeviceMifareClassicReadReq formMifareClassicReadReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    DeviceMifareClassicReadReq req = DeviceMifareClassicReadReq();
    req.password = RequestListModelQuery.query('Device_Request_MifareClassicReadReq-password',queryList);
    req.passwordType = RequestListModelQuery.query('Device_Request_MifareClassicReadReq-passwordType',queryList);
    req.blockNumber = RequestListModelQuery.query('Device_Request_MifareClassicReadReq-blockNumber',queryList);
    req.timeout = RequestListModelQuery.query('Device_Request_MifareClassicReadReq-timeout',queryList);
    return req;
  }

  static List<Map> mifareClassicGetUIDData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'DeviceCommand',
                kID: 'DeviceCommand',
                kMenuID: 'DeviceCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: DeviceCommand.MifareClassicReadReq,
                kData: [
                  {
                    kData: DeviceCommand.MifareClassicReadReq,
                    kID: 'DeviceCommand_MifareClassicReadReq',
                  },
                  {
                    kData: DeviceCommand.MifareClassicGetUIDReq,
                    kID: 'DeviceCommand_MifareClassicGetUIDReq',
                  },
                  {
                    kData: DeviceCommand.MifareClassicWriteReq,
                    kID: 'DeviceCommand_MifareClassicWriteReq',
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
                kID: 'Device_Request_MifareClassicGetUIDReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static DeviceMifareClassicGetUIDReq formMifareClassicGetUIDReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    DeviceMifareClassicGetUIDReq req = DeviceMifareClassicGetUIDReq();
    req.timeout = RequestListModelQuery.query('Device_Request_MifareClassicGetUIDReq-timeout',queryList);
    return req;
  }

  static List<Map> mifareClassicWriteData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'DeviceCommand',
                kID: 'DeviceCommand',
                kMenuID: 'DeviceCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: DeviceCommand.MifareClassicReadReq,
                kData: [
                  {
                    kData: DeviceCommand.MifareClassicReadReq,
                    kID: 'DeviceCommand_MifareClassicReadReq',
                  },
                  {
                    kData: DeviceCommand.MifareClassicGetUIDReq,
                    kID: 'DeviceCommand_MifareClassicGetUIDReq',
                  },
                  {
                    kData: DeviceCommand.MifareClassicWriteReq,
                    kID: 'DeviceCommand_MifareClassicWriteReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'password',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Device_Request_MifareClassicWriteReq-password',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'passwordType',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Device_Request_MifareClassicWriteReq-passwordType',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'blockNumber',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Device_Request_MifareClassicWriteReq-blockNumber',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'blockValue',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Device_Request_MifareClassicWriteReq-blockValue',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'timeout',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Device_Request_MifareClassicWriteReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static DeviceMifareClassicWriteReq formMifareClassicWriteReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    DeviceMifareClassicWriteReq req = DeviceMifareClassicWriteReq();
    req.password = RequestListModelQuery.query('Device_Request_MifareClassicWriteReq-password',queryList);
    req.passwordType = RequestListModelQuery.query('Device_Request_MifareClassicWriteReq-passwordType',queryList);
    req.blockNumber = RequestListModelQuery.query('Device_Request_MifareClassicWriteReq-blockNumber',queryList);
    req.blockValue = RequestListModelQuery.query('Device_Request_MifareClassicWriteReq-blockValue',queryList);
    req.timeout = RequestListModelQuery.query('Device_Request_MifareClassicWriteReq-timeout',queryList);
    return req;
  }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'MifareClassicReadReq':
        list = DeviceReqData.mifareClassicReadData();
        break;
      case 'MifareClassicGetUIDReq':
        list = DeviceReqData.mifareClassicGetUIDData();
        break;
      case 'MifareClassicWriteReq':
        list = DeviceReqData.mifareClassicWriteData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
