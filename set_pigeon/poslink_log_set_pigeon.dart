import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/auto_pigeon/poslink_sdk_log_set.dart',
  javaOptions: JavaOptions(
    className: 'POSLinkLogSet',
    package: 'com.pax.poslink2.pigeon',
  ),
  objcOptions: ObjcOptions(prefix: ''),
  javaOut:
      './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkLogSet.java',
  objcHeaderOut: 'ios/Runner/Pigeon/POSLinkLogSet.h',
  objcSourceOut: 'ios/Runner/Pigeon/POSLinkLogSet.m',
  cppHeaderOut: 'windows/runner/pigeon/POSLinkLogSet.h',
  cppSourceOut: 'windows/runner/pigeon/POSLinkLogSet.cpp',
  cppOptions: CppOptions(namespace: 'POSLinkLogSet'),
))
enum LogLevel {
  ERROR,
  DEBUG,
}

class LogSetting {
  String? fileName;
  String? filePath;
  int? days;
  bool? enable;
  LogLevel? level;
}

@HostApi()
abstract class POSLinkLogSetApi {
  void setLogSetting(LogSetting logSetting);
}
