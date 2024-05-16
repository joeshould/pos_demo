import 'package:pigeon/pigeon.dart';

// flutter pub run pigeon --input test_pigeon/poslink_test_pigeon.dart
@ConfigurePigeon(PigeonOptions(
    dartOut: 'lib/auto_pigeon/poslink_sdk_test.dart',
    javaOptions: JavaOptions(
      className: 'POSLinkTest',
      package: 'com.pax.poslink2.pigeon',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkTest.java',
    objcHeaderOut: 'ios/Runner/Pigeon/POSLinkTest.h',
    objcSourceOut: 'ios/Runner/Pigeon/POSLinkTest.m'))

@HostApi()
abstract class POSLinkTestApi{
  @async
  String transactionStartTest(String registerReferenceNumber);
}
