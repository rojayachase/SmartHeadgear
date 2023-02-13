import 'package:anapact/_dummy_screens_need_to_remove/AllWifiScreen/AllWifi_screen.dart';
import 'package:anapact/_dummy_screens_need_to_remove/AllWifiScreen/wifiPassword_screen.dart';
import 'package:anapact/_dummy_screens_need_to_remove/SavedBluetooth/Saved_Bluetooth_screen.dart';
import 'package:flutter/material.dart';

// Screens
import '../views/screens/splash/splash.dart';
import '../_dummy_screens_need_to_remove/Homescreen/Homescreen_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case Homescreen.id:
        return MaterialPageRoute(builder: (context) => Homescreen());

      case SavedBluetoothScreen.id:
        return MaterialPageRoute(builder: (context) => SavedBluetoothScreen());

      // case AllBluetoothscreen.id:
      //   return MaterialPageRoute(builder: (context) => AllBluetoothscreen());

      case AllWifiScreen.id:
        return MaterialPageRoute(
            builder: (context) =>
                AllWifiScreen(value: routeSettings.arguments as String));

      case WifiPasswordScreen.id:
        return MaterialPageRoute(builder: (context) => WifiPasswordScreen());

      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
