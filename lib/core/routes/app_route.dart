import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/features/auth/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/logic/cubit/login_cubit/login_cubit.dart';
import '../../features/auth/presentions/screens/change_lang_screen.dart';
import '../../features/auth/presentions/screens/login_screen.dart';
import '../../features/auth/presentions/screens/reset_password_screen.dart';
import '../../features/auth/presentions/screens/send_code_screen.dart';
import '../../features/auth/presentions/screens/splash_screen.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/home/presentions/screens/home_screen.dart';
import '../../features/menu/logic/cubit/menu_cubit.dart';
import '../../features/menu/presentions/screens/add_menu_screen.dart';
import '../../features/menu/presentions/screens/menu_home.dart';
import '../../features/profile/presentions/screens/change_password_screens.dart';
import '../../features/profile/presentions/screens/profile_screen.dart';
import '../../features/profile/presentions/screens/setting_screen.dart';
import '../../features/profile/presentions/screens/update_profile_screen.dart';
import '../../features/signup/logic/register_cubit/register_cubit.dart';
import '../../features/signup/presentions/screens/main_register_screen.dart';

class Routes {
  static const String initRoute = "/splash";

  //authRoute

  static const String changeLangScreen = "/changeLangScreen";
  static const String resetPasswordScreen = "/restPasswordScreen";
  static const String sendCodeScreen = "/sendCodeScreen";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/register";
  static const String mainRegisterScreen = "/mainRegisterScreen";

  //menuScreen

  static const String addMenuScreen = "/addMenuScreen";
  static const String menuHome = "/menuHome";

  //profile

  static const String changePasswordScreen = "/changePasswordScreen";
  static const String profileScreen = "/profileScreen";
  static const String settingScreen = "/settingScreen";
  static const String updateProfileScreen = "/updateProfileScreen";

  //home

  static const String homeScreen = "/homeScreen";
}

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.changeLangScreen:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create:  (BuildContext context) => getIt<HomeCubit>(),
                  child: const HomeScreen(),
                ));
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.sendCodeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
            child: const SendCodeScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.mainRegisterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<SignUpCubit>(),
            child: MainRegisterScreen(),
          ),
        );
      case Routes.addMenuScreen:
        return MaterialPageRoute(builder: (_) => const AddMenuScreen());
      case Routes.menuHome:
        return MaterialPageRoute(
            builder: (_) => const MenuHomeScreen());
      case Routes.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
    }
    return null;
  }
}
