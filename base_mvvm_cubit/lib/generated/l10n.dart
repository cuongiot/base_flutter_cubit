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

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `welcome`
  String get welcome {
    return Intl.message(
      'welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `bad_request_error`
  String get strBadRequestError {
    return Intl.message(
      'bad_request_error',
      name: 'strBadRequestError',
      desc: '',
      args: [],
    );
  }

  /// `no_content`
  String get strNoContent {
    return Intl.message(
      'no_content',
      name: 'strNoContent',
      desc: '',
      args: [],
    );
  }

  /// `forbidden_error`
  String get strForbiddenError {
    return Intl.message(
      'forbidden_error',
      name: 'strForbiddenError',
      desc: '',
      args: [],
    );
  }

  /// `unauthorized_error`
  String get strUnauthorizedError {
    return Intl.message(
      'unauthorized_error',
      name: 'strUnauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `not_found_error`
  String get strNotFoundError {
    return Intl.message(
      'not_found_error',
      name: 'strNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `conflict_error`
  String get strConflictError {
    return Intl.message(
      'conflict_error',
      name: 'strConflictError',
      desc: '',
      args: [],
    );
  }

  /// `internal_server_error`
  String get strInternalServerError {
    return Intl.message(
      'internal_server_error',
      name: 'strInternalServerError',
      desc: '',
      args: [],
    );
  }

  /// `unknown_error`
  String get strUnknownError {
    return Intl.message(
      'unknown_error',
      name: 'strUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `timeout_error`
  String get strTimeoutError {
    return Intl.message(
      'timeout_error',
      name: 'strTimeoutError',
      desc: '',
      args: [],
    );
  }

  /// `default_error`
  String get strDefaultError {
    return Intl.message(
      'default_error',
      name: 'strDefaultError',
      desc: '',
      args: [],
    );
  }

  /// `cache_error`
  String get strCacheError {
    return Intl.message(
      'cache_error',
      name: 'strCacheError',
      desc: '',
      args: [],
    );
  }

  /// `no_internet_error`
  String get strNoInternetError {
    return Intl.message(
      'no_internet_error',
      name: 'strNoInternetError',
      desc: '',
      args: [],
    );
  }

  /// `success`
  String get success {
    return Intl.message(
      'success',
      name: 'success',
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
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'vi'),
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
