import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utlis/app_assets.dart';


class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.width, required this.height, required this.imagePath});
  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,width: width.w,
      child: Image.asset(imagePath,),);
  }
}
