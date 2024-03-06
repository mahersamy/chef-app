import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/shared_widgets/custom_button.dart';
import 'package:chef_app/core/shared_widgets/person_image_widgets.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commen/commen.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/shared_widgets/custom_input.dart';
import '../../../../core/utlis/app_assets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();
    TextEditingController confirmPasswordEditingController = TextEditingController();
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController phoneEditingController = TextEditingController();
    TextEditingController desEditingController = TextEditingController();
    TextEditingController minEditingController = TextEditingController();


    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.background), fit: BoxFit.fill),
            ),
            child: Center(
                child: Text(
                  AppStrings.welcomeToChefApp.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                )),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
              child: Column(
                children: [
                  SizedBox(
                    height: 300.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          PersonImagePicker(),
                          SizedBox(
                            height: 32.h,
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
                              if(value==null||value.trim().isEmpty||value.length<6){
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.confirmPassword.tr(context),
                            controller: confirmPasswordEditingController,
                            isPassword: true,
                            icon: Icons.remove_red_eye,
                            validation: (value) {
                              if(value==null||value.trim().isEmpty||value.length<6){
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.phoneNumber.tr(context),
                            controller: phoneEditingController,
                            validation: (value) {
                              if(value==null||value.trim().isEmpty||value.length<8){
                                return AppStrings.pleaseEnterValidNumber.tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.name.tr(context),
                            controller: nameEditingController,
                            validation: (value) {
                              if(value==null||value.trim().isEmpty){
                                return AppStrings.pleaseEnterValidName.tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.brandName.tr(context),
                            controller: nameEditingController,
                            validation: (value) {
                              if(value==null||value.trim().isEmpty){
                                return AppStrings.pleaseEnterValidName.tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.description.tr(context),
                            controller: desEditingController,
                            validation: (value) {
                              if(value==null||value.trim().isEmpty){
                                return AppStrings.pleaseEnterValidName.tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.minCharge.tr(context),
                            controller: minEditingController,
                            validation: (value) {
                              if(value==null||value.trim().isEmpty){
                                return AppStrings.pleaseEnterValidName.tr(context);
                              }
                            },
                          ),
                    
                          SizedBox(
                            height: 64.h,
                          ),
                          CustomButton(text: AppStrings.signUp.tr(context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                    
                              Text(AppStrings.iHaveAccount.tr(context)),
                              SizedBox(
                                height: 72.h,
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigator(context: context, route: Routes.loginScreen);
                                  },
                                  child: Text(
                                    AppStrings.signIn.tr(context),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
