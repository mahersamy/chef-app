import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/networking/end_points.dart';
import '../models/chef_model.dart';

class ProfileRepo {
  Future<Either<String, String>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      final response =
          await getIt<ApiConsumer>().patch(EndPoint.chefChangePassword, data: {
        ApiKeys.oldPassword: oldPassword,
        ApiKeys.newPassword: newPassword,
        ApiKeys.confirmPassword: confirmPassword
      });
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> updateProfile(
      {required String name,
      required String phone,
      required String desc,
      required String min,
      required String brandName,

      required XFile image}) async {
    try {
      FormData formData = FormData.fromMap({
        ApiKeys.name: name,
        ApiKeys.phone: phone,
        ApiKeys.desc: desc,
        ApiKeys.minOrder: min,
        ApiKeys.brandName: brandName,
        ApiKeys.locationName:{"\"name\":\"cairo\",\"address\":\"cairo\",\"coordinates\":[1214451511,12541845]"},
        ApiKeys.image: await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
      });
      final response = await getIt<ApiConsumer>().post(EndPoint.updateChef, data: formData);
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }


  Future<Either<String, String>> logout() async {
    try {
      final response = await getIt<ApiConsumer>().get(EndPoint.logout);
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }

  }

  Future<Either<String, Chef>> getProfile() async {
    try {
      final response = await getIt<ApiConsumer>().get(EndPoint.getChefDataEndPoint(getIt<CacheHelper>().getData(key: ApiKeys.id),),);
      // print(response["chef"]);
      return Right(Chef.fromJson(response["chef"]));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

}




