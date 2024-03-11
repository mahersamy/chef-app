import 'package:chef_app/core/networking/end_points.dart';

class LoginModel {
  final String message;
  final String token;

  LoginModel({required this.message, required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> data) {
    return LoginModel(
      message: data[ApiKeys.message],
      token: data[ApiKeys.token],
    );
  }
}
