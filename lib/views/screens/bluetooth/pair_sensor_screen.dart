import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PairSensorScreeen extends StatefulWidget {
  const PairSensorScreeen({Key? key}) : super(key: key);

  @override
  State<PairSensorScreeen> createState() => _PairSensorScreeenState();
}

class _PairSensorScreeenState extends State<PairSensorScreeen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() {
    Future.delayed(const Duration(seconds: 5), () {
      // Navigator.pushReplacementNamed(context, Routes.bluetoothScreen);
      Navigator.pushReplacementNamed(context, Routes.foundSensorScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primaryColor,
        title: Text('Pair Sensor'),
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        height: deviceHeight,
        width: devicewidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 54,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Let\'s connect your\nsensor first 📲',
                  style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: devicewidth / 1.5,
                height: 1,
                color: Colors.grey.shade300,
              ),
              // SizedBox(height: 54,),
              Spacer(),
              Container(
                width: double.infinity,
                child: Text(
                  '"Tap or shake the sensor repeatedly until it syncs"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintColor,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Lottie.asset(
                  'assets/json/right_check.json',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
