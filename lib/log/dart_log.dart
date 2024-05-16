/*
 * ============================================================================
 * = COPYRIGHT
 *          PAX Computer Technology(Shenzhen) CO., LTD PROPRIETARY INFORMATION
 *   This software is supplied under the terms of a license agreement or nondisclosure
 *   agreement with PAX Computer Technology(Shenzhen) CO., LTD and may not be copied or
 *   disclosed except in accordance with the terms in that agreement.
 *     Copyright (C) 2018-? PAX Computer Technology(Shenzhen) CO., LTD All rights reserved.

 * Module Date: 9/8/2020
 * Module Auth: Fahy.F
 * Description:

 * Revision History:
 * Date                   Author                       Action
 * 9/8/2020              Fahy.F                       Create
 * ============================================================================
 */
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logging;
import 'package:path_provider/path_provider.dart';
import 'package:stack_trace/stack_trace.dart';

const String ERROR_LOG_PATH = "/log";

class LogLevel {
  static const LogLevel ON = LogLevel._("ON", logging.Level.ALL);
  static const LogLevel VERBOSE = LogLevel._("V", logging.Level.FINER);
  static const LogLevel DEBUG = LogLevel._("D", logging.Level.FINE);
  static const LogLevel INFO = LogLevel._("I", logging.Level.INFO);
  static const LogLevel WARNING = LogLevel._("W", logging.Level.WARNING);
  static const LogLevel ERROR = LogLevel._("E", logging.Level.SEVERE);
  static const LogLevel OFF = LogLevel._("OFF", logging.Level.OFF);

  final String name;
  final logging.Level level;

  const LogLevel._(this.name, this.level);

  @override
  String toString() => name;
}

class Log {
  static final _LogWrapper _wrapper = _LogWrapper();
  static const HIERARCHY_DEFAULT = 2;

  Log._(); // Define private constructor

  static void customize(String name,
      {LogLevel level = LogLevel.ON,
      int hierarchy = HIERARCHY_DEFAULT,
      bool showTrace = false}) {
    _wrapper.customize(name, level, hierarchy, showTrace);
  }

  static bool isLoggable(LogLevel logLevel) {
    return _wrapper.isLoggable(logLevel);
  }

  static void v(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _wrapper.v(message, error, stackTrace);

  static void d(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _wrapper.d(message, error, stackTrace);

  static void i(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _wrapper.i(message, error, stackTrace);

  static void w(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _wrapper.w(message, error, stackTrace);

  static void e(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _wrapper.e(message, error, stackTrace);
}

class _LogWrapper {
  late logging.Logger _log;
  late int _hierarchy;
  late bool _showTrace;

  _LogWrapper(
      {String logName = "TAG",
      LogLevel level = LogLevel.ON,
      int hierarchy = 1,
      bool showTrace = false}) {
    logging.hierarchicalLoggingEnabled = true;
    customize(logName, level, hierarchy, showTrace);
  }

  void customize(
      String logName, LogLevel level, int hierarchy, bool showTrace) {
    _hierarchy = hierarchy;
    _showTrace = showTrace;
    _log = logging.Logger(logName);
    _log.level = level.level;
    _log.onRecord.listen((record) async {
      if (!kDebugMode && isLoggable()) {
        // Show log in non-debug mode, controlled by LogLevel
        print(record);
      }
      // this method only show log in debug mode
      developer.log(record.message,
          name: record.loggerName,
          level: record.level.value,
          // time: record.time,
          // zone: record.zone,
          // sequenceNumber: record.sequenceNumber,
          error: record.error,
          stackTrace: record.stackTrace);

      if (record.level.value >= LogLevel.WARNING.level.value) {
        await _saveErrorInfo(record.toString());
      }
    });

    FlutterError.onError = (FlutterErrorDetails details) async {
      v("save error");
      await _saveErrorInfo(details.toString());
      FlutterError.presentError(details);
    };
  }

  Future _saveErrorInfo(String error) async {
    if (error.isEmpty) {
      return;
    }
    Directory directory;
    if (Platform.isAndroid) {
      directory = (await getExternalCacheDirectories())?.first ?? await getApplicationDocumentsDirectory();
    } else {
      directory = await getTemporaryDirectory();
    }
    Directory logDirectory =
        Directory(directory.absolute.path + ERROR_LOG_PATH);
    DateTime currentDate = DateTime.now();
    if (!logDirectory.existsSync()) {
      logDirectory.createSync();
    }
    File file = File(
        logDirectory.absolute.path + "/" + currentDate.toString() + ".txt");
    file.createSync();
    // v("file path:" + file.absolute.path);
    file.writeAsString(error);
  }

  bool isLoggable([LogLevel? logLevel]) {
    return _log.isLoggable(logLevel?.level ?? _log.level);
  }

  void v(dynamic message, [Object? error, StackTrace? stackTrace]) {
    // the logging lib has already checked whether it isLoggable;
    _log.finer("$message ${_showTrace ? "\n $trace" : ""}", error, stackTrace);
  }

  void d(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _log.fine("$message ${_showTrace ? "\n $trace" : ""}", error, stackTrace);
  }

  void i(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _log.info("$message ${_showTrace ? "\n $trace" : ""}", error, stackTrace);
  }

  void w(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _log.warning(
        "$message ${_showTrace ? "\n $trace" : ""}", error, stackTrace);
  }

  void e(dynamic message, [Object? error, StackTrace? stackTrace]) {
    _log.severe("$message ${_showTrace ? "\n $trace" : ""}", error, stackTrace);
  }

  Frame get trace {
    return Trace.current(_hierarchy + 1).frames[0];
  }
}
