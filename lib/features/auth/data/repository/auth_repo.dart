import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:chef_app/core/networking/end_points.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';

class AuthRepo{
  Future<Either<String,LoginModel>> login(String email,String password)async{
  try{
    final response=await getIt<ApiConsumer>().post(EndPoint.chefSignIn,data: {
      ApiKeys.email:email,
      ApiKeys.password:password,
    });
    return Right(LoginModel.fromJson(response));
  }on ServerException catch(e){
    print(e);
    return Left(e.errorModel.errorMessage);
  }

  }


  Future<Either<String,String>> sendCodeToMail(String email)async{
    try{
      final response=await getIt<ApiConsumer>().post(EndPoint.sendCode,data: {
        ApiKeys.email:email,
      });
      return Right(response[ApiKeys.message]);
    }on ServerException catch(e){
      print(e);
      return Left(e.errorModel.errorMessage);
    }

  }

  Future<Either<String,String>> forgetPassChange(String email,String password,String confirmPassword,String code)async{
    try{
      final response=await getIt<ApiConsumer>().patch(EndPoint.changeForgottenPassword,data: {
        ApiKeys.email:email,
        ApiKeys.password:password,
        ApiKeys.confirmPassword:confirmPassword,
        ApiKeys.code:code,
      });
      return Right(response[ApiKeys.message]);
    }on ServerException catch(e){
      print(e);
      return Left(e.errorModel.errorMessage);
    }

  }



}