import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  List<AnswerModel> get answers => widget.question.answers;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (AnswerModel element in answers)
            AnswerWidget(
              answer: element,
              disabled: selectedIndex != -1,
              isSelected: selectedIndex == answers.indexOf(element),
              onTap: () {
                selectedIndex = answers.indexOf(element);

                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((value) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}
