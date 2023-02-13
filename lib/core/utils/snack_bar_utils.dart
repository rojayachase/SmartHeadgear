import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/core/constant/constants.dart';
import 'package:anapact/core/utils/enums.dart';
import 'package:flutter/material.dart';

const double _kElevation = 0;

const Duration _kDuration2000ms = Duration(milliseconds: 2000);

const SnackBarBehavior _kSnackBarBehavior = SnackBarBehavior.floating;

class SnackBarUtils {
  SnackBarUtils._();

  static void showSnackBar(String message) {
    NavigatorState? state = kNavigatorKey.currentState;
    if (state != null) {
      OverlayState? overlay = state.overlay;
      if (overlay != null) {
        ScaffoldMessenger.of(overlay.context).showSnackBar(
          snackBar(message: message, type: SnackBarType.failure),
        );
      }
    }
  }

  static SnackBar snackBar({
    required String message,
    SnackBarType type = SnackBarType.none,
    Duration duration = _kDuration2000ms,
  }) {
    Color color = Colors.black;
    // IconData icon = Icons.notifications;

    switch (type) {
      case SnackBarType.none:
        color = Colors.black;
        // icon = Icons.info_outline_rounded;
        break;
      case SnackBarType.success:
        color = Colors.green;
        // icon = Icons.check_circle_outline_outlined;
        break;
      case SnackBarType.failure:
        color = Colors.red;
        // icon = Icons.cancel_outlined;
        break;
      default:
    }

    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: Sizes.s14.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: color,
      behavior: _kSnackBarBehavior,
      duration: duration,
      elevation: _kElevation,
    );
  }
}
