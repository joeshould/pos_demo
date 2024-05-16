// Autogenerated from Pigeon (v1.0.12), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class MIFARECardMIFAREReadRsp {
  String? responseCode;
  String? responseMessage;
  String? blockValue;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['responseCode'] = responseCode;
    pigeonMap['responseMessage'] = responseMessage;
    pigeonMap['blockValue'] = blockValue;
    return pigeonMap;
  }

  static MIFARECardMIFAREReadRsp decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MIFARECardMIFAREReadRsp()
      ..responseCode = pigeonMap['responseCode'] as String?
      ..responseMessage = pigeonMap['responseMessage'] as String?
      ..blockValue = pigeonMap['blockValue'] as String?;
  }
}

class MIFARECardMIFAREWriteRsp {
  String? responseCode;
  String? responseMessage;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['responseCode'] = responseCode;
    pigeonMap['responseMessage'] = responseMessage;
    return pigeonMap;
  }

  static MIFARECardMIFAREWriteRsp decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MIFARECardMIFAREWriteRsp()
      ..responseCode = pigeonMap['responseCode'] as String?
      ..responseMessage = pigeonMap['responseMessage'] as String?;
  }
}

class MIFARECardMIFAREWriteReq {
  String? password;
  String? passwordType;
  String? blockNumber;
  String? blockValue;
  String? timeout;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['password'] = password;
    pigeonMap['passwordType'] = passwordType;
    pigeonMap['blockNumber'] = blockNumber;
    pigeonMap['blockValue'] = blockValue;
    pigeonMap['timeout'] = timeout;
    return pigeonMap;
  }

  static MIFARECardMIFAREWriteReq decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MIFARECardMIFAREWriteReq()
      ..password = pigeonMap['password'] as String?
      ..passwordType = pigeonMap['passwordType'] as String?
      ..blockNumber = pigeonMap['blockNumber'] as String?
      ..blockValue = pigeonMap['blockValue'] as String?
      ..timeout = pigeonMap['timeout'] as String?;
  }
}

class MIFARECardMIFAREReadReq {
  String? password;
  String? passwordType;
  String? blockNumber;
  String? timeout;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['password'] = password;
    pigeonMap['passwordType'] = passwordType;
    pigeonMap['blockNumber'] = blockNumber;
    pigeonMap['timeout'] = timeout;
    return pigeonMap;
  }

  static MIFARECardMIFAREReadReq decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MIFARECardMIFAREReadReq()
      ..password = pigeonMap['password'] as String?
      ..passwordType = pigeonMap['passwordType'] as String?
      ..blockNumber = pigeonMap['blockNumber'] as String?
      ..timeout = pigeonMap['timeout'] as String?;
  }
}

class _POSLinkMIFARECardApiCodec extends StandardMessageCodec {
  const _POSLinkMIFARECardApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MIFARECardMIFAREReadReq) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is MIFARECardMIFAREReadRsp) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
    if (value is MIFARECardMIFAREWriteReq) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else 
    if (value is MIFARECardMIFAREWriteRsp) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return MIFARECardMIFAREReadReq.decode(readValue(buffer)!);
      
      case 129:       
        return MIFARECardMIFAREReadRsp.decode(readValue(buffer)!);
      
      case 130:       
        return MIFARECardMIFAREWriteReq.decode(readValue(buffer)!);
      
      case 131:       
        return MIFARECardMIFAREWriteRsp.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class POSLinkMIFARECardApi {
  /// Constructor for [POSLinkMIFARECardApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  POSLinkMIFARECardApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _POSLinkMIFARECardApiCodec();

  Future<MIFARECardMIFAREWriteRsp> mIFAREWrite(MIFARECardMIFAREWriteReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.POSLinkMIFARECardApi.mIFAREWrite', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_req]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as MIFARECardMIFAREWriteRsp?)!;
    }
  }

  Future<MIFARECardMIFAREReadRsp> mIFARERead(MIFARECardMIFAREReadReq arg_req) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.POSLinkMIFARECardApi.mIFARERead', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_req]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as MIFARECardMIFAREReadRsp?)!;
    }
  }
}
