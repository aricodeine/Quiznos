import 'package:flutter/material.dart';
import 'package:quiznos/shared/questionData.dart';
import 'package:quiznos/widgets/question_viewer.dart';
import 'package:quiznos/shared/question.dart';
import 'package:quiznos/shared/constants.dart' show QuizTopic;
import 'package:quiznos/widgets/radio_option.dart';
import 'select_topic_screen.dart';
import 'package:quiznos/widgets/custom_alert_dialog.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.qTopic}) : super(key: key);

  final QuizTopic qTopic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedOption;
  late int qLength;
  List<Question> questions = [];
  int questionNumber = 0;
  late String selectedTopic;
  int countCorrect = 0, countIncorrect = 0;
  bool isFinished = false;

  void checkCorrectOrNot(String? selected) {
    questions[questionNumber].questionAnswer == selected
        ? countCorrect += 1
        : countIncorrect += 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTopic = widget.qTopic == QuizTopic.gk
        ? 'General Knowledge'
        : 'Computer Netowrk';
    QuestionData questionData = QuestionData(quizTopic: widget.qTopic);
    qLength = questionData.qListLength;
    questions = questionData.getTopicQuestionsList();
    questions.shuffle();
    for (var question in questions) {
      question.options.shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/quiz_icon.png',
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                  Text(
                    selectedTopic,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  QuestionViewer(
                    question: questions[questionNumber].questionText,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                      child: Column(
                        children: <Widget>[
                          RadioOption(
                            questions: questions,
                            questionNumber: questionNumber,
                            selectedOption: selectedOption,
                            optionNumber: 0,
                            onOptionChanged: (String? selected) {
                              setState(() {
                                selectedOption = selected;
                              });
                            },
                            isRightOrWrong:
                                questions[questionNumber].questionAnswer ==
                                    questions[questionNumber].options[0],
                          ),
                          RadioOption(
                            questions: questions,
                            questionNumber: questionNumber,
                            selectedOption: selectedOption,
                            optionNumber: 1,
                            onOptionChanged: (String? selected) {
                              setState(() {
                                selectedOption = selected;
                              });
                            },
                            isRightOrWrong:
                                questions[questionNumber].questionAnswer ==
                                    questions[questionNumber].options[1],
                          ),
                          RadioOption(
                            questions: questions,
                            questionNumber: questionNumber,
                            selectedOption: selectedOption,
                            optionNumber: 2,
                            onOptionChanged: (String? selected) {
                              setState(() {
                                selectedOption = selected;
                              });
                            },
                            isRightOrWrong:
                                questions[questionNumber].questionAnswer ==
                                    questions[questionNumber].options[2],
                          ),
                          RadioOption(
                            questions: questions,
                            questionNumber: questionNumber,
                            selectedOption: selectedOption,
                            optionNumber: 3,
                            onOptionChanged: (String? selected) {
                              setState(() {
                                selectedOption = selected;
                              });
                            },
                            isRightOrWrong:
                                questions[questionNumber].questionAnswer ==
                                    questions[questionNumber].options[3],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedOption != null) {
                    setState(() {
                      RadioOption.isSubmitted = true;
                    });
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => CustomAlertDialog(
                              title:
                                  'Have you selected an option before checking answer?',
                              content: 'Select an option first.',
                              actionsList: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Okay'),
                                    child: Text('Okay')),
                              ],
                            ));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text('Check answer'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffEB4747),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  RadioOption.isSubmitted = false;

                  if (selectedOption == null) {
                    showDialog(
                        context: context,
                        builder: (_) => CustomAlertDialog(
                              title:
                                  'Have you selected an option before submitting?',
                              content: 'Select an option first.',
                              actionsList: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Okay'),
                                    child: Text('Okay')),
                              ],
                            ));
                  } else if (qLength - 1 == questionNumber) {
                    if (!isFinished) {
                      print('hello');
                      checkCorrectOrNot(selectedOption);
                      isFinished = true;
                    }
                    await showDialog(
                        context: context,
                        builder: (_) => CustomAlertDialog(
                              title: 'Congratulations on finishing the quiz!!!',
                              content:
                                  'Correct: $countCorrect/$qLength and Incorrect: $countIncorrect/$qLength',
                              actionsList: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Okay'),
                                    child: Text('Okay')),
                              ],
                            ));
                    if (questionNumber == qLength - 1) {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) => SelectTopicScreen(),
                      );
                    }
                  } else {
                    checkCorrectOrNot(selectedOption);
                    setState(() {
                      questionNumber++;
                      selectedOption = null;
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: questions.length - 1 != questionNumber
                      ? Text('Next question')
                      : Text('End quiz'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffEB4747),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  '${questionNumber + 1}/3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  key: ValueKey(questionNumber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
