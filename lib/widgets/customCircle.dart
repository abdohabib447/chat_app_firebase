
import 'package:chat_app/Models/constant_data.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: width(context),
      child: Stack(alignment: Alignment.topRight, children: [
        Positioned(
          right: 30,
          top: -30,
          child: Container(
            height: 60,
            width: 70,
            decoration: const BoxDecoration(
                color: Color(0xff1F1F1F), shape: BoxShape.circle),
          ),
        ),
      ]),
    );
  }
}
