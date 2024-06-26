// Autogenerated from Pigeon (v12.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
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

class TransactionTransactionReversalReq {
  TransactionTransactionReversalReq({
    this.originalHostReferenceNumber,
    this.originalHostData,
  });

  String? originalHostReferenceNumber;

  String? originalHostData;

  Object encode() {
    return <Object?>[
      originalHostReferenceNumber,
      originalHostData,
    ];
  }

  static TransactionTransactionReversalReq decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionReversalReq(
      originalHostReferenceNumber: result[0] as String?,
      originalHostData: result[1] as String?,
    );
  }
}

class TransactionTransactionCompletionReq {
  TransactionTransactionCompletionReq({
    this.transactionAmount,
    this.originalHostReferenceNumber,
    this.originalHostData,
    this.verifyCard,
  });

  String? transactionAmount;

  String? originalHostReferenceNumber;

  String? originalHostData;

  String? verifyCard;

  Object encode() {
    return <Object?>[
      transactionAmount,
      originalHostReferenceNumber,
      originalHostData,
      verifyCard,
    ];
  }

  static TransactionTransactionCompletionReq decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionCompletionReq(
      transactionAmount: result[0] as String?,
      originalHostReferenceNumber: result[1] as String?,
      originalHostData: result[2] as String?,
      verifyCard: result[3] as String?,
    );
  }
}

class TransactionTransactionIncrementalReq {
  TransactionTransactionIncrementalReq({
    this.transactionAmount,
    this.originalHostReferenceNumber,
    this.originalHostData,
  });

  String? transactionAmount;

  String? originalHostReferenceNumber;

  String? originalHostData;

  Object encode() {
    return <Object?>[
      transactionAmount,
      originalHostReferenceNumber,
      originalHostData,
    ];
  }

  static TransactionTransactionIncrementalReq decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionIncrementalReq(
      transactionAmount: result[0] as String?,
      originalHostReferenceNumber: result[1] as String?,
      originalHostData: result[2] as String?,
    );
  }
}

class TransactionAccountReq {
  TransactionAccountReq({
    this.cardExpireDate,
  });

  String? cardExpireDate;

  Object encode() {
    return <Object?>[
      cardExpireDate,
    ];
  }

  static TransactionAccountReq decode(Object result) {
    result as List<Object?>;
    return TransactionAccountReq(
      cardExpireDate: result[0] as String?,
    );
  }
}

class TransactionHostGateway {
  TransactionHostGateway({
    this.tokenRequestFlag,
    this.token,
  });

  String? tokenRequestFlag;

  String? token;

  Object encode() {
    return <Object?>[
      tokenRequestFlag,
      token,
    ];
  }

  static TransactionHostGateway decode(Object result) {
    result as List<Object?>;
    return TransactionHostGateway(
      tokenRequestFlag: result[0] as String?,
      token: result[1] as String?,
    );
  }
}

class TransactionTransactionStartReq {
  TransactionTransactionStartReq({
    this.transactionAmount,
    this.registerReferenceNumber,
    this.account,
    this.reportStatus,
    this.hostGateway,
    this.accountInformation,
  });

  String? transactionAmount;

  String? registerReferenceNumber;

  String? account;

  String? reportStatus;

  TransactionHostGateway? hostGateway;

  TransactionAccountReq? accountInformation;

  Object encode() {
    return <Object?>[
      transactionAmount,
      registerReferenceNumber,
      account,
      reportStatus,
      hostGateway?.encode(),
      accountInformation?.encode(),
    ];
  }

  static TransactionTransactionStartReq decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionStartReq(
      transactionAmount: result[0] as String?,
      registerReferenceNumber: result[1] as String?,
      account: result[2] as String?,
      reportStatus: result[3] as String?,
      hostGateway: result[4] != null
          ? TransactionHostGateway.decode(result[4]! as List<Object?>)
          : null,
      accountInformation: result[5] != null
          ? TransactionAccountReq.decode(result[5]! as List<Object?>)
          : null,
    );
  }
}

class TransactionHostRsp {
  TransactionHostRsp({
    this.token,
  });

  String? token;

  Object encode() {
    return <Object?>[
      token,
    ];
  }

  static TransactionHostRsp decode(Object result) {
    result as List<Object?>;
    return TransactionHostRsp(
      token: result[0] as String?,
    );
  }
}

class TransactionAccountRsp {
  TransactionAccountRsp({
    this.expireDate,
    this.cardType,
    this.cardTypeName,
  });

  String? expireDate;

  TransactionCardType? cardType;

  String? cardTypeName;

  Object encode() {
    return <Object?>[
      expireDate,
      cardType?.index,
      cardTypeName,
    ];
  }

  static TransactionAccountRsp decode(Object result) {
    result as List<Object?>;
    return TransactionAccountRsp(
      expireDate: result[0] as String?,
      cardType: result[1] != null
          ? TransactionCardType.values[result[1]! as int]
          : null,
      cardTypeName: result[2] as String?,
    );
  }
}

class TransactionTransactionStartRsp {
  TransactionTransactionStartRsp({
    this.responseCode,
    this.responseMessage,
    this.hostReferenceNumber,
    this.hostData,
    this.account,
    this.timestamp,
    this.accountInformation,
    this.hostInformation,
  });

  String? responseCode;

  String? responseMessage;

  String? hostReferenceNumber;

  String? hostData;

  String? account;

  String? timestamp;

  TransactionAccountRsp? accountInformation;

  TransactionHostRsp? hostInformation;

  Object encode() {
    return <Object?>[
      responseCode,
      responseMessage,
      hostReferenceNumber,
      hostData,
      account,
      timestamp,
      accountInformation?.encode(),
      hostInformation?.encode(),
    ];
  }

  static TransactionTransactionStartRsp decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionStartRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
      hostReferenceNumber: result[2] as String?,
      hostData: result[3] as String?,
      account: result[4] as String?,
      timestamp: result[5] as String?,
      accountInformation: result[6] != null
          ? TransactionAccountRsp.decode(result[6]! as List<Object?>)
          : null,
      hostInformation: result[7] != null
          ? TransactionHostRsp.decode(result[7]! as List<Object?>)
          : null,
    );
  }
}

class TransactionTransactionIncrementalRsp {
  TransactionTransactionIncrementalRsp({
    this.responseCode,
    this.responseMessage,
    this.hostReferenceNumber,
    this.hostData,
    this.timestamp,
  });

  String? responseCode;

  String? responseMessage;

  String? hostReferenceNumber;

  String? hostData;

  String? timestamp;

  Object encode() {
    return <Object?>[
      responseCode,
      responseMessage,
      hostReferenceNumber,
      hostData,
      timestamp,
    ];
  }

  static TransactionTransactionIncrementalRsp decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionIncrementalRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
      hostReferenceNumber: result[2] as String?,
      hostData: result[3] as String?,
      timestamp: result[4] as String?,
    );
  }
}

class TransactionTransactionCompletionRsp {
  TransactionTransactionCompletionRsp({
    this.responseCode,
    this.responseMessage,
    this.hostReferenceNumber,
    this.hostData,
    this.timestamp,
  });

  String? responseCode;

  String? responseMessage;

  String? hostReferenceNumber;

  String? hostData;

  String? timestamp;

  Object encode() {
    return <Object?>[
      responseCode,
      responseMessage,
      hostReferenceNumber,
      hostData,
      timestamp,
    ];
  }

  static TransactionTransactionCompletionRsp decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionCompletionRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
      hostReferenceNumber: result[2] as String?,
      hostData: result[3] as String?,
      timestamp: result[4] as String?,
    );
  }
}

class TransactionTransactionReversalRsp {
  TransactionTransactionReversalRsp({
    this.responseCode,
    this.responseMessage,
  });

  String? responseCode;

  String? responseMessage;

  Object encode() {
    return <Object?>[
      responseCode,
      responseMessage,
    ];
  }

  static TransactionTransactionReversalRsp decode(Object result) {
    result as List<Object?>;
    return TransactionTransactionReversalRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
    );
  }
}

class _POSLinkTransactionApiCodec extends StandardMessageCodec {
  const _POSLinkTransactionApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is TransactionAccountReq) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is TransactionAccountRsp) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is TransactionHostGateway) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is TransactionHostRsp) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionCompletionReq) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionCompletionRsp) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionIncrementalReq) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionIncrementalRsp) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionReversalReq) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionReversalRsp) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionStartReq) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is TransactionTransactionStartRsp) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return TransactionAccountReq.decode(readValue(buffer)!);
      case 129: 
        return TransactionAccountRsp.decode(readValue(buffer)!);
      case 130: 
        return TransactionHostGateway.decode(readValue(buffer)!);
      case 131: 
        return TransactionHostRsp.decode(readValue(buffer)!);
      case 132: 
        return TransactionTransactionCompletionReq.decode(readValue(buffer)!);
      case 133: 
        return TransactionTransactionCompletionRsp.decode(readValue(buffer)!);
      case 134: 
        return TransactionTransactionIncrementalReq.decode(readValue(buffer)!);
      case 135: 
        return TransactionTransactionIncrementalRsp.decode(readValue(buffer)!);
      case 136: 
        return TransactionTransactionReversalReq.decode(readValue(buffer)!);
      case 137: 
        return TransactionTransactionReversalRsp.decode(readValue(buffer)!);
      case 138: 
        return TransactionTransactionStartReq.decode(readValue(buffer)!);
      case 139: 
        return TransactionTransactionStartRsp.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class POSLinkTransactionApi {
  /// Constructor for [POSLinkTransactionApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  POSLinkTransactionApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _POSLinkTransactionApiCodec();

  Future<TransactionTransactionStartRsp> transactionStart(TransactionTransactionStartReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkTransactionApi.transactionStart', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_req]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as TransactionTransactionStartRsp?)!;
    }
  }

  Future<TransactionTransactionIncrementalRsp> transactionIncremental(TransactionTransactionIncrementalReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkTransactionApi.transactionIncremental', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_req]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as TransactionTransactionIncrementalRsp?)!;
    }
  }

  Future<TransactionTransactionCompletionRsp> transactionCompletion(TransactionTransactionCompletionReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkTransactionApi.transactionCompletion', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_req]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as TransactionTransactionCompletionRsp?)!;
    }
  }

  Future<TransactionTransactionReversalRsp> transactionReversal(TransactionTransactionReversalReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkTransactionApi.transactionReversal', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_req]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as TransactionTransactionReversalRsp?)!;
    }
  }
}
