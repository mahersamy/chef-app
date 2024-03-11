import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/networking/end_points.dart';
import 'package:dio/dio.dart';

import '../di/dependency_injection.dart';

class ApiInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
    getIt<CacheHelper>().getData(key: ApiKeys.token)
        != null
        ? 'FOODAPI ${getIt<CacheHelper>().getData(key: ApiKeys.token)}'
        : null;
    super.onRequest(options, handler);
  }

}