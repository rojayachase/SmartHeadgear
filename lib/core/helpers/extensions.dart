import 'dart:math';

import 'package:anapact/core/utils/enums.dart';
import 'package:anapact/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';

extension Precision on double {
  double toPrecision(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}

extension BuildContextExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  void showSuccessSnackBar(String message, {int millisecond = 2000}) {
    SnackBar snackBar = SnackBarUtils.snackBar(
      message: message,
      type: SnackBarType.success,
      duration: Duration(milliseconds: millisecond),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showFailureSnackBar(String message, {int millisecond = 2000}) {
    SnackBar snackBar = SnackBarUtils.snackBar(
      message: message,
      type: SnackBarType.failure,
      duration: Duration(milliseconds: millisecond),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
