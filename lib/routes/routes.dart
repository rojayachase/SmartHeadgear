import 'package:anapact/views/screens/bluetooth/bluetooth_screen.dart';
import 'package:anapact/views/screens/bluetooth/both_user_screen.dart';
import 'package:anapact/views/screens/bluetooth/found_sensor_screen.dart';
import 'package:anapact/views/screens/bluetooth/pair_sensor_screen.dart';
//my import
import 'package:anapact/views/screens/Login/log_in.dart';
import 'package:anapact/views/screens/punch_data/punch_data.dart';
import 'package:anapact/views/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splash';
  static const String bluetoothScreen = '/bluetooth_screen';
  static const String punchDataScreen = '/punchDataScreen';
  static const String bothUserScreen = '/bothUserScreen';
  static const String foundSensorScreen = '/foundSensorScreen';
  static const String pairSensorScreen = '/pairSensorScreen';
  //testing screen navigator
  static const String logIn = '/login';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // var args = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.bluetoothScreen:
        return MaterialPageRoute(builder: (_) => BluetoothScreen());
      case Routes.punchDataScreen:
        return MaterialPageRoute(builder: (_) => PunchData());
      case Routes.bothUserScreen:
        return MaterialPageRoute(builder: (_) => BothUserScreen());
      case Routes.foundSensorScreen:
        return MaterialPageRoute(builder: (_) => FoundSensorScreen());
      case Routes.pairSensorScreen:
        return MaterialPageRoute(builder: (_) => PairSensorScreeen());
      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => LogIn());
      default:
        return null;
    }
  }
}
