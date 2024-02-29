import 'package:flutter/material.dart';

import '../utlis/app_colors.dart';
import '../utlis/app_text_style.dart';

abstract class AppTheme{

  ThemeData getAppTheme() {
    return ThemeData(
        primaryColor: AppColors.primary,
        //scaffoldBackgroundColor
        scaffoldBackgroundColor: AppColors.white,
        //appBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
        ),
        //text theme
        textTheme: TextTheme(
          displayLarge: AppTextStyle(fontsType: FontsType.LatoFont,fontWeight: FontWeight.bold).getAppText(),
          displayMedium:AppTextStyle(fontsType: FontsType.LatoFont,fontWeight: FontWeight.normal).getAppText(),
        ),
        //button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        //text field
        inputDecorationTheme: InputDecorationTheme(
          //enabled border
          enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          //fouced border
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          //error border
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          //hint
          hintStyle: AppTextStyle(fontsType: FontsType.LatoFont,fontWeight: FontWeight.normal,fontSize: 16,color: AppColors.grey).getAppText(),
          //fill color
          // fillColor: AppColors.lightBlack,
          // filled: true,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColors.grey,
            ),
            textStyle: MaterialStateProperty.all(
                AppTextStyle(fontsType: FontsType.LatoFont,fontWeight: FontWeight.bold,fontSize: 16,color: AppColors.grey).getAppText()),
          ),
        ));
  }
}