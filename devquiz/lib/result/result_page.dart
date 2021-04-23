import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int rightAnswers;

  const ResultPage({
    Key? key,
    required this.title,
    required this.lenght,
    required this.rightAnswers,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/trophystar.png"),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\ncom $rightAnswers de $lenght acertos",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "DevQuiz NLW 5.0 - Flutter: Resultado do quiz $title\nObtive: ${(rightAnswers / lenght) * 100}% ");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                          label: "Voltar ao início",
                          onTap: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
