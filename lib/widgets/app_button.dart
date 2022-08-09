import 'package:flutter/material.dart';
import 'package:quiznos/screens/select_topic_screen.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    String this.text = 'text here',
    this.onPressed,
    this.buttonStyle,
  }) : super(key: key);

  final text;
  final onPressed;
  final buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
    );
  }
}
