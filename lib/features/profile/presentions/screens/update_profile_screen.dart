import 'package:chef_app/core/local/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/custom_input.dart';
import '../../../../core/shared_widgets/person_image_widgets.dart';
import '../../../../core/utlis/app_strings.dart';
import '../../logic/cubit/profile_cubit/profile_cubit.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Form(
            key: BlocProvider.of<ProfileCubit>(context).updateFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          PersonImagePicker(
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.phoneNumber.tr(context),
                            controller:
                            BlocProvider.of<ProfileCubit>(context)
                                .phoneEditingController,
                            textInputType: TextInputType.number,
                            validation: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.length < 8) {
                                return AppStrings.pleaseEnterValidNumber
                                    .tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.name.tr(context),
                            controller:
                            BlocProvider.of<ProfileCubit>(context)
                                .nameEditingController,
                            validation: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppStrings.pleaseEnterValidName
                                    .tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.brandName.tr(context),
                            controller:
                            BlocProvider.of<ProfileCubit>(context)
                                .brandNameEditingController,
                            validation: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppStrings.pleaseEnterValidBrandName
                                    .tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.description.tr(context),
                            controller:
                            BlocProvider.of<ProfileCubit>(context)
                                .desEditingController,
                            validation: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppStrings.pleaseEnterValidDesc
                                    .tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomField(
                            hintText: AppStrings.minCharge.tr(context),
                            controller:
                            BlocProvider.of<ProfileCubit>(context)
                                .minEditingController,
                            textInputType: TextInputType.number,
                            validation: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppStrings.pleaseEnterValidNumber
                                    .tr(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          CustomButton(
                              text: AppStrings.signUp.tr(context),
                              onPressed: (){}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
