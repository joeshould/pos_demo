import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poslink2/log/dart_log.dart';
import 'package:poslink2/model/batch_view_model.dart';
import 'package:poslink2/model/comm_setting_view_model.dart';
import 'package:poslink2/model/device_view_model.dart';
import 'package:poslink2/model/form_view_model.dart';
import 'package:poslink2/model/log_setting_view_model.dart';
import 'package:poslink2/model/admin_view_model.dart';
import 'package:poslink2/model/report_status_view_model.dart';
import 'package:poslink2/model/report_view_model.dart';
import 'package:poslink2/model/request_db.dart';
import 'package:poslink2/model/response_db.dart';
import 'package:poslink2/model/test_view_model.dart';
import 'package:poslink2/ui/main_page.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'model/transaction_view_model.dart';

void main() {
  Log.customize("POSLink2",
      level: kDebugMode ? LogLevel.ON : LogLevel.OFF,
      showTrace: Platform.isIOS ? false : true);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RequestDataBase()),
      ChangeNotifierProvider(create: (context) => ResponseDataBase()),
      ChangeNotifierProvider(create: (context) => TestViewModel()),
      ChangeNotifierProvider(create: (context) => CommSettingViewModel()),
      ChangeNotifierProvider(create: (context) => LogSettingViewModel()),
      ChangeNotifierProvider(create: (context) => TransactionViewModel()),
      ChangeNotifierProvider(create: (context) => AdminViewModel()),
      ChangeNotifierProvider(create: (context) => BatchViewModel()),
      ChangeNotifierProvider(create: (context) => DeviceViewModel()),
      ChangeNotifierProvider(create: (context) => ReportViewModel()),
      ChangeNotifierProvider(create: (context) => FormViewModel()),
      ChangeNotifierProvider(create: (context) => ReportStatusViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        // app-specific localization delegate[s] here
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: MainPage(),
    );
  }
}
