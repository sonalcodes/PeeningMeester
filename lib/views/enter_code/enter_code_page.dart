import 'package:flutter/material.dart';
import 'package:peeningmeester/utils/baseClass.dart';
import 'package:peeningmeester/widgets/form_input_with_hint_on_top.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/rounded_edged_button.dart';

class EnterCodePage extends StatelessWidget with BaseClass{
  const EnterCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Image(image: AssetImage(AppImages.gradient), fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 56,bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the Code',
                  style: AppStyles.font600_32().copyWith(color: Colors.black),
                ),
                FormInputWithHint(label: '',showLabel: false, hintText: 'Enter Code',),
                RoundedEdgedButton(
                  buttonText: 'Continue',


                  onButtonClick: () {

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
