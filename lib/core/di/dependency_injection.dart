
import 'package:chef_app/features/home/logic/cubit/home_cubit.dart';
import 'package:chef_app/features/menu/data/repository/menu_repo.dart';
import 'package:chef_app/features/menu/logic/cubit/menu_cubit.dart';
import 'package:chef_app/features/signup/data/repository/signup_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/auth/data/repository/auth_repo.dart';
import '../../features/auth/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/logic/cubit/login_cubit/login_cubit.dart';
import '../../features/signup/logic/register_cubit/register_cubit.dart';
import '../helpers/cache_helper.dart';
import '../networking/api_consumer.dart';
import '../networking/dio_consumer.dart';

final getIt=GetIt.instance;

void setupGetIt(){

  //cubits
  getIt.registerLazySingleton(() => LoginCubit(getIt()));
  getIt.registerLazySingleton(() => SignUpCubit(getIt(), getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordCubit(getIt()));
  getIt.registerLazySingleton(() => HomeCubit());
  getIt.registerLazySingleton(() => MenuCubit(getIt(), getIt()));



  //repos
  getIt.registerLazySingleton(() => AuthRepo());
  getIt.registerLazySingleton(() => SignUpRepo());
  getIt.registerLazySingleton(() => MenuRepo());




  getIt.registerLazySingleton(() => ImagePicker());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}