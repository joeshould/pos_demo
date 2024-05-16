import 'package:flutter/material.dart';
import 'package:poslink2/auto_data_source/auto_data_source_common.dart';
import 'package:poslink2/auto_data_source/auto_form_request_data_source.dart';
import 'package:poslink2/auto_data_source/auto_form_response_data_source.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_form.dart';
import 'package:poslink2/model/response_db.dart';

import 'comm_setting_view_model.dart';

class FormViewModel extends ChangeNotifier {
  Future start(CommSettingViewModel commSettingViewModel, ResponseDataBase responseDataBase, List<Map> dataSource) async{
    POSLinkFormApi formApi = POSLinkFormApi();

    /// setting
    await commSettingViewModel.setSetting();

    /// command
    Map cmdData = dataSource.first;
    switch (cmdData[kValue]) {
      case FormCommand.InputTextReq:

      /// 获取请求数据
        FormInputTextReq req = FormReqData.formInputTextReq(dataSource);

        /// 交易
        FormInputTextRsp rsp = await formApi.inputText(req);

        /// 响应数据更新到UI
        FormRspData.parseRspFormInputTextRsp(rsp, responseDataBase.formData);
        break;
    }
  }
}
