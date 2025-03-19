import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peeningmeester/controllers/login/login_controller.dart';
import 'package:peeningmeester/utils/app_images.dart';
import 'package:peeningmeester/utils/baseClass.dart';
import 'package:peeningmeester/views/enter_code/enter_code_page.dart';
import 'package:peeningmeester/views/sign_up/create_account/create_account_page.dart';
import 'package:peeningmeester/widgets/btn_fill_with_img.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/form_input_with_hint_on_top.dart';
import '../../widgets/rounded_edged_button.dart';

class LoginPage extends StatelessWidget with BaseClass {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());

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
              GetBuilder<LoginController>(
                init: loginController,
                builder: ( snapshot) {
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
                            'Log In',
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
                                child: Container(height: 0.5, color: Colors.grey),
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
                                child: Container(height: 0.5, color: Colors.grey),
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
                                      loginController.updatePhoneNumberSelection(
                                        true,
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            loginController.isPhoneNumberSelected
                                                ? Colors.white
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Phone',
                                          style: AppStyles.font400_14().copyWith(
                                            color:
                                                loginController
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
                                      loginController.updatePhoneNumberSelection(
                                        false,
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            loginController.isPhoneNumberSelected
                                                ? Colors.transparent
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Personal',
                                          style: AppStyles.font400_14().copyWith(
                                            color:
                                                loginController
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

                          loginController.isPhoneNumberSelected
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
                            loginController.isPhoneNumberSelected
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
                }
              ),
              RoundedEdgedButton(
                buttonText: 'Log In',
                leftMargin: 16,
                rightMargin: 16,
                bottomMargin: 16,
                onButtonClick: () {
                  pushToNextScreen(
                    context: context,
                    destination: EnterCodePage(),
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    pushToNextScreen(
                      context: context,
                      destination: CreateAccountPage(),
                    );
                  },
                  child: Container(
                    width: double.infinity,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: AppStyles.font500_14().copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          ' Sign Up',
                          style: AppStyles.font500_14().copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
