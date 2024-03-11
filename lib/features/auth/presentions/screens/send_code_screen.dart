import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/core/shared_widgets/custom_button.dart';
import 'package:chef_app/core/shared_widgets/custom_input.dart';
import 'package:chef_app/core/utlis/app_assets.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:chef_app/features/auth/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_progress.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is SendCodeSucccefuly) {
          navigator(context: context, route: Routes.resetPasswordScreen);
        } else if (state is SendCodeError) {
          print(state.message);
        }
      },
      builder: (context, state) {
        return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.forgetPassword.tr(context)),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key:  BlocProvider.of<ForgetPasswordCubit>(context).emailPasswordFormKey,
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
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.lock))),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Text(
                          AppStrings.sendResetLinkInfo,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        CustomField(
                          hintText: AppStrings.email.tr(context),
                          controller: BlocProvider.of<ForgetPasswordCubit>(context).emailEditingController,
                          validation: (value){
                            if (value == null ||
                                value.trim().isEmpty ||
                                value.contains("@gmail.com") == false) {
                              return AppStrings.pleaseEnterValidEmail
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        ConditionalBuilder(
                          condition: state is SendCodeLoading,
                          builder: (BuildContext context) => const CustomCircular(),
                          fallback: (BuildContext context) => CustomButton(
                              text: AppStrings.sendResetLink.tr(context),
                              onPressed: () {
                               if(BlocProvider.of<ForgetPasswordCubit>(context).emailPasswordFormKey.currentState!.validate()){
                                 BlocProvider.of<ForgetPasswordCubit>(context)
                                     .sendCodeToMail();
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
      },
    );
  }
}
