import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/shared_widgets/custom_input.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/register_cubit/register_cubit.dart';
import '../widgets/decument_widget.dart';


class DecumentsScreen extends StatelessWidget {
  const DecumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Form(
        key: BlocProvider.of<SignUpCubit>(context).decumentFormKey,
        child: ListView(
          children: [
            Text(
              "${AppStrings.personInfoText.tr(context)}?",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.black),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomField(
              validation: (value) {
                if (value == null || value.trim().isEmpty && value.length < 20) {
                  return AppStrings.pleaseEnterValidDesc.tr(context);
                }
              },
                hintText: AppStrings.personHintText.tr(context),
                controller:
                    BlocProvider.of<SignUpCubit>(context).desEditingController),
            SizedBox(
              height: 24.h,
            ),
            Text("${AppStrings.requiredInfo.tr(context)}?",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors.black)),
            SizedBox(
              height: 16.h,
            ),
            DecumentItem(text: "frontID", onPressed: ()=>BlocProvider.of<SignUpCubit>(context).imagePicker(TypeOfImage.FrontID)),
            SizedBox(
              height: 24.h,
            ),
            DecumentItem(text: "backID", onPressed:()=>BlocProvider.of<SignUpCubit>(context).imagePicker(TypeOfImage.BackID)),
            SizedBox(
              height: 24.h,
            ),
            DecumentItem(text: "healthCertificateID", onPressed: ()=>BlocProvider.of<SignUpCubit>(context).imagePicker(TypeOfImage.HealthCertificate)),
          ],
        ),
      ),
    );
  }
}
