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
import 'package:poslink2/auto_pigeon/poslink_sdk_form.dart';
import 'package:poslink2/auto_data_source/auto_query.dart';
class FormReqData {
  static List<Map> initSourceData() {
    return FormReqData.inputTextData();
  }
  static List<Map> inputTextData() {
      return [
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'FormCommand',
                kID: 'FormCommand',
                kMenuID: 'FormCommand_menubtn',
                kType: DataItemType.Menu,
                kShow: true,
                kValue: FormCommand.InputTextReq,
                kData: [
                  {
                    kData: FormCommand.InputTextReq,
                    kID: 'FormCommand_InputTextReq',
                  },
                ],
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'title',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Form_Request_InputTextReq-title',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'prompt',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Form_Request_InputTextReq-prompt',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'inputType',
                kValue: '',
                kTextAttribute: 2,
                kID: 'Form_Request_InputTextReq-inputType',
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
                kID: 'Form_Request_InputTextReq-timeout',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'minLength',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Form_Request_InputTextReq-minLength',
                kType: DataItemType.CellInput,
                kShow: true,
              },
              {
                kSuperGroupName: '',
                kTextShowType: 1,
                kEnable: true,
                kLevel: 1,
                kName: 'maxLength',
                kValue: '',
                kTextAttribute: 1,
                kID: 'Form_Request_InputTextReq-maxLength',
                kType: DataItemType.CellInput,
                kShow: true,
              },
           ];
  }

  static FormInputTextReq formInputTextReq(List<Map> list) {
    List<Map> queryList = [];
    queryList.addAll(list);
    FormInputTextReq req = FormInputTextReq();
    req.title = RequestListModelQuery.query('Form_Request_InputTextReq-title',queryList);
    req.prompt = RequestListModelQuery.query('Form_Request_InputTextReq-prompt',queryList);
    req.inputType = RequestListModelQuery.query('Form_Request_InputTextReq-inputType',queryList);
    req.timeout = RequestListModelQuery.query('Form_Request_InputTextReq-timeout',queryList);
    req.minLength = RequestListModelQuery.query('Form_Request_InputTextReq-minLength',queryList);
    req.maxLength = RequestListModelQuery.query('Form_Request_InputTextReq-maxLength',queryList);
    return req;
  }

  static List<Map>? queryDataByString(String string) {
    List tempList = string.split('.');
    if (tempList.length < 2) { return null; }
    String tempStr = tempList[1];
    List<Map> list;
    switch (tempStr) {
      case 'InputTextReq':
        list = FormReqData.inputTextData();
        break;
      default:
        list = [];
        break;
    }
    return list;
  }

}
