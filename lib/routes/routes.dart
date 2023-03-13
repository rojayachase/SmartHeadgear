import 'package:anapact/views/screens/bluetooth/bluetooth_screen.dart';
import 'package:anapact/views/screens/bluetooth/both_user_screen.dart';
import 'package:anapact/views/screens/bluetooth/found_sensor_screen.dart';
import 'package:anapact/views/screens/bluetooth/pair_sensor_screen.dart';
//my import
import 'package:anapact/views/screens/punch_data/punch_data.dart';
import 'package:anapact/views/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:anapact/views/screens/login/auth_page.dart';
import 'package:anapact/views/screens/bluetooth/fake_page.dart';
import 'package:anapact/views/screens/login/Login_Page.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splash';
  static const String bluetoothScreen = '/bluetooth_screen';
  static const String punchDataScreen = '/punchDataScreen';
  static const String bothUserScreen = '/bothUserScreen';
  static const String foundSensorScreen = '/foundSensorScreen';
  static const String pairSensorScreen = '/pairSensorScreen';
  //testing screen navigator
  static const String loginpage = '/loginPage';
  static const String authpage = '/authPage';
  static const String fakepage = '/fakePage';
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
      case Routes.loginpage:
        return MaterialPageRoute(builder: (_) => LoginPage(onTap: () {  },));
      case Routes.authpage:
        return MaterialPageRoute(builder: (_) => AuthPage());
      case Routes.fakepage:
        return MaterialPageRoute(builder: (_) => FakePage());
      default:
        return null;
    }
  }
}
