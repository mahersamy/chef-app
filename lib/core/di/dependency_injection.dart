import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:chef_app/core/networking/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setupGetIt(){
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}