import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void navigator({required BuildContext context,required String route ,Object? arguments}){
  Navigator.of(context).pushNamed(route,arguments:arguments );
}

void navigatorReplacement({required BuildContext context,required String route ,Object? arguments}){
  Navigator.of(context).pushReplacementNamed(route,arguments:arguments );
}


void showSuccessToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primary,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void showErrorToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
