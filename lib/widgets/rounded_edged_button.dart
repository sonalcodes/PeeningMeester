import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class RoundedEdgedButton extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final Color textColor;
  final Function onButtonClick;
  final double height;
  final Color backgroundColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final bool isHorizontalGradient;

  const RoundedEdgedButton({
    Key? key,
    required this.buttonText,
    required this.onButtonClick,
    this.height = 48,
    this.backgroundColor = (AppColors.primaryColor),
    this.borderRadius = 24,
    this.fontSize = 16,
    this.rightMargin = 0,
    this.leftMargin = 0,
    this.bottomMargin = 0,
    this.topMargin = 0,
    this.textColor = AppColors.white,
    this.fontWeight = FontWeight.w700,
    this.isHorizontalGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onButtonClick();
      },
      child: Container(
        height: height,
        margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: topMargin,
          bottom: bottomMargin,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.roboto(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
