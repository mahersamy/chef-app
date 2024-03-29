import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:chef_app/core/networking/end_points.dart';
import 'package:chef_app/features/menu/data/models/meal_models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/exceptions.dart';

class MenuRepo {
  Future<Either<String, MealModels>> getAllMeals() async {
    try {
      final response = await getIt<ApiConsumer>().get(EndPoint.getAllChefMeals(getIt<CacheHelper>().getData(key: ApiKeys.id)));
      MealModels mealModels = MealModels.fromJson(response);
      return Right(mealModels);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteMeal(String id) async {
    try {
      final response = await getIt<ApiConsumer>().delete(EndPoint.getdeleteMealEndPoint(id));
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }


  Future<Either<String, MealModel>>addMeal({required String howToSell,required String name,required String description,required String price,required XFile image,required String category}) async {
    try {

      Map<String, dynamic> data = {
        ApiKeys.name: name,
        ApiKeys.description: description,
        ApiKeys.price: price,
        ApiKeys.category: category,
        ApiKeys.howToSell: howToSell,
        ApiKeys.mealImages:await MultipartFile.fromFile(image.path,filename:image.name),
      };
      final response = await getIt<ApiConsumer>().post(EndPoint.addMeal,isFormData: true,data:data);
      MealModel mealModel = MealModel.fromJson(response["newMeal"]);
      return Right(mealModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
