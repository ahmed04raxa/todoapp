import 'package:flutter/material.dart';
import 'package:todo_app/repository/screen/signup/sign_up_screen.dart';
import '../../widgets/ui_helper.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF313131),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Login to access your account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customTextField(
                  controller: emailController,
                  mWidth: 372,
                  hintText: "Enter Your Email",
                  obscureText: false,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customTextField(
                  controller: passwordController,
                  mWidth: 372,
                  hintText: "Enter Your Password",
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Don't Have An Account?",
                  style: TextStyle(color: Color(0XFF313131)),
                ),
                UiHelper.customTextButton(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  text: "Sign Up",
                  color: Color(0XFF515DEF),
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        text: "Login",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        callback: () {},
      ),
    );
  }
}
