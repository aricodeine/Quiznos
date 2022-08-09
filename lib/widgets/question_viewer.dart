import 'package:flutter/material.dart';
import 'package:quiznos/shared/constants.dart';

class QuestionViewer extends StatelessWidget {
  const QuestionViewer({
    Key? key,
    required this.question,
  }) : super(key: key);

  final question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Material(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3.0,
            color: Color(0xffEB1D36),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xff123865),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            question,
            style: kQuestionTextStyle,
          ),
        ),
      ),
    );
  }
}
