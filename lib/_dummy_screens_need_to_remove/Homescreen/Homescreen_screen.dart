import 'package:anapact/_dummy_data_need_to_remove_global/res/res.dart';
import 'package:anapact/_dummy_screens_need_to_remove/SavedBluetooth/Saved_Bluetooth_screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  static const String id = '/homescreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
        backgroundColor: colors.primaryColor,
        elevation: 1,
      ),
      backgroundColor: colors.primaryColor,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      assets.appLogoPng,
                    ),
                    Image.asset(
                      assets.splashLogoPng,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(SavedBluetoothScreen.id);
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0, -1),
                            end: Alignment(0, .2),
                            colors: [
                              colors.secondaryColor,
                              Color(0xff587C34),
                            ],
                          ),
                          // color: colors.secondaryColor,
                        ),
                        child: Center(
                          child: Text(
                            'Connect',
                            style: TextStyle(
                              color: colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
