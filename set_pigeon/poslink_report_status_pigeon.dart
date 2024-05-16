import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/auto_pigeon/poslink_sdk_report_status.dart',
    // javaOptions: JavaOptions(
    //   className: 'POSLinkGetReportStatus',
    //   package: 'com.pax.poslink2.pigeon',
    // ),
    // objcOptions: ObjcOptions(prefix: ''),
    // javaOut: './android/app/src/main/java/com/pax/poslink2/pigeon/POSLinkMultiCommand.java',
    // objcHeaderOut: 'ios/Runner/Pigeon/POSLinkGetReportStatus.h',
    // objcSourceOut: 'ios/Runner/Pigeon/POSLinkGetReportStatus.m',
    //experimental_cppHeaderOut: 'windows/runner/pigeon/POSLinkGetReportStatus.h',
    //experimental_cppSourceOut: 'windows/runner/pigeon/POSLinkGetReportStatus.cpp',
    //experimental_cppOptions: CppOptions(header: '', namespace: 'POSLinkGetReportStatus'),
  ),
)
@HostApi()
abstract class POSLinkGetReportStatusApi {
  @async
  int getReportStatus();
}
