import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/features/menu/presentions/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utlis/app_strings.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () =>navigator(context: context, route: Routes.addMenuScreen),
                child: Text(
                  AppStrings.addToMenu.tr(context),
                  style: Theme.of(context).textTheme.displayLarge,
                )),
          ),
          SizedBox(height: 24.h,),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) =>  const MealItem(),
            separatorBuilder: (context, index) =>  SizedBox(height: 24.h,),
            itemCount: 2,
          ))
        ],
      ),
    );
  }
}
