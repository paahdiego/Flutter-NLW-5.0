import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgoundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  NextButtonWidget.darkGreen(
      {required String label, required VoidCallback onTap})
      : this.backgoundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.green,
        this.overlayColor = AppColors.green.withOpacity(0.4),
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgoundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.grey.withOpacity(0.4),
        this.onTap = onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgoundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(this.overlayColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: this.borderColor,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(this.backgoundColor),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: this.fontColor,
          ),
        ),
      ),
    );
  }
}
