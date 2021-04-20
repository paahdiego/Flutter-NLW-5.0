import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress-indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Gerenciamento de estado",
            style: AppTextStyles.heading15,
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  "3 de 10",
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 4,
                child: ProgressIndicatorWidget(
                  value: 0.3,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
