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
import 'package:poslink2/auto_pigeon/poslink_sdk_admin.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class AdminReqData {
  static List<Map> initSourceData() {
    return AdminReqData.getTerminalInfoData();
  }
  static List<Map> getTerminalInfoData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'AdminCommand',
                kID: 'AdminCommand',
                kMenuID: 'AdminCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: AdminCommand.GetTerminalInfoReq,
                kData: [
                  {
                    kData: AdminCommand.GetConfigurationReq,
                    kID: 'AdminCommand_GetConfigurationReq',
                  },
                  {
                    kData: AdminCommand.RebootReq,
                    kID: 'AdminCommand_RebootReq',
                  },
                  {
                    kData: AdminCommand.PingReq,
                    kID: 'AdminCommand_PingReq',
                  },
                  {
                    kData: AdminCommand.ResetReq,
                    kID: 'AdminCommand_ResetReq',
                  },
                  {
                    kData: AdminCommand.GetTerminalInfoReq,
                    kID: 'AdminCommand_GetTerminalInfoReq',
                  },
                  {
                    kData: AdminCommand.SetConfigurationReq,
                    kID: 'AdminCommand_SetConfigurationReq',
                  },
                ],
              },
           ];
  }

  static AdminGetTerminalInfoReq formGetTerminalInfoReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    AdminGetTerminalInfoReq req = AdminGetTerminalInfoReq();
    req.classID = RequestListModelQuery.query('Admin_Request_GetTerminalInfoReq-classID',queryList);
    return req;
  }

  static List<Map> rebootData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'AdminCommand',
                kID: 'AdminCommand',
                kMenuID: 'AdminCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: AdminCommand.GetTerminalInfoReq,
                kData: [
                  {
                    kData: AdminCommand.GetConfigurationReq,
                    kID: 'AdminCommand_GetConfigurationReq',
                  },
                  {
                    kData: AdminCommand.RebootReq,
                    kID: 'AdminCommand_RebootReq',
                  },
                  {
                    kData: AdminCommand.PingReq,
                    kID: 'AdminCommand_PingReq',
                  },
                  {
                    kData: AdminCommand.ResetReq,
                    kID: 'AdminCommand_ResetReq',
                  },
                  {
                    kData: AdminCommand.GetTerminalInfoReq,
                    kID: 'AdminCommand_GetTerminalInfoReq',
                  },
                  {
                    kData: AdminCommand.SetConfigurationReq,
                    kID: 'AdminCommand_SetConfigurationReq',
                  },
                ],
              },
           ];
  }

  static AdminRebootReq formRebootReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    AdminRebootReq req = AdminRebootReq();
    req.classID = RequestListModelQuery.query('Admin_Request_RebootReq-classID',queryList);
    return req;
  }

  static List<Map> pingData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'AdminCommand',
                kID: 'AdminCommand',
                kMenuID: 'AdminCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: AdminCommand.GetTerminalInfoReq,
                kData: [
                  {
                    kData: AdminCommand.GetConfigurationReq,
                    kID: 'AdminCommand_GetConfigurationReq',
                  },
                  {
                    kData: AdminCommand.RebootReq,
                    kID: 'AdminCommand_RebootReq',
                  },
                  {
                    kData: AdminCommand.PingReq,
                    kID: 'AdminCommand_PingReq',
                  },
                  {
                    kData: AdminCommand.ResetReq,
                    kID: 'AdminCommand_ResetReq',
                  },
                  {
                    kData: AdminCommand.GetTerminalInfoReq,
                    kID: 'AdminCommand_GetTerminalInfoReq',
                  },
                  {
                    kData: AdminCommand.SetConfigurationReq,
                    kID: 'AdminCommand_SetConfigurationReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'targetName',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Admin_Request_PingReq-targetName',
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
                kID: 'Admin_Request_PingReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static AdminPingReq formPingReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    AdminPingReq req = AdminPingReq();
    req.targetName = RequestListModelQuery.query('Admin_Request_PingReq-targetName',queryList);
    req.timeout = RequestListModelQuery.query('Admin_Request_PingReq-timeout',queryList);
    return req;
  }

  static List<Map> resetData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'AdminCommand',
                kID: 'AdminCommand',
                kMenuID: 'AdminCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: AdminCommand.GetTerminalInfoReq,
                kData: [
                  {
                    kData: AdminCommand.GetConfigurationReq,
                    kID: 'AdminCommand_GetConfigurationReq',
                  },
                  {
                    kData: AdminCommand.RebootReq,
                    kID: 'AdminCommand_RebootReq',
                  },
                  {
                    kData: AdminCommand.PingReq,
                    kID: 'AdminCommand_PingReq',
                  },
                  {
                    kData: AdminCommand.ResetReq,
                    kID: 'AdminCommand_ResetReq',
                  },
                  {
                    kData: AdminCommand.GetTerminalInfoReq,
                    kID: 'AdminCommand_GetTerminalInfoReq',
                  },
                  {
                    kData: AdminCommand.SetConfigurationReq,
                    kID: 'AdminCommand_SetConfigurationReq',
                  },
                ],
              },
           ];
  }

  static AdminResetReq formResetReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    AdminResetReq req = AdminResetReq();
    req.classID = RequestListModelQuery.query('Admin_Request_ResetReq-classID',queryList);
    return req;
  }

  static List<Map> getConfigurationData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'AdminCommand',
                kID: 'AdminCommand',
                kMenuID: 'AdminCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: AdminCommand.GetTerminalInfoReq,
                kData: [
                  {
                    kData: AdminCommand.GetConfigurationReq,
                    kID: 'AdminCommand_GetConfigurationReq',
                  },
                  {
                    kData: AdminCommand.RebootReq,
                    kID: 'AdminCommand_RebootReq',
                  },
                  {
                    kData: AdminCommand.PingReq,
                    kID: 'AdminCommand_PingReq',
                  },
                  {
                    kData: AdminCommand.ResetReq,
                    kID: 'AdminCommand_ResetReq',
                  },
                  {
                    kData: AdminCommand.GetTerminalInfoReq,
                    kID: 'AdminCommand_GetTerminalInfoReq',
                  },
                  {
                    kData: AdminCommand.SetConfigurationReq,
                    kID: 'AdminCommand_SetConfigurationReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'names',
                kValue: ' ',
                kID: 'Admin_Request_GetConfigurationReq-names',
                kType: DataItemType.StringList,
                kShow: true,
              },
           ];
  }

  static AdminGetConfigurationReq formGetConfigurationReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    AdminGetConfigurationReq req = AdminGetConfigurationReq();
    req.names = ListStringQuery.query('Admin_Request_GetConfigurationReq-names',queryList);
    return req;
  }

  static List<Map> setConfigurationData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'AdminCommand',
                kID: 'AdminCommand',
                kMenuID: 'AdminCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: AdminCommand.GetTerminalInfoReq,
                kData: [
                  {
                    kData: AdminCommand.GetConfigurationReq,
                    kID: 'AdminCommand_GetConfigurationReq',
                  },
                  {
                    kData: AdminCommand.RebootReq,
                    kID: 'AdminCommand_RebootReq',
                  },
                  {
                    kData: AdminCommand.PingReq,
                    kID: 'AdminCommand_PingReq',
                  },
                  {
                    kData: AdminCommand.ResetReq,
                    kID: 'AdminCommand_ResetReq',
                  },
                  {
                    kData: AdminCommand.GetTerminalInfoReq,
                    kID: 'AdminCommand_GetTerminalInfoReq',
                  },
                  {
                    kData: AdminCommand.SetConfigurationReq,
                    kID: 'AdminCommand_SetConfigurationReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kID: 'Admin_Request_SetConfigurationReq-configurations',
                kType: DataItemType.ModelList,
                kClass: 'SConfigurationInfo',
                kShow: true,
                kName: 'configurations',
                kValue: [
                  {
                    kType: DataItemType.CellInput,
                    kID: 'Admin_Request_SetConfigurationReq-configurations_name',
                    kName: 'name',
                  },
                  {
                    kType: DataItemType.CellInput,
                    kID: 'Admin_Request_SetConfigurationReq-configurations_value',
                    kName: 'value',
                  },
                ],
              },
           ];
  }

  static AdminSetConfigurationReq formSetConfigurationReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    AdminSetConfigurationReq req = AdminSetConfigurationReq();
    req.configurations = RequestListModelQuery.query('Admin_Request_SetConfigurationReq-configurations',queryList);
    return req;
  }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'GetConfigurationReq':
        list = AdminReqData.getConfigurationData();
        break;
      case 'RebootReq':
        list = AdminReqData.rebootData();
        break;
      case 'PingReq':
        list = AdminReqData.pingData();
        break;
      case 'ResetReq':
        list = AdminReqData.resetData();
        break;
      case 'GetTerminalInfoReq':
        list = AdminReqData.getTerminalInfoData();
        break;
      case 'SetConfigurationReq':
        list = AdminReqData.setConfigurationData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
