import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/global_logic/cubit/global_cubit.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/routes/app_route.dart';
import 'package:chef_app/core/theme/app_theme.dart';
import 'package:chef_app/features/auth/presentions/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/presentions/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await getIt<CacheHelper>().init();
  runApp(BlocProvider(
    create: (context) => GlobalCubit()..getLangInCache(),
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
      builder: (_, child) =>
          BlocBuilder<GlobalCubit, GlobalState>(
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
                onGenerateRoute: appRoute.generateRoute,
                home:LoginScreen(),
              );
            },
          ),
    );
  }
}

