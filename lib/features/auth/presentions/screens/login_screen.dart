import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/shared_widgets/custom_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


import '../../../../core/commen/commen.dart';
import '../../../../core/routes/app_route.dart';
import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/custom_input.dart';
import '../../../../core/utlis/app_assets.dart';
import '../../../../core/utlis/app_colors.dart';
import '../../../../core/utlis/app_strings.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showSuccessToast("login success");
            navigatorReplacement(context: context, route: Routes.homeScreen);
          } else if (state is LoginErrorState) {
            showErrorToast(state.error);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: 220.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.background),
                      fit: BoxFit.fill),
                ),
                child: Center(
                    child: Text(
                  AppStrings.welcomeBack.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                )),
              ),
              Form(
                key: BlocProvider.of<LoginCubit>(context).formKey,
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
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailEditingController,
                          validation: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                value.contains("@gmail.com") == false) {
                              return AppStrings.pleaseEnterValidEmail
                                  .tr(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomField(
                          hintText: AppStrings.password.tr(context),
                          controller: BlocProvider.of<LoginCubit>(context)
                              .passwordEditingController,
                          isPassword: BlocProvider.of<LoginCubit>(context)
                              .isPasswordHidden,
                          icon:
                              BlocProvider.of<LoginCubit>(context).passwordIcon,
                          suffixIconOnPressed:
                              BlocProvider.of<LoginCubit>(context)
                                  .switchHiddenPassword,
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
                                onPressed: () => navigator(
                                    context: context,
                                    route: Routes.sendCodeScreen),
                                child: Text(
                                  AppStrings.forgetPassword.tr(context),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: AppColors.grey),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 64.h,
                        ),
                        ConditionalBuilder(
                          condition: state is LoginLoadingState,
                          builder: (BuildContext context)=>const CustomCircular(),
                          fallback:(BuildContext context)=> CustomButton(
                            text: AppStrings.signIn.tr(context),
                            onPressed: () async {
                              if (BlocProvider.of<LoginCubit>(context)
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<LoginCubit>(context).logIn();
                              }
                            },
                          ),
                        ),
                        // if (state is LoginLoadingState) const CustomCircular(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.dontHaveAccount.tr(context)),
                            TextButton(
                              onPressed: () {
                                navigator(
                                    context: context,
                                    route: Routes.mainRegisterScreen);
                              },
                              child: Text(
                                AppStrings.signUp.tr(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: AppColors.primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
