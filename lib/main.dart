import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/global_logic/cubit/global_cubit.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/core/theme/app_theme.dart';
import 'package:chef_app/features/profile/logic/cubit/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'features/auth/logic/cubit/login_cubit/login_cubit.dart';
import 'features/home/logic/cubit/home_cubit.dart';
import 'features/menu/logic/cubit/menu_cubit.dart';
import 'features/profile/logic/cubit/change_password_cubit/change_password_cubit.dart';
import 'features/signup/logic/register_cubit/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await getIt<CacheHelper>().init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GlobalCubit>(
        create: (context) => GlobalCubit()..getLangInCache(),
      ),
      BlocProvider<MenuCubit>(
        create: (context) => getIt<MenuCubit>(), // Initialize your SecondBloc
      ),
      BlocProvider<ProfileCubit>(
        create: (context) =>
            getIt<ProfileCubit>(), // Initialize your SecondBloc
      ),
      BlocProvider(
        create: (BuildContext context) => getIt<HomeCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => getIt<ChangePasswordCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => getIt<SignUpCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => getIt<LoginCubit>(),
      ),
      BlocProvider(
        create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute = AppRoute();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en"),
              Locale("ar"),
            ],
            locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
            debugShowCheckedModeBanner: false,
            title: 'Chef app',
            theme: getAppTheme(),
            initialRoute: Routes.initRoute,
            onGenerateRoute: appRoute.generateRoute,

            // home:LoginScreen(),
          );
        },
      ),
    );
  }
}
