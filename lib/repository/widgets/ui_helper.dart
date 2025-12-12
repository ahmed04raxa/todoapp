import 'package:flutter/material.dart';

class UiHelper {
  static customTextField({
    required TextEditingController controller,
    double mWidth = 300,
    double mHeight = 52,
    required String hintText,
    bool obscureText = true, // True Means Hidden Ho Ga
  }) {
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Color(0XFF313131)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: Color(0XFF313131), width: 2),
          ),
        ),
      ),
    );
  }

  static customButton({
    required String text,
    required VoidCallback callback,
    double mWidth = 372,
    double mHeight = 52,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Color(0XFF515DEF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static customTextButton({
    required String text,
    required VoidCallback callback,
    required double fontSize,
    FontWeight? fontWeight,
    Color color = Colors.black,
  }) {
    return TextButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
