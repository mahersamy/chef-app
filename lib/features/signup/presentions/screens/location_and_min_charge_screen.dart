import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/shared_widgets/custom_input.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/register_cubit/register_cubit.dart';


class LocationAndMinChargeScreen extends StatelessWidget {
  const LocationAndMinChargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0).w,
      child: Form(
        key: BlocProvider.of<SignUpCubit>(context).locationFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.setYourLocation.tr(context),style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black),),
              SizedBox(height: 16.h,),
              CustomField(hintText: AppStrings.locationHintText.tr(context), controller: BlocProvider.of<SignUpCubit>(context).locationNameEditingController,validation: (value){
                if(value==null||value.trim().isEmpty){
                  return AppStrings.pleaseEnterValidLocation.tr(context);
                }
              },),
              SizedBox(height: 40.h,),
              Text(AppStrings.termsOfOrders.tr(context),style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black),),
              SizedBox(height: 16.h,),
              CustomField(hintText: AppStrings.minCharge.tr(context), controller: BlocProvider.of<SignUpCubit>(context).minEditingController,validation: (value){
                if(value==null||value.trim().isEmpty){
                  return AppStrings.pleaseEnterValidNumber.tr(context);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
