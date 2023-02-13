import 'package:anapact/_dummy_data_need_to_remove_global/res/res.dart';
import 'package:flutter/material.dart';

class WifiPasswordScreen extends StatelessWidget {
  static const String id = '/wifiscreenPassword';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Password'),
        backgroundColor: colors.primaryColor,
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: colors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                    decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colors.savedBluetoothButton, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colors.savedBluetoothButton, width: 1.0),
                  ),
                  hintText: 'Password',
                )),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(bottom: 40),
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colors.savedBluetoothButton,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Connect',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
