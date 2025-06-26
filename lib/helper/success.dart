import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

void success(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        'SUCCESS ✅',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.lightGreen,
          fontSize: 20,
        ),
      ),
    ),
  );
}
