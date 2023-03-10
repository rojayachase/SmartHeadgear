//import 'dart:js';

import 'package:anapact/components/my_textfield.dart';
import 'package:anapact/components/sign_in_button.dart';
import 'package:anapact/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anapact/core/constant/app_colors.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
//text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      //WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      //WRONG PASSWORD
      else if (e.code == 'wrong password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // error message to user
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 50),

            //logo
            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),

            //welcome back, you've been missed!
            Text(
              'Welcome back you\'ve been missed!',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            //email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.hintColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            //sign in button
            SignInButton(
              onTap: signUserIn,
            ),

            const SizedBox(height: 50),

            //or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.hintColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: AppColors.hintColor),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.hintColor,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 50),

            //google + apple sign in button

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                //google button
                SquareTile(imagePath: 'assets/images/google.png'),

                const SizedBox(width: 10),

                //apple button
                SquareTile(imagePath: 'assets/images/apple.png'),
              ],
            ),

            const SizedBox(height: 50),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ]),
        ))));
  }
}
