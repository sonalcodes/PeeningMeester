import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peeningmeester/controllers/sign_up/sign_up_controller.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/form_input_with_hint_on_top.dart';
import '../../../widgets/rounded_edged_button.dart';

class SignUpQuestionsPage extends StatelessWidget {
  SignUpQuestionsPage({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What are your main\ngoals',
                      style: AppStyles.font600_32().copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Choose up to 3',
                      style: AppStyles.font500_14().copyWith(
                        color: AppColors.hintColor,
                      ),
                    ),
                  ],
                ),
                GetBuilder<SignUpController>(
                  init: signUpController,
                  builder: ( snapshot) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: signUpController.getSignupGoals.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              signUpController.updateGoals(index);

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                  signUpController.getSignupGoals[index]['isSelected']
                                          ? AppColors.darkGreen
                                          : AppColors.greenShade,
                                ),
                              ),
                              margin: EdgeInsets.only(bottom: 8),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Text(
                                signUpController.getSignupGoals.elementAt(index)['title'],
                                style: AppStyles.font500_14().copyWith(
                                  color: AppColors.darkGreen,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                RoundedEdgedButton(
                  buttonText: 'Continue',

                  onButtonClick: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
