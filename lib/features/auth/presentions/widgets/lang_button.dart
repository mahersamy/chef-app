import 'package:chef_app/core/global_logic/cubit/global_cubit.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangButton extends StatelessWidget {
  const LangButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      height: 48.h,
      child: ElevatedButton(
        onPressed: ()=>onPressed(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.black),
          shape: MaterialStateProperty.all( RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
          )),

        ),
        child: Text(text,style: const TextStyle(color: AppColors.white,fontSize: 24),),
      ),
    );
  }
}
