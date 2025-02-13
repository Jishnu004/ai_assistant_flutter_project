import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';

import '../helper/gobal.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 4,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              foregroundColor: Colors.white,
              minimumSize: Size(mq.width * .4, 50),
              backgroundColor: Theme.of(context).bottonColor),
          onPressed: onTap,
          child: Text(text)),
    );
  }
}
