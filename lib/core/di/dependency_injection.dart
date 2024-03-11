import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:chef_app/core/networking/dio_consumer.dart';
import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:chef_app/features/auth/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/logic/cubit/login_cubit/login_cubit.dart';
import 'package:chef_app/features/auth/logic/cubit/register_cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setupGetIt(){

  //cubits
  getIt.registerLazySingleton(() => LoginCubit(getIt()));
  getIt.registerLazySingleton(() => RegisterCubit());
  getIt.registerLazySingleton(() => ForgetPasswordCubit(getIt()));
  
  
  //repos
  getIt.registerLazySingleton(() => AuthRepo());

  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}