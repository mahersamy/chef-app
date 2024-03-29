import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:chef_app/features/profile/logic/cubit/profile/profile_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_route.dart';
import '../../../../core/shared_widgets/custom_progress.dart';
import '../../../../core/utlis/app_colors.dart';
import '../../logic/cubit/change_password_cubit/change_password_cubit.dart';
import '../widgets/setting_item.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getChefProfile();
    return Scaffold(
      body: SafeArea(
        child:  BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if(state is LogoutSuccess){
              navigatorReplacement(route:  Routes.loginScreen, context: context);
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              builder:(context)=> Column(
                children: [
                SizedBox(
                    height: 161.h,
                    width: 158.w,
                    child: CircleAvatar(backgroundImage:  NetworkImage(BlocProvider.of<ProfileCubit>(context).chef!.profilePic),)),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    BlocProvider.of<ProfileCubit>(context).chef!.name,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppColors.black),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    BlocProvider.of<ProfileCubit>(context).chef!.email,
                    style: Theme
                        .of(context)
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
                    onTap: ()=>navigator(route:  Routes.updateProfileScreen, context: context),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SettingItem(
                    icon: Icons.password,
                    title: AppStrings.password.tr(context),
                    onTap: ()=>navigator(route:  Routes.changePasswordScreen, context: context),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SettingItem(
                    icon: Icons.settings,
                    title: AppStrings.settings.tr(context),
                    onTap: ()=>navigator(route:  Routes.settingScreen, context: context),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SettingItem(
                    icon: Icons.logout,
                    title: AppStrings.logout.tr(context),
                    onTap: (){
                      BlocProvider.of<ProfileCubit>(context).logout();
                    },
                  ),
                ],
              ),
              fallback: (context)=>const Center(child: CustomCircular()),
              condition: state is! GetProfileLoading,
            );
          },
        ),
      ),
    );
  }
}
