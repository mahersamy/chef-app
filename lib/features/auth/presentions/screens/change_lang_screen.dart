import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/global_logic/cubit/global_cubit.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_assets.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route.dart';
import '../../../../core/shared_widgets/custom_image.dart';
import '../widgets/lang_button.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image:AssetImage(AppAssets.mainBackground),fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 116.h,),
          const CustomImage(width: 120,height:120 ,imagePath: AppAssets.appLogo,),
          SizedBox(height: 16.h,),
          Text(AppStrings.welcomeToChefApp.tr(context),style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black),),
          SizedBox(height: 54.h,),
          Text(AppStrings.pleaseChooseYourLanguage.tr(context),style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black),),
          SizedBox(height: 120.h,),
          selectLangSection(context)

        ],),
      ),
    );
  }

  Widget selectLangSection(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        LangButton(text: "English",onPressed: () {
          BlocProvider.of<GlobalCubit>(context).switchLang("en");
          navigator(context: context, route: Routes.loginScreen);
        },),
        SizedBox(width: 47.w,),
        LangButton(text: "العربية",onPressed: () {
          BlocProvider.of<GlobalCubit>(context).switchLang("ar");
          navigator(context: context, route: Routes.loginScreen);

        },),
      ],),
    );
  }

}
