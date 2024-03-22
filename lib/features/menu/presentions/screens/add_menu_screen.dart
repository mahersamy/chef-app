import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/features/menu/logic/cubit/menu_cubit.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/custom_input.dart';
import '../../../../core/shared_widgets/person_image_widgets.dart';
import '../../../../core/utlis/app_strings.dart';

class AddMenuScreen extends StatelessWidget {
  const AddMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addToMenu.tr(context)),
      ),
      body: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: Form(
              key: BlocProvider.of<MenuCubit>(context).addMealFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PersonImagePicker(
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomField(
                      hintText: AppStrings.name.tr(context),
                      controller: BlocProvider.of<MenuCubit>(context)
                          .nameEditingController,
                      validation: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.pleaseEnterValidMealName
                              .tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomField(
                      hintText: AppStrings.mealNumber.tr(context),
                      controller: BlocProvider.of<MenuCubit>(context)
                          .priceEditingController,
                      isPassword: true,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 6) {
                          return AppStrings.pleaseEnterValidMealPrice
                              .tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomField(
                      hintText: AppStrings.description.tr(context),
                      controller: BlocProvider.of<MenuCubit>(context)
                          .descEditingController,
                      textInputType: TextInputType.number,
                      validation: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 10) {
                          return AppStrings.pleaseEnterValidDesc.tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    DropDownTextField(
                      controller: BlocProvider.of<MenuCubit>(context).categoryEditingController,
                      dropDownList: BlocProvider.of<MenuCubit>(context).categories,
                      // initialValue: BlocProvider.of<MenuCubit>(context).categories[0],
                      validator: (value) {
                        if (value == null|| value.trim().isEmpty) {
                          return AppStrings.pleaseEnterValidMealCategory
                              .tr(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title:Text(AppStrings.mealNumber.tr(context)),
                            value: HowToSell.number,
                            groupValue:
                            BlocProvider.of<MenuCubit>(context).howToSell,
                            onChanged: BlocProvider.of<MenuCubit>(context).changeHowToSell,
                          
                          
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: Text(AppStrings.mealQuantity.tr(context)),
                            value: HowToSell.quality,
                            groupValue:
                            BlocProvider.of<MenuCubit>(context).howToSell,
                            onChanged: BlocProvider.of<MenuCubit>(context).changeHowToSell,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:50.h,
                    ),

                    CustomButton(
                      text: AppStrings.addDishToMenu.tr(context),
                      onPressed: () {
                        if (BlocProvider.of<MenuCubit>(context)
                            .addMealFormKey
                            .currentState!
                            .validate()) {
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
