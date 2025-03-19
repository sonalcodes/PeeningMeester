import 'package:flutter/material.dart';
import 'package:peeningmeester/utils/app_styles.dart';

import '../utils/app_colors.dart';

class FillBtnWithImg extends StatelessWidget {
  final String btnText;
  final String btnImg;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry textPadding;
  final EdgeInsetsGeometry margin;
  final VoidCallback onClick;
  final double textSize;

  const FillBtnWithImg({
    super.key,
    required this.btnText,
    this.btnImg = "",
    this.width = double.infinity,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.darkGreen,
    this.borderRadius = 8,
    this.textSize = 18,
    this.textPadding = const EdgeInsets.symmetric(vertical: 12.0),
    this.margin = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: width,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: AppColors.darkGreen),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (btnImg.isNotEmpty) ...[
              Image.asset(
                btnImg,
                height: 24.0,
                width: 24.0,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            Flexible(
              child: Container(
                padding: textPadding,
                child: Text(
                  btnText,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.font600_14().copyWith(color: textColor,fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
