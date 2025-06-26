import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
    ),
  );
}
