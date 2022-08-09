import 'question.dart';
import 'constants.dart' show QuizTopic;

List<Question> _gkQuestions = [
  Question(
    options: ['Madhya Pradesh', 'Uttar Pradesh', 'Bihar', 'Rajasthan'],
    questionText: 'Which state produces maximum soybean?',
    questionAnswer: 'Madhya Pradesh',
  ),
  Question(
    options: ['USA', 'China', 'Russia', 'India'],
    questionText:
        'Which country operationalized world’s largest radio telescope?',
    questionAnswer: 'China',
  ),
  Question(
    options: ['Jharkhand', 'Jammu and Kashmir', 'Himachal Pradesh', 'Haryana'],
    questionText: 'Which of the following states is not located in the North?',
    questionAnswer: 'Jharkhand',
  ),
];

List<Question> _cnQuestions = [
  Question(
    options: ['64 bits', '128 bits', '256 bits', '512 bits'],
    questionText: 'IPv6 addresses have a size of:',
    questionAnswer: '128 bits',
  ),
  Question(
    options: [
      'Line Area Network',
      'Linear Area Network',
      'Local Area Network',
      'Land Area Network'
    ],
    questionText: 'What is the full form of LAN?',
    questionAnswer: 'Local Area Network',
  ),
  Question(
    options: ['modem', 'router', 'repeater', 'USB'],
    questionText:
        'A _____ is a hardware device which is used to receive, analyse and forward the incoming packets to another network.',
    questionAnswer: 'router',
  ),
];

class QuestionData {
  QuestionData({required this.quizTopic});

  final QuizTopic quizTopic;

  List<Question> get taskcount => getTopicQuestionsList();

  List<Question> getTopicQuestionsList() {
    return quizTopic == QuizTopic.cn ? _cnQuestions : _gkQuestions;
  }

  int get qListLength =>
      quizTopic == QuizTopic.cn ? _cnQuestions.length : _gkQuestions.length;
}
