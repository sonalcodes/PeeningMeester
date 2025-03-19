import 'package:flutter/material.dart';
import 'package:peeningmeester/views/sign_up/full_name/full_name_page.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/baseClass.dart';
import '../../../widgets/form_input_with_hint_on_top.dart';
import '../../../widgets/rounded_edged_button.dart';

class SignUpCodePage extends StatelessWidget with BaseClass{
  const SignUpCodePage({super.key});

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
                FormInputWithHint(label: '',showLabel: false, hintText: 'Verification Code',),
                RoundedEdgedButton(
                  buttonText: 'Continue',


                  onButtonClick: () {
                    pushToNextScreen(context: context, destination: FullNamePage());
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
