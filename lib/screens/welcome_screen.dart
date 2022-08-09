import 'package:flutter/material.dart';
import 'package:quiznos/screens/select_topic_screen.dart';
import 'package:quiznos/widgets/app_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/quiz_icon.png',
                height: 150.0,
                width: 150.0,
              ),
            ),
            AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: <TypewriterAnimatedText>[
                TypewriterAnimatedText(
                  'Welcome to Quiznos',
                  textStyle: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: AppButton(
                text: 'Start Quiz',
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) => SelectTopicScreen(),
                  );
                },
                buttonStyle: ElevatedButton.styleFrom(
                  primary: Color(0xffEB4747),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
