import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peeningmeester/controllers/sign_up/sign_up_controller.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/baseClass.dart';
import '../../../widgets/btn_fill_with_img.dart';
import '../../../widgets/form_input_with_hint_on_top.dart';
import '../../../widgets/rounded_edged_button.dart';
import '../sign_up_code/sign_up_code_page.dart';

class CreateAccountPage extends StatelessWidget with BaseClass {
   CreateAccountPage({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Image(image: AssetImage(AppImages.gradient), fit: BoxFit.cover),
          Column(
            children: [
              GetBuilder<SignUpController>(
                init: null,
                builder: (snapshot) {
                  return Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 56),
                          Text(
                            'Create your account',
                            style: AppStyles.font600_32().copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 60),
                          FillBtnWithImg(
                            btnText: 'Continue with Google',
                            onClick: () {},
                            btnImg: AppImages.google,
                          ),
                          SizedBox(height: 16),
                          FillBtnWithImg(
                            btnText: 'Continue with Apple',
                            onClick: () {},
                            btnImg: AppImages.apple,
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Or',
                                style: AppStyles.font400_12().copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            height: 36,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.greenShade,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      signUpController
                                          .updatePhoneNumberSelection(true);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            signUpController
                                                    .isPhoneNumberSelected
                                                ? Colors.white
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Phone',
                                          style: AppStyles.font400_14().copyWith(
                                            color:
                                                signUpController
                                                        .isPhoneNumberSelected
                                                    ? Colors.black
                                                    : AppColors.darkGreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      signUpController
                                          .updatePhoneNumberSelection(false);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            signUpController
                                                    .isPhoneNumberSelected
                                                ? Colors.transparent
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Personal',
                                          style: AppStyles.font400_14().copyWith(
                                            color:
                                                signUpController
                                                        .isPhoneNumberSelected
                                                    ? AppColors.darkGreen
                                                    : AppColors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),

                          signUpController.isPhoneNumberSelected
                              ? FormInputWithHint(
                                label: '',
                                showLabel: false,
                                hintText: 'Phone Number',
                                keyboardAction: TextInputAction.done,
                                keyboardType: TextInputType.phone,
                              )
                              : FormInputWithHint(
                                label: '',
                                showLabel: false,
                                hintText: 'Email address',
                                keyboardAction: TextInputAction.done,
                                keyboardType: TextInputType.emailAddress,
                              ),
                          SizedBox(height: 4),
                          Text(
                            signUpController.isPhoneNumberSelected
                                ? 'We\'ll send you a 6-digit verification code.'
                                : 'We\'ll send you a link.',
                            style: AppStyles.font400_12().copyWith(
                              color: AppColors.hintColor,
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  );
                },
              ),
              RoundedEdgedButton(
                buttonText: 'Sign Up',
                leftMargin: 16,
                rightMargin: 16,
                bottomMargin: 16,
                onButtonClick: () {
                  pushToNextScreen(
                    context: context,
                    destination: SignUpCodePage(),
                  );
                  //pushToNextScreen(context: context, destination: EnterCodePage());
                },
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    popToPreviousScreen(context: context);

                    // pushToNextScreen(context: context, destination: SignUpPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?',
                        style: AppStyles.font500_14().copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        ' Log In',
                        style: AppStyles.font500_14().copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ],
      ),
    );
  }
}
