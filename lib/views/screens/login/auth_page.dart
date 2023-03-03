//import 'package:anapact/views/screens/bluetooth/bluetooth_screen.dart';
import 'package:anapact/views/screens/login/home_page.dart';
import 'package:anapact/views/screens/login/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              //return BluetoothScreen();
              return HomePage();
            }

            //user is NOT logged in
            else {
              return LogIn();
            }
          }),
    );
  }
}
