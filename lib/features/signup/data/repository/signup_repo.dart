import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/networking/api_consumer.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/networking/end_points.dart';

class SignUpRepo {
  Future<Either<String, String>>? signUp(String email, String password, String confirmPassword, String name, String phone, String desc, String min, String brandName, String locationName) {
  // getIt<ApiConsumer>().post(EndPoint.chefSignUp, data: {
  //   ApiKeys.email: email,
  //   ApiKeys.password: password,
  //   ApiKeys.confirmPassword: confirmPassword,
  //   ApiKeys.name: name,
  //   ApiKeys.phone: phone,
  //   ApiKeys.desc: desc,
  //   ApiKeys.minOrder: min,
  //   ApiKeys.brandName: brandName,
  //   ApiKeys.locationName: locationName
  // });

  }
}