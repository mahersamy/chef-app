import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/features/profile/logic/cubit/change_password_cubit/change_password_cubit.dart';
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
import '../../../../core/utlis/app_strings.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          navigatorReplacement(context: context, route: Routes.profileScreen);
        } else if (state is ChangePasswordError) {
          showErrorToast("Error");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.changePassword.tr(context)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Form(
                key: BlocProvider.of<ChangePasswordCubit>(context).changePasswordKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      height: 260.h,
                      width: 300.h,
                      decoration: const BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage(AppAssets.lock))),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(
                      AppStrings.changePassword,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomField(
                      hintText: AppStrings.oldPassword.tr(context),
                      isPassword: true,
                      controller: BlocProvider.of<ChangePasswordCubit>(context)
                          .oldPasswordController,
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
                      hintText: AppStrings.newPassword.tr(context),
                      isPassword: BlocProvider.of<ChangePasswordCubit>(context)
                          .isNewPasswordHidden,
                      controller: BlocProvider.of<ChangePasswordCubit>(context)
                          .newPasswordController,
                      icon:
                          BlocProvider.of<ChangePasswordCubit>(context).newPasswordIcon,
                      suffixIconOnPressed: BlocProvider.of<ChangePasswordCubit>(context)
                          .switchHiddenPassword,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 6 ||
                            BlocProvider.of<ChangePasswordCubit>(context)
                                    .newPasswordController
                                    .text !=
                                BlocProvider.of<ChangePasswordCubit>(context)
                                    .newPasswordController
                                    .text) {
                          return AppStrings.pleaseEnterValidPassword.tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomField(
                      hintText: AppStrings.confirmPassword.tr(context),
                      isPassword: BlocProvider.of<ChangePasswordCubit>(context)
                          .isConfirmPasswordHidden,
                      controller: BlocProvider.of<ChangePasswordCubit>(context)
                          .confirmPasswordController,
                      icon: BlocProvider.of<ChangePasswordCubit>(context)
                          .confirmPasswordIcon,
                      suffixIconOnPressed: BlocProvider.of<ChangePasswordCubit>(context)
                          .switchHiddenConfirmPassword,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 6 ||
                            BlocProvider.of<ChangePasswordCubit>(context)
                                    .newPasswordController
                                    .text !=
                                BlocProvider.of<ChangePasswordCubit>(context)
                                    .confirmPasswordController
                                    .text) {
                          return AppStrings.pleaseEnterValidPassword.tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    ConditionalBuilder(
                      condition: state is! ChangePasswordLoading,
                      builder: (context)=>CustomButton(
                          text: AppStrings.changePassword.tr(context),
                          onPressed: () {
                            if (BlocProvider.of<ChangePasswordCubit>(context)
                                    .changePasswordKey
                                    .currentState!
                                    .validate() ==
                                true) {
                              BlocProvider.of<ChangePasswordCubit>(context)
                                  .changePassword();
                            }
                          }),
                      fallback: (context)=>const CustomCircular(),
                    ),
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
