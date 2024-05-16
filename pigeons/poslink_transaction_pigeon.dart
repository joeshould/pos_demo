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
    dartOut: 'lib/auto_pigeon/poslink_sdk_transaction.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkTransaction',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkTransaction.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkTransaction.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkTransaction.m',
    cppHeaderOut: 'windows/runner/pigeon/POSLinkTransaction.h',
    cppSourceOut: 'windows/runner/pigeon/POSLinkTransaction.cpp',
    cppOptions: CppOptions(namespace: 'POSLinkTransaction'),
  ),
)
class TransactionTransactionReversalReq {
  String? originalHostReferenceNumber;
  String? originalHostData;
}

class TransactionTransactionCompletionReq {
  String? transactionAmount;
  String? originalHostReferenceNumber;
  String? originalHostData;
  String? verifyCard;
}

class TransactionTransactionIncrementalReq {
  String? transactionAmount;
  String? originalHostReferenceNumber;
  String? originalHostData;
}

class TransactionAccountReq {
  String? cardExpireDate;
}

class TransactionHostGateway {
  String? tokenRequestFlag;
  String? token;
}

class TransactionTransactionStartReq {
  String? transactionAmount;
  String? registerReferenceNumber;
  String? account;
  String? reportStatus;
  TransactionHostGateway? hostGateway;
  TransactionAccountReq? accountInformation;
}

class TransactionHostRsp {
  String? token;
}

class TransactionAccountRsp {
  String? expireDate;
  TransactionCardType? cardType;
  String? cardTypeName;
}

class TransactionTransactionStartRsp {
  String? responseCode;
  String? responseMessage;
  String? hostReferenceNumber;
  String? hostData;
  String? account;
  String? timestamp;
  TransactionAccountRsp? accountInformation;
  TransactionHostRsp? hostInformation;
}

class TransactionTransactionIncrementalRsp {
  String? responseCode;
  String? responseMessage;
  String? hostReferenceNumber;
  String? hostData;
  String? timestamp;
}

class TransactionTransactionCompletionRsp {
  String? responseCode;
  String? responseMessage;
  String? hostReferenceNumber;
  String? hostData;
  String? timestamp;
}

class TransactionTransactionReversalRsp {
  String? responseCode;
  String? responseMessage;
}

enum TransactionCardType {
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
abstract class POSLinkTransactionApi {
   @async
   TransactionTransactionStartRsp transactionStart(TransactionTransactionStartReq req);
   @async
   TransactionTransactionIncrementalRsp transactionIncremental(TransactionTransactionIncrementalReq req);
   @async
   TransactionTransactionCompletionRsp transactionCompletion(TransactionTransactionCompletionReq req);
   @async
   TransactionTransactionReversalRsp transactionReversal(TransactionTransactionReversalReq req);
}
