// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Comm Setting`
  String get commSetting {
    return Intl.message(
      'Comm Setting',
      name: 'commSetting',
      desc: '',
      args: [],
    );
  }

  /// `AIDL`
  String get aidl {
    return Intl.message(
      'AIDL',
      name: 'aidl',
      desc: '',
      args: [],
    );
  }

  /// `TCP`
  String get tcp {
    return Intl.message(
      'TCP',
      name: 'tcp',
      desc: '',
      args: [],
    );
  }

  /// `Timeout`
  String get timeout {
    return Intl.message(
      'Timeout',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `IP`
  String get ip {
    return Intl.message(
      'IP',
      name: 'ip',
      desc: '',
      args: [],
    );
  }

  /// `Port`
  String get port {
    return Intl.message(
      'Port',
      name: 'port',
      desc: '',
      args: [],
    );
  }

  /// `Comm Type`
  String get commType {
    return Intl.message(
      'Comm Type',
      name: 'commType',
      desc: '',
      args: [],
    );
  }

  /// `ALL`
  String get all {
    return Intl.message(
      'ALL',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `CREDIT`
  String get credit {
    return Intl.message(
      'CREDIT',
      name: 'credit',
      desc: '',
      args: [],
    );
  }

  /// `DEBIT`
  String get debit {
    return Intl.message(
      'DEBIT',
      name: 'debit',
      desc: '',
      args: [],
    );
  }

  /// `EBT`
  String get ebt {
    return Intl.message(
      'EBT',
      name: 'ebt',
      desc: '',
      args: [],
    );
  }

  /// `GIFT`
  String get gift {
    return Intl.message(
      'GIFT',
      name: 'gift',
      desc: '',
      args: [],
    );
  }

  /// `LOYALTY`
  String get loyalty {
    return Intl.message(
      'LOYALTY',
      name: 'loyalty',
      desc: '',
      args: [],
    );
  }

  /// `CASH`
  String get cash {
    return Intl.message(
      'CASH',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `CHECK`
  String get check {
    return Intl.message(
      'CHECK',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `OTHER`
  String get other {
    return Intl.message(
      'OTHER',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `UNKNOWN`
  String get unknown {
    return Intl.message(
      'UNKNOWN',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `SALE`
  String get sale {
    return Intl.message(
      'SALE',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `RETURN`
  String get sReturn {
    return Intl.message(
      'RETURN',
      name: 'sReturn',
      desc: '',
      args: [],
    );
  }

  /// `AUTH`
  String get auth {
    return Intl.message(
      'AUTH',
      name: 'auth',
      desc: '',
      args: [],
    );
  }

  /// `POSTAUTH`
  String get postauth {
    return Intl.message(
      'POSTAUTH',
      name: 'postauth',
      desc: '',
      args: [],
    );
  }

  /// `FORCEAUTH`
  String get forceauth {
    return Intl.message(
      'FORCEAUTH',
      name: 'forceauth',
      desc: '',
      args: [],
    );
  }

  /// `ADJUST`
  String get adjust {
    return Intl.message(
      'ADJUST',
      name: 'adjust',
      desc: '',
      args: [],
    );
  }

  /// `WITHDRAWAL`
  String get withdrawal {
    return Intl.message(
      'WITHDRAWAL',
      name: 'withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `ACTIVATE`
  String get activate {
    return Intl.message(
      'ACTIVATE',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `ISSUE`
  String get issue {
    return Intl.message(
      'ISSUE',
      name: 'issue',
      desc: '',
      args: [],
    );
  }

  /// `RELOAD`
  String get reload {
    return Intl.message(
      'RELOAD',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `CASHOUT`
  String get cashout {
    return Intl.message(
      'CASHOUT',
      name: 'cashout',
      desc: '',
      args: [],
    );
  }

  /// `DEACTIVATE`
  String get deactivate {
    return Intl.message(
      'DEACTIVATE',
      name: 'deactivate',
      desc: '',
      args: [],
    );
  }

  /// `REPLACE`
  String get replace {
    return Intl.message(
      'REPLACE',
      name: 'replace',
      desc: '',
      args: [],
    );
  }

  /// `MERGE`
  String get merge {
    return Intl.message(
      'MERGE',
      name: 'merge',
      desc: '',
      args: [],
    );
  }

  /// `REPORTLOST`
  String get reportlost {
    return Intl.message(
      'REPORTLOST',
      name: 'reportlost',
      desc: '',
      args: [],
    );
  }

  /// `VOID`
  String get sVoid {
    return Intl.message(
      'VOID',
      name: 'sVoid',
      desc: '',
      args: [],
    );
  }

  /// `VOID_SALE`
  String get voidsale {
    return Intl.message(
      'VOID_SALE',
      name: 'voidsale',
      desc: '',
      args: [],
    );
  }

  /// `VOID_RETURN`
  String get voidreturn {
    return Intl.message(
      'VOID_RETURN',
      name: 'voidreturn',
      desc: '',
      args: [],
    );
  }

  /// `VOID_AUTH`
  String get voidauth {
    return Intl.message(
      'VOID_AUTH',
      name: 'voidauth',
      desc: '',
      args: [],
    );
  }

  /// `VOID_POSTAUTH`
  String get voidpostauth {
    return Intl.message(
      'VOID_POSTAUTH',
      name: 'voidpostauth',
      desc: '',
      args: [],
    );
  }

  /// `VOID_FORCEAUTH`
  String get voidforceauth {
    return Intl.message(
      'VOID_FORCEAUTH',
      name: 'voidforceauth',
      desc: '',
      args: [],
    );
  }

  /// `VOID_WITHDRAWAL`
  String get voidwithdrawal {
    return Intl.message(
      'VOID_WITHDRAWAL',
      name: 'voidwithdrawal',
      desc: '',
      args: [],
    );
  }

  /// `INQUIRY`
  String get inquiry {
    return Intl.message(
      'INQUIRY',
      name: 'inquiry',
      desc: '',
      args: [],
    );
  }

  /// `VERIFY`
  String get verify {
    return Intl.message(
      'VERIFY',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `REACTIVATE`
  String get reactivate {
    return Intl.message(
      'REACTIVATE',
      name: 'reactivate',
      desc: '',
      args: [],
    );
  }

  /// `FORCED_ISSUE`
  String get forcedissue {
    return Intl.message(
      'FORCED_ISSUE',
      name: 'forcedissue',
      desc: '',
      args: [],
    );
  }

  /// `FORCED_ADD`
  String get forcedadd {
    return Intl.message(
      'FORCED_ADD',
      name: 'forcedadd',
      desc: '',
      args: [],
    );
  }

  /// `UNLOAD`
  String get unload {
    return Intl.message(
      'UNLOAD',
      name: 'unload',
      desc: '',
      args: [],
    );
  }

  /// `RENEW`
  String get renew {
    return Intl.message(
      'RENEW',
      name: 'renew',
      desc: '',
      args: [],
    );
  }

  /// `GETCONVERTDETAIL`
  String get getconvertdetail {
    return Intl.message(
      'GETCONVERTDETAIL',
      name: 'getconvertdetail',
      desc: '',
      args: [],
    );
  }

  /// `CONVERT`
  String get convert {
    return Intl.message(
      'CONVERT',
      name: 'convert',
      desc: '',
      args: [],
    );
  }

  /// `TOKENIZE`
  String get tokenize {
    return Intl.message(
      'TOKENIZE',
      name: 'tokenize',
      desc: '',
      args: [],
    );
  }

  /// `INCREMENTALAUTH`
  String get incrementalauth {
    return Intl.message(
      'INCREMENTALAUTH',
      name: 'incrementalauth',
      desc: '',
      args: [],
    );
  }

  /// `BALANCEWITHLOCK`
  String get balancewithlock {
    return Intl.message(
      'BALANCEWITHLOCK',
      name: 'balancewithlock',
      desc: '',
      args: [],
    );
  }

  /// `REDEMPTIONWITHUNLOCK`
  String get redemptionwithunlock {
    return Intl.message(
      'REDEMPTIONWITHUNLOCK',
      name: 'redemptionwithunlock',
      desc: '',
      args: [],
    );
  }

  /// `REWARDS`
  String get rewards {
    return Intl.message(
      'REWARDS',
      name: 'rewards',
      desc: '',
      args: [],
    );
  }

  /// `REENTER`
  String get reenter {
    return Intl.message(
      'REENTER',
      name: 'reenter',
      desc: '',
      args: [],
    );
  }

  /// `TRANSACTIONADJUSTMENT`
  String get transactionadjustment {
    return Intl.message(
      'TRANSACTIONADJUSTMENT',
      name: 'transactionadjustment',
      desc: '',
      args: [],
    );
  }

  /// `TRANSFER`
  String get transfer {
    return Intl.message(
      'TRANSFER',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `REVERSAL`
  String get reversal {
    return Intl.message(
      'REVERSAL',
      name: 'reversal',
      desc: '',
      args: [],
    );
  }

  /// `EDC Type`
  String get edcType {
    return Intl.message(
      'EDC Type',
      name: 'edcType',
      desc: '',
      args: [],
    );
  }

  /// `Trans Type`
  String get transType {
    return Intl.message(
      'Trans Type',
      name: 'transType',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Fail`
  String get fail {
    return Intl.message(
      'Fail',
      name: 'fail',
      desc: '',
      args: [],
    );
  }

  /// `Cancel success!`
  String get cancelSuccess {
    return Intl.message(
      'Cancel success!',
      name: 'cancelSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Channel`
  String get channel {
    return Intl.message(
      'Channel',
      name: 'channel',
      desc: '',
      args: [],
    );
  }

  /// `Serial Port`
  String get serialPort {
    return Intl.message(
      'Serial Port',
      name: 'serialPort',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
