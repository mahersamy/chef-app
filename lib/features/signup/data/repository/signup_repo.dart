import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/error/exceptions.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/networking/end_points.dart';

class SignUpRepo {
  Future<Either<String, String>> signUp(
  {
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required String desc,
    required String min,
    required String brandName,
    required String locationName,
    required XFile image,
    required XFile frontId,
    required XFile backId,
    required XFile healthCertificateId
}
      ) async{
    try{
      FormData formData = FormData.fromMap({
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.confirmPassword: confirmPassword,
        ApiKeys.name: name,
        ApiKeys.phone: phone,
        ApiKeys.desc: desc,
        ApiKeys.minOrder: min,
        ApiKeys.brandName: brandName,
        ApiKeys.locationName: {"\"name\":\"cairo\",\"address\":\"cairo\",\"coordinates\":[1214451511,12541845]"},
        ApiKeys.image: await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
        ApiKeys.frontId: await MultipartFile.fromFile(frontId.path, filename: frontId.path.split('/').last),
        ApiKeys.backId: await MultipartFile.fromFile(backId.path, filename: backId.path.split('/').last),
        ApiKeys.healthCertificateId: await MultipartFile.fromFile(healthCertificateId.path, filename: healthCertificateId.path.split('/').last),
      });
      Response response =await getIt<ApiConsumer>().post(EndPoint.chefSignUp, data: formData);
      return Right(response.data[ApiKeys.message]);
    }
    on ServerException catch(e){
      return Left(e.errorModel.errorMessage);
    }
  }
}
