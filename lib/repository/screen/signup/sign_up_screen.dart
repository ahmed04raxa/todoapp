import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/repository/screen/login/login_screen.dart';
import 'package:todo_app/repository/widgets/ui_helper.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpScreen({super.key});

  Future<void> signUp(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      return print(ex.code.toString());
    }
  }

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
                  "Sign up",
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
                  "Let’s get you all st up so\n you can access your personal account.",
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Already Have Account?",
                    style: TextStyle(color: Color(0XFF313131)),
                  ),
                  UiHelper.customTextButton(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF515DEF),
                    text: "Login",
                    callback: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        text: "Sign Up",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        callback: () {
          print(
            signUp(
              emailController.text.toString(),
              passwordController.text.toString(),
            ),
          );
        },
      ),
    );
  }
}
