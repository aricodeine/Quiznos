import 'package:flutter/material.dart';
import 'package:quiznos/shared/question.dart';

class RadioOption extends StatelessWidget {
  static bool isSubmitted = false;
  const RadioOption({
    Key? key,
    required this.questions,
    required this.questionNumber,
    required this.selectedOption,
    required this.optionNumber,
    required this.onOptionChanged,
    required this.isRightOrWrong,
  }) : super(key: key);

  final List<Question> questions;
  final int questionNumber;
  final String? selectedOption;
  final Function(String?) onOptionChanged;
  final bool isRightOrWrong;
  final int optionNumber;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(questions[questionNumber].options[optionNumber]),
      value: questions[questionNumber].options[optionNumber],
      groupValue: selectedOption,
      onChanged: onOptionChanged,
      secondary: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Visibility(
          visible: isSubmitted,
          key: ValueKey(isRightOrWrong ? const Icon(Icons.check) : const Icon(Icons.clear)),
          child: isRightOrWrong ? const Icon(Icons.check) : const Icon(Icons.clear),
        ),
      ),
    );
  }
}
