import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/auto_pigeon/poslink_sdk_set.dart',
  javaOptions: JavaOptions(
    className: 'POSLinkSet',
    package: 'com.pax.poslink2.pigeon',
  ),
  objcOptions: ObjcOptions(prefix: ''),
  javaOut:
      './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkSet.java',
  objcHeaderOut: 'ios/Runner/Pigeon/POSLinkSet.h',
  objcSourceOut: 'ios/Runner/Pigeon/POSLinkSet.m',
  cppHeaderOut: 'windows/runner/pigeon/POSLinkSet.h',
  cppSourceOut: 'windows/runner/pigeon/POSLinkSet.cpp',
  cppOptions: CppOptions(namespace: 'POSLinkSet'),
))
class TCPSetting {
  int? timeout;
  String? ip;
  String? port;
}

class HttpSetting {
  int? timeout;
  String? ip;
  String? port;
}

class HttpsSetting {
  int? timeout;
  String? ip;
  String? port;
}

class SslSetting {
  int? timeout;
  String? ip;
  String? port;
}

class UsbSetting {
  int? timeout;
  String? channel;
}

class UartSetting {
  int? timeout;
  String? serialPort;
  String? baudRate;
}

@HostApi()
abstract class POSLinkSetApi {
  void setAIDLSetting();

  void setTCPSetting(TCPSetting setting);

  void setHttpSetting(HttpSetting setting);

  void setHttpsSetting(HttpsSetting setting);

  void setSslSetting(SslSetting setting);

  void setUsbSetting(UsbSetting setting);

  void setUartSetting(UartSetting setting);

  List<String> getUartDevices();

  void cancel();
}
