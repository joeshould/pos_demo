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

import 'package:pigeon/pigeon.dart';


@ConfigurePigeon(PigeonOptions(
    dartOut: 'lib/auto_pigeon/poslink_sdk_admin.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkAdmin',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkAdmin.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkAdmin.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkAdmin.m',
    cppHeaderOut: 'windows/runner/pigeon/POSLinkAdmin.h',
    cppSourceOut: 'windows/runner/pigeon/POSLinkAdmin.cpp',
    cppOptions: CppOptions(namespace: 'POSLinkAdmin'),
  ),
)
class AdminAbortReq {
  String? classID;
}

class AdminSConfigurationInfo {
  String? name;
  String? value;
}

class AdminSetConfigurationReq {
  List<AdminSConfigurationInfo?>? configurations;
}

class AdminGetConfigurationReq {
  List<String?>? names;
}

class AdminResetReq {
  String? classID;
}

class AdminPingReq {
  String? targetName;
  String? timeout;
}

class AdminRebootReq {
  String? classID;
}

class AdminGetTerminalInfoReq {
  String? classID;
}

class AdminGConfigurationInfo {
  String? name;
  String? value;
}

class AdminGetConfigurationRsp {
  String? responseCode;
  String? responseMessage;
  List<AdminGConfigurationInfo?>? configurations;
}

class AdminRebootRsp {
  String? responseCode;
  String? responseMessage;
}

class AdminPingRsp {
  String? responseCode;
  String? responseMessage;
  String? rtt;
}

class AdminResetRsp {
  String? responseCode;
  String? responseMessage;
}

class AdminGetTerminalInfoRsp {
  String? responseCode;
  String? responseMessage;
  String? sn;
  String? modelName;
  String? osVersion;
}

class AdminSetConfigurationRsp {
  String? responseCode;
  String? responseMessage;
}

@HostApi()
abstract class POSLinkAdminApi {
   @async
   AdminGetTerminalInfoRsp getTerminalInfo(AdminGetTerminalInfoReq req);
   @async
   AdminRebootRsp reboot(AdminRebootReq req);
   @async
   AdminPingRsp ping(AdminPingReq req);
   @async
   AdminResetRsp reset(AdminResetReq req);
   @async
   AdminGetConfigurationRsp getConfiguration(AdminGetConfigurationReq req);
   @async
   AdminSetConfigurationRsp setConfiguration(AdminSetConfigurationReq req);
}
