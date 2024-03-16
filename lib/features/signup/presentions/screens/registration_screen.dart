import 'package:chef_app/core/local/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/custom_input.dart';
import '../../../../../core/utlis/app_strings.dart';
import '../../logic/register_cubit/register_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
  builder: (context, state) {
    return Scaffold(
      body:Form(
        key: BlocProvider.of<SignUpCubit>(context).registrationFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
          child: Column(
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomField(
                        hintText: AppStrings.email.tr(context),
                        controller: BlocProvider.of<SignUpCubit>(context).emailEditingController,
                        validation: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.contains("@") == false) {
                            return AppStrings.pleaseEnterValidEmail.tr(context);
                          }
                        },
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomField(
                        hintText: AppStrings.password.tr(context),
                        controller: BlocProvider.of<SignUpCubit>(context).passwordEditingController,
                        isPassword: BlocProvider.of<SignUpCubit>(context).isPasswordHidden,
                        icon: BlocProvider.of<SignUpCubit>(context).passwordIcon,
                        suffixIconOnPressed: BlocProvider.of<SignUpCubit>(context).switchHiddenPassword,
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
                        isPassword: BlocProvider.of<SignUpCubit>(context)
                            .isConfirmPasswordHidden,
                        controller: BlocProvider.of<SignUpCubit>(context)
                            .confirmPasswordEditingController,
                        icon: BlocProvider.of<SignUpCubit>(context)
                            .confirmPasswordIcon,
                        suffixIconOnPressed:
                        BlocProvider.of<SignUpCubit>(context)
                            .switchHiddenConfirmPassword,
                        validation: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.length < 6 ||
                              BlocProvider.of<SignUpCubit>(context)
                                  .passwordEditingController
                                  .text !=
                                  BlocProvider.of<SignUpCubit>(context)
                                      .confirmPasswordEditingController
                                      .text) {
                            return AppStrings.pleaseEnterValidPassword.tr(context);
                          }
                        },
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomField(
                        hintText: AppStrings.phoneNumber.tr(context),
                        controller: BlocProvider.of<SignUpCubit>(context).phoneEditingController,
                        textInputType: TextInputType.number,
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
                        controller: BlocProvider.of<SignUpCubit>(context).nameEditingController,
                        validation: (value) {
                          if(value==null||value.trim().isEmpty){
                            return AppStrings.pleaseEnterValidName.tr(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  },
);
  }
}
