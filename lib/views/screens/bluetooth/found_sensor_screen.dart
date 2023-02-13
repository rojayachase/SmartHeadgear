// found your sensor screen

import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../routes/routes.dart';

class FoundSensorScreen extends StatefulWidget {
  const FoundSensorScreen({Key? key}) : super(key: key);

  @override
  State<FoundSensorScreen> createState() => _FoundSensorScreenState();
}

class _FoundSensorScreenState extends State<FoundSensorScreen> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primaryColor, 
        title: Text('Sensor Found'),
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 54,),
            Center(
              child: Text(
                'Your sensor has been found..!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintColor
                ),
              ),
            ),
            // SizedBox(height: 54,),
            Spacer(),
            Center(
              child: Text(
                'Enter Your Name',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: .4
                ),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              height: 45,
              width: devicewidth/1.5,
              child: Center(
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                  )
                ),
              ),
            ),
            SizedBox(height: 32,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.bothUserScreen);
              }, 
              child: Text(
                'Pair Your Partner',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.backgroundColor,
                  letterSpacing: .4
                ),
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}