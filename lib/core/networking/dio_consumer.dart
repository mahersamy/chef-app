import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:chef_app/core/networking/api_interceptors.dart';
import 'package:chef_app/core/networking/end_points.dart';
import 'package:dio/dio.dart';

class DioConsumer implements ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async{
    try{
      Response response=await dio.get(path,data: data,queryParameters:queryParameters);
      return response.data!;
    }catch(e){
        return [];
    }
  }

  @override
  Future post(String path, {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async{
    try{
      Response response=await dio.post(path,data: data,queryParameters:queryParameters);
      return response.data!;
    }catch(e){
      return [];
    }
  }

  @override
  Future patch(String path, {Object? data, Map<String, dynamic>? queryParameters}) async{
    try{
      Response response=await dio.patch(path,data: data,queryParameters:queryParameters);
      return response.data!;
    }catch(e){
      return [];
    }
  }


  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? queryParameters}) async{
    try{
      Response response=await dio.delete(path,data: data,queryParameters:queryParameters);
      return response.data!;
    }catch(e){
      return [];
    }
  }

}