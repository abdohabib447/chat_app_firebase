import 'package:chat_app/Models/constant_data.dart';
import 'package:chat_app/Models/message.dart';
import 'package:flutter/material.dart';

class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({
    super.key,
    required this.color,
    required this.message,
  });
  final Color color;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 25),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
            color: color),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
