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

class DeviceMifareClassicWriteReq {
  DeviceMifareClassicWriteReq({
    this.password,
    this.passwordType,
    this.blockNumber,
    this.blockValue,
    this.timeout,
  });

  String? password;

  String? passwordType;

  String? blockNumber;

  String? blockValue;

  String? timeout;

  Object encode() {
    return <Object?>[
      password,
      passwordType,
      blockNumber,
      blockValue,
      timeout,
    ];
  }

  static DeviceMifareClassicWriteReq decode(Object result) {
    result as List<Object?>;
    return DeviceMifareClassicWriteReq(
      password: result[0] as String?,
      passwordType: result[1] as String?,
      blockNumber: result[2] as String?,
      blockValue: result[3] as String?,
      timeout: result[4] as String?,
    );
  }
}

class DeviceMifareClassicGetUIDReq {
  DeviceMifareClassicGetUIDReq({
    this.timeout,
  });

  String? timeout;

  Object encode() {
    return <Object?>[
      timeout,
    ];
  }

  static DeviceMifareClassicGetUIDReq decode(Object result) {
    result as List<Object?>;
    return DeviceMifareClassicGetUIDReq(
      timeout: result[0] as String?,
    );
  }
}

class DeviceMifareClassicReadReq {
  DeviceMifareClassicReadReq({
    this.password,
    this.passwordType,
    this.blockNumber,
    this.timeout,
  });

  String? password;

  String? passwordType;

  String? blockNumber;

  String? timeout;

  Object encode() {
    return <Object?>[
      password,
      passwordType,
      blockNumber,
      timeout,
    ];
  }

  static DeviceMifareClassicReadReq decode(Object result) {
    result as List<Object?>;
    return DeviceMifareClassicReadReq(
      password: result[0] as String?,
      passwordType: result[1] as String?,
      blockNumber: result[2] as String?,
      timeout: result[3] as String?,
    );
  }
}

class DeviceMifareClassicReadRsp {
  DeviceMifareClassicReadRsp({
    this.responseCode,
    this.responseMessage,
    this.blockValue,
  });

  String? responseCode;

  String? responseMessage;

  String? blockValue;

  Object encode() {
    return <Object?>[
      responseCode,
      responseMessage,
      blockValue,
    ];
  }

  static DeviceMifareClassicReadRsp decode(Object result) {
    result as List<Object?>;
    return DeviceMifareClassicReadRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
      blockValue: result[2] as String?,
    );
  }
}

class DeviceMifareClassicWriteRsp {
  DeviceMifareClassicWriteRsp({
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

  static DeviceMifareClassicWriteRsp decode(Object result) {
    result as List<Object?>;
    return DeviceMifareClassicWriteRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
    );
  }
}

class DeviceMifareClassicGetUIDRsp {
  DeviceMifareClassicGetUIDRsp({
    this.responseCode,
    this.responseMessage,
    this.uid,
  });

  String? responseCode;

  String? responseMessage;

  String? uid;

  Object encode() {
    return <Object?>[
      responseCode,
      responseMessage,
      uid,
    ];
  }

  static DeviceMifareClassicGetUIDRsp decode(Object result) {
    result as List<Object?>;
    return DeviceMifareClassicGetUIDRsp(
      responseCode: result[0] as String?,
      responseMessage: result[1] as String?,
      uid: result[2] as String?,
    );
  }
}

class _POSLinkDeviceApiCodec extends StandardMessageCodec {
  const _POSLinkDeviceApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is DeviceMifareClassicGetUIDReq) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is DeviceMifareClassicGetUIDRsp) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is DeviceMifareClassicReadReq) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is DeviceMifareClassicReadRsp) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is DeviceMifareClassicWriteReq) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is DeviceMifareClassicWriteRsp) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return DeviceMifareClassicGetUIDReq.decode(readValue(buffer)!);
      case 129: 
        return DeviceMifareClassicGetUIDRsp.decode(readValue(buffer)!);
      case 130: 
        return DeviceMifareClassicReadReq.decode(readValue(buffer)!);
      case 131: 
        return DeviceMifareClassicReadRsp.decode(readValue(buffer)!);
      case 132: 
        return DeviceMifareClassicWriteReq.decode(readValue(buffer)!);
      case 133: 
        return DeviceMifareClassicWriteRsp.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class POSLinkDeviceApi {
  /// Constructor for [POSLinkDeviceApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  POSLinkDeviceApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _POSLinkDeviceApiCodec();

  Future<DeviceMifareClassicReadRsp> mifareClassicRead(DeviceMifareClassicReadReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkDeviceApi.mifareClassicRead', codec,
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
      return (replyList[0] as DeviceMifareClassicReadRsp?)!;
    }
  }

  Future<DeviceMifareClassicGetUIDRsp> mifareClassicGetUID(DeviceMifareClassicGetUIDReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkDeviceApi.mifareClassicGetUID', codec,
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
      return (replyList[0] as DeviceMifareClassicGetUIDRsp?)!;
    }
  }

  Future<DeviceMifareClassicWriteRsp> mifareClassicWrite(DeviceMifareClassicWriteReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.poslink2.POSLinkDeviceApi.mifareClassicWrite', codec,
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
      return (replyList[0] as DeviceMifareClassicWriteRsp?)!;
    }
  }
}