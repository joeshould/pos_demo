
import 'package:flutter/material.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_test.dart';

import 'comm_setting_view_model.dart';

class TestViewModel extends ChangeNotifier {
  int count = 1;
  int _times = 0;
  String _data = "";
  bool stop = false;

  int get times => _times;

  String get data => _data;

  Future transactionStartTest(CommSettingViewModel commSettingViewModel) async {
    _times = 0;
    _data = "";
    notifyListeners();
    await commSettingViewModel.setSetting();
    while (_times < count && !stop) {
      String response =
          await POSLinkTestApi().transactionStartTest((_times + 1).toString());
      if (_data.isNotEmpty) {
        _data = _data + "\n\n";
      }
      _data = _data + (_times + 1).toString() + "\n" + response;
      _times++;
      notifyListeners();
    }
    stop = false;
  }
}
