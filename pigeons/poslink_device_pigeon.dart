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
    dartOut: 'lib/auto_pigeon/poslink_sdk_device.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkDevice',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkDevice.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkDevice.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkDevice.m',
    cppHeaderOut: 'windows/runner/pigeon/POSLinkDevice.h',
    cppSourceOut: 'windows/runner/pigeon/POSLinkDevice.cpp',
    cppOptions: CppOptions(namespace: 'POSLinkDevice'),
  ),
)
class DeviceMifareClassicWriteReq {
  String? password;
  String? passwordType;
  String? blockNumber;
  String? blockValue;
  String? timeout;
}

class DeviceMifareClassicGetUIDReq {
  String? timeout;
}

class DeviceMifareClassicReadReq {
  String? password;
  String? passwordType;
  String? blockNumber;
  String? timeout;
}

class DeviceMifareClassicReadRsp {
  String? responseCode;
  String? responseMessage;
  String? blockValue;
}

class DeviceMifareClassicWriteRsp {
  String? responseCode;
  String? responseMessage;
}

class DeviceMifareClassicGetUIDRsp {
  String? responseCode;
  String? responseMessage;
  String? uid;
}

@HostApi()
abstract class POSLinkDeviceApi {
   @async
   DeviceMifareClassicReadRsp mifareClassicRead(DeviceMifareClassicReadReq req);
   @async
   DeviceMifareClassicGetUIDRsp mifareClassicGetUID(DeviceMifareClassicGetUIDReq req);
   @async
   DeviceMifareClassicWriteRsp mifareClassicWrite(DeviceMifareClassicWriteReq req);
}
