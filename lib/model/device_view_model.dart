import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_data_source/auto_device_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_device_response_data_source.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_device.dart';
import 'package:poslink2/model/response_db.dart';

import 'comm_setting_view_model.dart';

class DeviceViewModel extends ChangeNotifier {
  Future start(CommSettingViewModel commSettingViewModel,
      ResponseDataBase responseDataBase, List<Map> dataSource) async {
    POSLinkDeviceApi deviceApi = POSLinkDeviceApi();

    /// setting
    await commSettingViewModel.setSetting();

    /// command
    Map cmdData = dataSource.first;
    switch (cmdData[kValue]) {
      case DeviceCommand.MifareClassicReadReq:

        /// 获取请求数据
        DeviceMifareClassicReadReq req = DeviceReqData.formMifareClassicReadReq(dataSource);

        /// 交易
        DeviceMifareClassicReadRsp rsp = await deviceApi.mifareClassicRead(req);

        /// 响应数据更新到UI
        DeviceRspData.parseRspDeviceMifareClassicReadRsp(
            rsp, responseDataBase.deviceData);
        break;
      case DeviceCommand.MifareClassicWriteReq:
        DeviceMifareClassicWriteReq req = DeviceReqData.formMifareClassicWriteReq(dataSource);
        DeviceMifareClassicWriteRsp rsp = await deviceApi.mifareClassicWrite(req);
        DeviceRspData.parseRspDeviceMifareClassicWriteRsp(
            rsp, responseDataBase.deviceData);
        break;
      case DeviceCommand.MifareClassicGetUIDReq:
        DeviceMifareClassicGetUIDReq req = DeviceReqData.formMifareClassicGetUIDReq(dataSource);
        DeviceMifareClassicGetUIDRsp rsp = await deviceApi.mifareClassicGetUID(req);
        DeviceRspData.parseRspDeviceMifareClassicGetUIDRsp(
            rsp, responseDataBase.deviceData);
        break;
      default:
        throw Exception('undefined function');
    }
  }
}
