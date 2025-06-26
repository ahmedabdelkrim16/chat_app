import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextFiled extends StatelessWidget {
  CustomFormTextFiled({super.key, this.hintText, this.onChanged,this.obscureText});
  String? hintText;
  bool ?obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText??false,
      validator: (data) {
        if (data!.isEmpty) {
          return 'filed is required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
