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
    dartOut: 'lib/auto_pigeon/poslink_sdk_form.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkForm',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkForm.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkForm.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkForm.m',
    cppHeaderOut: 'windows/runner/pigeon/POSLinkForm.h',
    cppSourceOut: 'windows/runner/pigeon/POSLinkForm.cpp',
    cppOptions: CppOptions(namespace: 'POSLinkForm'),
  ),
)
class FormInputTextReq {
  String? title;
  String? prompt;
  String? inputType;
  String? timeout;
  String? minLength;
  String? maxLength;
}

class FormInputTextRsp {
  String? responseCode;
  String? responseMessage;
  String? inputText;
}

@HostApi()
abstract class POSLinkFormApi {
   @async
   FormInputTextRsp inputText(FormInputTextReq req);
}
