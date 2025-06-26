import 'package:chat_app/constant.dart';
import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

class CahtBubble extends StatelessWidget {
  const CahtBubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CahtBubbleForFriend extends StatelessWidget {
  const CahtBubbleForFriend({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xff006D84),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
