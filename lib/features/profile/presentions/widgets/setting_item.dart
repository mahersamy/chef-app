import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
   SettingItem({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      SizedBox(width: 15.h,),
      Text(title),
    ],);
  }
}
