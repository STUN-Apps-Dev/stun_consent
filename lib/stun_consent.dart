// ignore_for_file: use_build_context_synchronously, avoid_print

library stun_consent;

import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stun_consent/consent_config.dart';
import 'package:stun_consent/consent_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'consent_dialog.dart';

class StunConsent {
  static const _kHasConsentKey = 'has_consent';
  static const _kDialogWasShownKey = 'dialog_was_shown';

  static bool _isDebug = false;

  static void enableDebug(bool enable) {
    _isDebug = enable;
  }

  static Future<bool> showConsent(
    BuildContext context,
    ConsentConfig config,
  ) async {
    try {
      final wasShown = _isDebug ? false : await dialogWasShown;

      if (wasShown) {
        _debugLog('Consent was shown already');
        final hasConsent = await hasUserConsent;
        return hasConsent;
      }

      final data = await _readData(config.contentPath);

      _debugLog('Dialog opened');

      final result = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (context) => ConsentDialog(
            config: config,
            data: data,
          ),
          fullscreenDialog: true,
        ),
      );

      _debugLog('Dialog closed');

      await _setProperty(_kDialogWasShownKey, true);

      final hasConsent = result ?? false;
      await _setProperty(_kHasConsentKey, hasConsent);

      return hasConsent;
    } catch (e) {
      _debugLog(e);
      final hasConsent = await hasUserConsent;
      return hasConsent;
    }
  }

  static Future<ConsentData> _readData(String path) async {
    final String source = await rootBundle.loadString(path);
    return ConsentData.fromJson(source);
  }

  static Future<bool> get hasUserConsent async {
    final value = await _getProperty(_kHasConsentKey);
    return value;
  }

  static Future<bool> get dialogWasShown async {
    final value = await _getProperty(_kDialogWasShownKey);
    return value;
  }

  static Future<bool> _getProperty(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool(key) ?? false;
  }

  static Future<void> _setProperty(String key, bool value) async {
    final instance = await SharedPreferences.getInstance();
    _debugLog('Set propery: $key: $value');

    await instance.setBool(key, value);
  }

  static void _debugLog(Object message) {
    if (_isDebug) print("stun_consent: $message");
  }
}
