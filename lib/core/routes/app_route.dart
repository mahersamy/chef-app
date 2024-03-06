import 'package:chef_app/features/auth/presentions/screens/change_lang_screen.dart';
import 'package:chef_app/features/auth/presentions/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentions/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentions/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentions/screens/splash_screen.dart';
import 'package:chef_app/features/menu/presentions/screens/add_menu_screen.dart';
import 'package:chef_app/features/menu/presentions/screens/menu_home.dart';
import 'package:chef_app/features/profile/presentions/screens/change_password_screens.dart';
import 'package:chef_app/features/profile/presentions/screens/profile_screen.dart';
import 'package:chef_app/features/profile/presentions/screens/setting_screen.dart';
import 'package:chef_app/features/profile/presentions/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentions/screens/register_screen.dart';

class Routes {
 static const String initRoute="/";

 //authRoute

 static const String changeLangScreen="/changeLangScreen";
 static const String resetPasswordScreen="/restPasswordScreen";
 static const String sendCodeScreen="/sendCodeScreen";
 static const String loginScreen="/loginScreen";
 static const String registerScreen="/register";

 //menuScreen

 static const String addMenuScreen="/addMenuScreen";
 static const String menuHome="/menuHome";

 //profile

 static const String changePasswordScreen="/changePasswordScreen";
 static const String profileScreen="/profileScreen";
 static const String settingScreen="/settingScreen";
 static const String updateProfileScreen="/updateProfileScreen";



}

class AppRoute{

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.initRoute:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case Routes.changeLangScreen:
        return MaterialPageRoute(builder: (_)=> const ChangeLangScreen());
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_)=> const ResetPasswordScreen());
      case Routes.sendCodeScreen:
        return MaterialPageRoute(builder: (_)=> const SendCodeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_)=> const RegisterScreen());
      case Routes.addMenuScreen:
        return MaterialPageRoute(builder: (_)=> const AddMenuScreen());
      case Routes.menuHome:
        return MaterialPageRoute(builder: (_)=> const MenuScreen());
      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (_)=> const ChangePasswordScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_)=> const ProfileScreen());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_)=> const SettingScreen());
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (_)=> const UpdateProfileScreen());
    }

    }


  }
