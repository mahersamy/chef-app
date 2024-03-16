import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/shared_widgets/person_image_widgets.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/register_cubit/register_cubit.dart';


class UploadProfileImage extends StatelessWidget {
  const UploadProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
  builder: (context, state) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        PersonImagePicker(
          onTap: () {
          BlocProvider.of<SignUpCubit>(context).imagePicker(TypeOfImage.PresonalImage);
        },
          image: BlocProvider.of<SignUpCubit>(context).image,
        ),
          SizedBox(height: 24.h,),
          Text(AppStrings.getImage.tr(context),style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black),),
          SizedBox(height: 16.h,),
          Text(AppStrings.imageQuote.tr(context),style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.grey) ,)
      ],),
    );
  },
);
  }
}
