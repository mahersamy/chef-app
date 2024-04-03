import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_assets.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/commen/commen.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/networking/end_points.dart';
import '../../../../core/routes/app_route.dart';
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
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if(getIt<CacheHelper>().getData(key: ApiKeys.token)!=null){
        navigatorReplacement(context: context, route: Routes.homeScreen);
      }else{
        navigatorReplacement(context: context, route: Routes.changeLangScreen);
      }
    });
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
