import 'package:flutter/material.dart';
import 'package:quiznos/shared/constants.dart';
import 'package:quiznos/screens/quiz_screen.dart';

class SelectTopicScreen extends StatefulWidget {
  const SelectTopicScreen({Key? key}) : super(key: key);
  @override
  State<SelectTopicScreen> createState() => _SelectTopicScreenState();
}

class _SelectTopicScreenState extends State<SelectTopicScreen> {
  static String? selectedTopic;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00192E),
      child: Container(
        height: 100.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 19, 58, 80),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: selectedTopic,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTopic = newValue;
                });
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizScreen(
                              qTopic: selectedTopic == 'General Knowledge'
                                  ? QuizTopic.gk
                                  : QuizTopic.cn,
                            )),
                    ModalRoute.withName('/'));
              },
              items: kTopicsList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
