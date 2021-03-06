/// Call platform code to get/set statusbar or navigationbar background color.

import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

class FlutterStatusbarcolor {
  static const MethodChannel _channel =
      const MethodChannel('plugins.fuyumi.com/statusbar');

  /// Get the statusbar background color.
  static Future<Color> getStatusBarColor() =>
      _channel.invokeMethod('getstatusbarcolor').then((dynamic value) {
        return value == null ? null : Color(value);
      });
  /// Set the statusbar background color.
  static Future setStatusBarColor(Color color) =>
      _channel.invokeMethod('setstatusbarcolor', {'color': color.value});
  /// Set the statusbar white foreground color.
  static Future setStatusBarWhiteForeground(bool useWhiteForeground) =>
      _channel.invokeMethod('setstatusbarwhiteforeground',
          {'whiteForeground': useWhiteForeground});

  /// Get the navigationbar background color.
  static Future<Color> getNavigationBarColor() =>
      _channel.invokeMethod('getnavigationbarcolor').then((dynamic value) {
        return value == null ? null : Color(value);
      });
  /// Set the navigationbar background color.
  static Future setNavigationBarColor(Color color) =>
      _channel.invokeMethod('setnavigationbarcolor', {'color': color.value});
  /// Set the navigationbar white foreground color.
  static Future setNavigationBarWhiteForeground(bool useWhiteForeground) =>
      _channel.invokeMethod('setnavigationbarwhiteforeground',
          {'whiteForeground': useWhiteForeground});
}

/// Help you choosing the black or white foreground color
/// to improve the foreground visible.
bool useWhiteForeground(Color backgroundColor) {
  return 1.05 / (backgroundColor.computeLuminance() + 0.05) > 4.5;
}
