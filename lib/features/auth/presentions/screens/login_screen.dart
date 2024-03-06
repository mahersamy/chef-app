import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/core/shared_widgets/custom_button.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_input.dart';
import '../../../../core/utlis/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 220.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.background), fit: BoxFit.fill),
            ),
            child: Center(
                child: Text(
              AppStrings.welcomeBack.tr(context),
              style: Theme.of(context).textTheme.displayLarge,
            )),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 325.h,
                    ),
                    CustomField(
                      hintText: AppStrings.email.tr(context),
                      controller: emailEditingController,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.contains("@") == false) {
                          return AppStrings.pleaseEnterValidEmail.trim();
                        }
                      },
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomField(
                      hintText: AppStrings.password.tr(context),
                      controller: passwordEditingController,
                      isPassword: true,
                      icon: Icons.remove_red_eye,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 6) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () =>navigator(context: context, route:Routes.resetPasswordScreen),
                            child: Text(AppStrings.forgetPassword.tr(context),style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.grey),)),
                      ],
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    CustomButton(text: AppStrings.signIn.tr(context)),
                    SizedBox(
                      height: 72.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(AppStrings.dontHaveAccount.tr(context)),
                        TextButton(
                            onPressed: () {
                              navigator(context: context, route: Routes.registerScreen);
                            },
                            child: Text(
                              AppStrings.signUp.tr(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: AppColors.primary),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
