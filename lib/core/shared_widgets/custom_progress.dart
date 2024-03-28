import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';


class CustomCircular  extends StatelessWidget {
  const CustomCircular({super.key});

  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
     color: AppColors.primary,
   );
}
