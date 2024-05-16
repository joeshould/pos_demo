import 'package:flutter/material.dart';
import 'package:poslink2/auto_pigeon/poslink_sdk_log_set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogSettingViewModel extends ChangeNotifier {
  static const KEY_ENABLE = "LOG_ENABLE";
  static const KEY_LEVEL = "LOG_LEVEL";
  static const KEY_DAYS = "LOG_DAYS";
  static const KEY_FILE_NAME = "LOG_FILE_NAME";
  static const KEY_FILE_PATH = "LOG_FILE_PATH";

  bool _enable = true;
  LogLevel _level = LogLevel.DEBUG;
  int _days = 30;
  String _fileName = "POSLog";
  String _filePath = "";

  LogSettingViewModel() {
    _getLocalData();
  }

  bool get enable => _enable;

  set enable(bool value) {
    _enable = value;
  }

  LogLevel get level => _level;

  set level(LogLevel value) {
    _level = value;
    notifyListeners();
  }

  int get days => _days;

  set days(int value) {
    _days = value;
  }

  String get fileName => _fileName;

  set fileName(String value) {
    _fileName = value;
  }

  String get filePath => _filePath;

  set filePath(String value) {
    _filePath = value;
  }

  save() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(KEY_ENABLE, _enable);
    pref.setInt(KEY_LEVEL, _level.index);
    pref.setInt(KEY_DAYS, _days);
    pref.setString(KEY_FILE_NAME, _fileName);
    pref.setString(KEY_FILE_PATH, _filePath);
    _setLogSetting();
    notifyListeners();
  }

  _getLocalData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _enable = pref.getBool(KEY_ENABLE) ?? true;
    _level = LogLevel.values[pref.getInt(KEY_LEVEL) ?? 1];
    _days = pref.getInt(KEY_DAYS) ?? 30;
    _fileName = pref.getString(KEY_FILE_NAME) ?? "POSLog";
    _filePath = pref.getString(KEY_FILE_PATH) ?? "";
    notifyListeners();
  }

  Future _setLogSetting() async {
    await POSLinkLogSetApi().setLogSetting(LogSetting()
      ..enable = _enable
      ..level = _level
      ..days = _days
      ..fileName = _fileName
      ..filePath = _filePath);
  }
}
