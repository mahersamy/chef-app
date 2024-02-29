import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum FontsType{ LatoFont,PoppinsFont }
class AppTextStyle{
  Color? color=AppColors.white;
  double? fontSize= 24;
  final FontWeight fontWeight;
  final FontsType fontsType;


  AppTextStyle({required this.fontsType, this.color,this.fontSize, required this.fontWeight});

  TextStyle? getAppText(){
    if(fontsType==FontsType.LatoFont && fontWeight==FontWeight.bold){
      return latoBoldStyle(color: color!, fontSize: fontSize!);

    }else if(fontsType==FontsType.LatoFont && fontWeight!=FontWeight.bold){
      return latoRegularStyle(color: color!,fontSize: fontSize!);


    }else if(fontsType==FontsType.PoppinsFont && fontWeight==FontWeight.bold){
      return poppinsBoldStyle(color: color!, fontSize: fontSize!);

    }else if(fontsType==FontsType.PoppinsFont && fontWeight!=FontWeight.bold){
      return poppinsRegularStyle(color: color!,fontSize: fontSize!);
    }

  }


  TextStyle latoBoldStyle({required Color color, required double fontSize,}) {
    return  GoogleFonts.lato(color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  TextStyle latoRegularStyle({Color color = AppColors.white, double fontSize = 24,}) =>
      GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );


  TextStyle poppinsBoldStyle({required Color color, required double fontSize,}) {
    return  GoogleFonts.poppins(color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  TextStyle poppinsRegularStyle({Color color = AppColors.white, double fontSize = 24,}) =>
      GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
}


