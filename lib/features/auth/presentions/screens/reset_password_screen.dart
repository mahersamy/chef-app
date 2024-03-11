import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commen/commen.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/custom_input.dart';
import '../../../../core/shared_widgets/custom_progress.dart';
import '../../../../core/utlis/app_assets.dart';
import '../../logic/cubit/forget_password_cubit/forget_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is LoadingForgetSuccessfuly) {
          navigatorReplacement(context: context, route: Routes.loginScreen);
        } else if (state is LoadingForgetError) {
          print(state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.forgetPassword.tr(context)),
          ),
          body: Form(
            key: BlocProvider.of<ForgetPasswordCubit>(context).forgetPasswordFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      height: 300.h,
                      width: 300.h,
                      decoration: const BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage(AppAssets.lock))),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      AppStrings.createYourNewPassword,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomField(
                      hintText: AppStrings.newPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isPasswordHidden,
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .passwordEditingController,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .passwordIcon,
                      suffixIconOnPressed:
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .switchHiddenPassword,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 6) {
                          return AppStrings.pleaseEnterValidPassword.tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomField(
                      hintText: AppStrings.confirmPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordHidden,
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordEditingController,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordIcon,
                      suffixIconOnPressed:
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .switchHiddenConfirmPassword,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 6 ||
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                    .passwordEditingController
                                    .text !=
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .confirmPasswordEditingController
                                    .text) {
                          return AppStrings.pleaseEnterValidPassword.tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomField(
                      hintText: AppStrings.code.tr(context),
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .codeEditingController,
                      textInputType: TextInputType.number,
                      validation: (value) {
                        if (value!.length < 6) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ConditionalBuilder(
                      condition: state is LoadingForgetPassword,
                      builder: (BuildContext context) => const CustomCircular(),
                      fallback: (BuildContext context) => CustomButton(
                          text: AppStrings.sendResetLink.tr(context),
                          onPressed: () {
                            if (BlocProvider.of<ForgetPasswordCubit>(context)
                                .forgetPasswordFormKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .forgetPassChange();
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
