import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/core/shared_widgets/custom_progress.dart';
import 'package:chef_app/features/menu/logic/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentions/widgets/meal_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utlis/app_strings.dart';

class MenuHomeScreen extends StatefulWidget {
  const MenuHomeScreen({super.key});

  @override
  State<MenuHomeScreen> createState() => _MenuHomeScreenState();
}

class _MenuHomeScreenState extends State<MenuHomeScreen> {

  @override
  void initState() {
    BlocProvider.of<MenuCubit>(context).getMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
  builder: (context, state) {
    return ConditionalBuilder(
      condition: state is GetMealsSuccess,
      builder: (context)=>Padding(
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
                  itemBuilder: (context, index) => MealItem(mealModel: BlocProvider.of<MenuCubit>(context).mealModels!.mealModel[index],),
                  separatorBuilder: (context, index) =>  SizedBox(height: 24.h,),
                  itemCount: BlocProvider.of<MenuCubit>(context).mealModels!.mealModel.length,
                ))
          ],
        ),
      ),
      fallback: (context)=>const CustomCircular(),

    );
  },
);
  }
}
