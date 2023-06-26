import 'package:flutter/material.dart';

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
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
    );
  }
}
