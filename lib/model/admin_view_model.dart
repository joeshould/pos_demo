import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_data_source/auto_admin_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_admin_response_data_source.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_admin.dart';
import 'package:poslink2/model/response_db.dart';

import 'comm_setting_view_model.dart';

class AdminViewModel extends ChangeNotifier {
  Future start(CommSettingViewModel commSettingViewModel, ResponseDataBase responseDataBase, List<Map> dataSource) async {
    POSLinkAdminApi adminApi = POSLinkAdminApi();

    /// setting
    await commSettingViewModel.setSetting();

    /// command
    Map cmdData = dataSource.first;
    switch (cmdData[kValue]) {
      case AdminCommand.RebootReq:

        /// 获取请求数据
        AdminRebootReq req = AdminReqData.formRebootReq(dataSource);

        /// 交易
        AdminRebootRsp rsp = await adminApi.reboot(req);

        /// 响应数据更新到UI
        AdminRspData.parseRspAdminRebootRsp(rsp, responseDataBase.adminData);
        break;
      case AdminCommand.GetTerminalInfoReq:
        AdminGetTerminalInfoReq req = AdminReqData.formGetTerminalInfoReq(dataSource);
        AdminGetTerminalInfoRsp rsp = await adminApi.getTerminalInfo(req);
        AdminRspData.parseRspAdminGetTerminalInfoRsp(rsp, responseDataBase.adminData);
        break;
      case AdminCommand.ResetReq:
        AdminResetReq req = AdminReqData.formResetReq(dataSource);
        AdminResetRsp rsp = await adminApi.reset(req);
        AdminRspData.parseRspAdminResetRsp(rsp, responseDataBase.adminData);
        break;
      case AdminCommand.GetConfigurationReq:
        AdminGetConfigurationReq req = AdminReqData.formGetConfigurationReq(dataSource);
        AdminGetConfigurationRsp rsp = await adminApi.getConfiguration(req);
        AdminRspData.parseRspAdminGetConfigurationRsp(rsp, responseDataBase.adminData);
        break;
      case AdminCommand.SetConfigurationReq:
        AdminSetConfigurationReq req = AdminReqData.formSetConfigurationReq(dataSource);
        AdminSetConfigurationRsp rsp = await adminApi.setConfiguration(req);
        AdminRspData.parseRspAdminSetConfigurationRsp(rsp, responseDataBase.adminData);
        break;
      case AdminCommand.PingReq:
        AdminPingReq req = AdminReqData.formPingReq(dataSource);
        AdminPingRsp rsp = await adminApi.ping(req);
        AdminRspData.parseRspAdminPingRsp(rsp, responseDataBase.adminData);
        break;
      default:
        throw Exception('undefined function');
    }
  }
}
