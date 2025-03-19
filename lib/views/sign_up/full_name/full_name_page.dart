import 'package:flutter/material.dart';
import 'package:peeningmeester/utils/baseClass.dart';
import 'package:peeningmeester/views/sign_up/sign_up_questions/sign_up_questions_page.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/form_input_with_hint_on_top.dart';
import '../../../widgets/rounded_edged_button.dart';

class FullNamePage extends StatelessWidget with BaseClass {
  const FullNamePage({super.key});

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
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 56,
              bottom: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us a little bit\nabout yourself',
                  style: AppStyles.font600_32().copyWith(color: Colors.black),
                ),
                Column(
                  children: [
                    FormInputWithHint(
                      label: '',
                      showLabel: false,
                      hintText: 'First Name',
                    ),
                    SizedBox(height: 8),
                    FormInputWithHint(
                      label: '',
                      showLabel: false,
                      hintText: 'Last Name',
                    ),
                  ],
                ),

                RoundedEdgedButton(
                  buttonText: 'Continue',

                  onButtonClick: () {
                    pushToNextScreen(context: context, destination: SignUpQuestionsPage());
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
