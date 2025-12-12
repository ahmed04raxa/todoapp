import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/repository/screen/home/home_screen.dart';
import 'package:todo_app/repository/widgets/ui_helper.dart';

class AddData extends StatefulWidget {
  AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  void addData(String firstName, String lastName, String email) async {
    FirebaseFirestore.instance.collection("Users").doc().set({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
    });
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextField(
              controller: firstNameController,
              hintText: "Enter Your First Name",
              mWidth: 372,
            ),
            SizedBox(height: 20),
            UiHelper.customTextField(
              controller: lastNameController,
              hintText: "Enter Your Last Name",
              mWidth: 372,
            ),
            SizedBox(height: 20),
            UiHelper.customTextField(
              controller: emailController,
              hintText: "Enter Your Email",
              mWidth: 372,
            ),
            SizedBox(height: 20),
            UiHelper.customButton(
              text: "Add Data",
              callback: () {
                addData(
                  firstNameController.text.toString(),
                  lastNameController.text.toString(),
                  emailController.text.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
