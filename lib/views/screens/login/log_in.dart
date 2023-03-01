import 'package:anapact/components/my_textfield.dart';
import 'package:anapact/components/sign_in_button.dart';
import 'package:anapact/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:anapact/core/constant/app_colors.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

//text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

//sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
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

            //username textfield
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
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
        )));
  }
}
