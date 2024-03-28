import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/person_image_widgets.dart';
import '../../../../core/utlis/app_colors.dart';
import '../widgets/setting_item.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PersonImagePicker(image: null, onTap: () {}),
            SizedBox(
              height: 14.h,
            ),
            Text(
              "maher samy",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.black),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              "5Xs2T@example.com",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.grey),
            ),
            SizedBox(
              height: 32.h,
            ),
            SettingItem(
              icon: Icons.person_2,
              title: AppStrings.editProfile.tr(context),
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingItem(
              icon: Icons.password,
              title: AppStrings.password.tr(context),
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingItem(
              icon: Icons.settings,
              title: AppStrings.settings.tr(context),
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingItem(
              icon: Icons.logout,
              title: AppStrings.logout.tr(context),
            ),
          ],
        ),
      ),
    );
  }
}
