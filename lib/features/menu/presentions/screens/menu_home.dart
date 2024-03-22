import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/features/menu/presentions/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utlis/app_strings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              AppStrings.addToMenu.tr(context),
              style: Theme.of(context).textTheme.displayLarge,
            )),
        SizedBox(height: 24.h,),
        Expanded(
            child: ListView.separated(
          itemBuilder: (context, index) =>  MealItem(),
          separatorBuilder: (context, index) =>  SizedBox(height: 24.h,),
          itemCount: 2,
        ))
      ],
    );
  }
}
