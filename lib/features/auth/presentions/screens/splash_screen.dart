import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/core/utlis/app_assets.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commen/commen.dart';
import '../../../../core/shared_widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigateToNextScreen();
    super.initState();

  }

  void navigateToNextScreen(){
    Future.delayed(const Duration(seconds: 1)).then((value) => navigator(context: context,route: Routes.changeLangScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomImage(width: 120,height:120 ,imagePath: AppAssets.appLogo,),
            SizedBox(height: 16.sp,),
            Text(AppStrings.chefApp.tr(context),style:Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black),)

          ],
        ),
      ),
    );
  }
}
