import 'package:bloc/bloc.dart';
import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  bool isPasswordHidden = true;
  IconData passwordIcon = Icons.visibility;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  void switchHiddenPassword() {
    if (isPasswordHidden) {
      passwordIcon = Icons.visibility_off;
    } else {
      passwordIcon = Icons.visibility;
    }
    isPasswordHidden = !isPasswordHidden;
    emit(SwitchHidden());
  }

  LoginModel? loginModel;

  void logIn() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(emailEditingController.text, passwordEditingController.text);
    result.fold(
      (l) => emit(LoginErrorState(error: l)),
      (r)async{
        loginModel = r;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
        await getIt<CacheHelper>().saveData(key: ApiKeys.id, value:decodedToken[ ApiKeys.id]);
        await getIt<CacheHelper>().saveData(key: ApiKeys.token, value: r.token);
        emit(LoginSuccessState());
      },
    );
  }
}
