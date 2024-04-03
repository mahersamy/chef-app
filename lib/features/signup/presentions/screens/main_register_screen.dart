import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';

import '../../logic/register_cubit/register_cubit.dart';

class MainRegisterScreen extends StatelessWidget {
  const MainRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if(state is SignUpError){

        }else if(state is SignUpSuccess){

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: AppColors.white,
            title: Text(AppStrings.createAccount.tr(context)),
          ),
          body: Column(
            children: [
              IconStepper(
                lineLength: 40,
                enableStepTapping: false,
                enableNextPreviousButtons: false,
                onStepReached: (index) {
                  BlocProvider.of<SignUpCubit>(context).onIndexChange(index);
                },
                activeStepColor: AppColors.primary,
                activeStep: BlocProvider.of<SignUpCubit>(context).index,
                icons: const [
                  Icon(Icons.account_circle),
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.assignment),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: BlocProvider.of<SignUpCubit>(context).pageController,
                  reverse: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlocProvider.of<SignUpCubit>(context).pages[index];
                  },
                  itemCount:
                      BlocProvider.of<SignUpCubit>(context).pages.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 150.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (BlocProvider.of<SignUpCubit>(context).registrationFormKey.currentState != null && BlocProvider.of<SignUpCubit>(context).registrationFormKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context).next();
                          }
                          else if (BlocProvider.of<SignUpCubit>(context).locationFormKey.currentState != null && BlocProvider.of<SignUpCubit>(context).locationFormKey.currentState!.validate()) {
                            BlocProvider.of<SignUpCubit>(context).next();
                          }
                          else if (BlocProvider.of<SignUpCubit>(context).index == 1) {
                            if (BlocProvider.of<SignUpCubit>(context).image ==
                                null) {
                              showErrorToast("please enter profile image");
                            } else {
                              BlocProvider.of<SignUpCubit>(context).next();
                            }
                          }
                          else if (BlocProvider.of<SignUpCubit>(context).decumentFormKey.currentState != null && BlocProvider.of<SignUpCubit>(context).decumentFormKey.currentState!.validate()&&BlocProvider.of<SignUpCubit>(context).index == 3) {
                            if(BlocProvider.of<SignUpCubit>(context).frontId==null){
                              showErrorToast("please enter front id");
                            }else if(BlocProvider.of<SignUpCubit>(context).backId==null){
                              showErrorToast("please enter back id");
                            }else if(BlocProvider.of<SignUpCubit>(context).healthCertificateId==null){
                              showErrorToast("please enter health certificate id");
                            }else{
                              BlocProvider.of<SignUpCubit>(context).signUp();
                            }
                          }


                        },
                        child: Text(AppStrings.next.tr(context),
                            style: Theme.of(context).textTheme.displayMedium),
                      ),
                    ),
                    if (BlocProvider.of<SignUpCubit>(context).index != 0)
                      SizedBox(
                        width: 20.w,
                      ),
                    if (BlocProvider.of<SignUpCubit>(context).index != 0)
                      SizedBox(
                        height: 50.h,
                        width: 150.h,
                        child: ElevatedButton(
                          onPressed:
                              BlocProvider.of<SignUpCubit>(context).prev,
                          child: Text(AppStrings.prev.tr(context),
                              style: Theme.of(context).textTheme.displayMedium),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
