import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:chef_app/core/networking/end_points.dart';
import 'package:chef_app/features/menu/data/models/meal_models.dart';
import 'package:dartz/dartz.dart';

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
}
