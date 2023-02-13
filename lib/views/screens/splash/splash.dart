import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.bluetoothScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          'Anapact',
          style: TextStyle(
            fontSize: Sizes.s40.sp,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}
