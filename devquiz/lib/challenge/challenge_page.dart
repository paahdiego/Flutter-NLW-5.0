import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(
          milliseconds: 200,
        ),
        curve: Curves.linear,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  totalPages: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onChange: nextPage,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "pular",
                      onTap: nextPage,
                    ),
                  ),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.darkGreen(
                      label: "confirmar",
                      onTap: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
