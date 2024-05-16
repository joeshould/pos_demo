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
    dartOut: 'lib/auto_pigeon/poslink_sdk_report.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkReport',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkReport.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkReport.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkReport.m',
    cppHeaderOut: 'windows/runner/pigeon/POSLinkReport.h',
    cppSourceOut: 'windows/runner/pigeon/POSLinkReport.cpp',
    cppOptions: CppOptions(namespace: 'POSLinkReport'),
  ),
)
class ReportGetTransactionInfoReq {
  String? registerReferenceNumber;
}

class ReportGetCardStatusReq {
  String? classID;
}

class ReportGetTraceInfoByCardReq {
  String? timeout;
  String? transactionAmount;
}

class ReportGetCardInfoReq {
  String? timeout;
}

class ReportAccountRsp {
  String? expireDate;
  ReportCardType? cardType;
  String? cardTypeName;
}

class ReportGetCardInfoRsp {
  String? responseCode;
  String? responseMessage;
  String? account;
  ReportAccountRsp? accountInformation;
}

class ReportTraceInfo {
  String? registerReferenceNumber;
  String? hostReferenceNumber;
}

class ReportGetTraceInfoByCardRsp {
  String? responseCode;
  String? responseMessage;
  List<ReportTraceInfo?>? traceInfo;
  String? account;
}

class ReportGetCardStatusRsp {
  String? responseCode;
  String? responseMessage;
  String? cardType;
  String? account;
  ReportAccountRsp? accountInformation;
}

class ReportGetTransactionInfoRsp {
  String? responseCode;
  String? responseMessage;
  String? status;
  String? hostData;
  String? hostReferenceNumber;
  String? timeStamp;
}

enum ReportCardType {
  NotSet,
  Visa,
  MasterCard,
  Amex,
  Discover,
  DinerClub,
  Cup,
  Maestro,
  Other,
}

@HostApi()
abstract class POSLinkReportApi {
   @async
   ReportGetCardInfoRsp getCardInfo(ReportGetCardInfoReq req);
   @async
   ReportGetTraceInfoByCardRsp getTraceInfoByCard(ReportGetTraceInfoByCardReq req);
   @async
   ReportGetCardStatusRsp getCardStatus(ReportGetCardStatusReq req);
   @async
   ReportGetTransactionInfoRsp getTransactionInfo(ReportGetTransactionInfoReq req);
}
