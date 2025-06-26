// ignore_for_file: file_names

import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
