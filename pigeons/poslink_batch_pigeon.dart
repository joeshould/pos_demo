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
    dartOut: 'lib/auto_pigeon/poslink_sdk_batch.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkBatch',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkBatch.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkBatch.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkBatch.m',
    cppHeaderOut: 'windows/runner/pigeon/POSLinkBatch.h',
    cppSourceOut: 'windows/runner/pigeon/POSLinkBatch.cpp',
    cppOptions: CppOptions(namespace: 'POSLinkBatch'),
  ),
)
class BatchBatchClearReq {
  String? classID;
}

class BatchBatchCloseReq {
  String? classID;
}

class BatchBatchCloseRsp {
  String? responseCode;
  String? responseMessage;
  String? hostData;
  String? totalCount;
  String? totalAmount;
  String? timeStamp;
}

class BatchBatchClearRsp {
  String? responseCode;
  String? responseMessage;
}

@HostApi()
abstract class POSLinkBatchApi {
   @async
   BatchBatchCloseRsp batchClose(BatchBatchCloseReq req);
   @async
   BatchBatchClearRsp batchClear(BatchBatchClearReq req);
}
