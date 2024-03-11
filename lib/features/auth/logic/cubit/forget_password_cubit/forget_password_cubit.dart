import 'package:chef_app/features/auth/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();
  TextEditingController codeEditingController = TextEditingController();
  bool isPasswordHidden = true;
  IconData passwordIcon = Icons.visibility;
  bool isConfirmPasswordHidden = true;
  IconData confirmPasswordIcon = Icons.visibility;

  void switchHiddenPassword() {
    if (isPasswordHidden) {
      passwordIcon = Icons.visibility_off;
    } else {
      passwordIcon = Icons.visibility;
    }
    isPasswordHidden = !isPasswordHidden;
    emit(SwitchHiddenForget());
  }

  void switchHiddenConfirmPassword() {
    if (isConfirmPasswordHidden) {
      confirmPasswordIcon = Icons.visibility_off;
    } else {
      confirmPasswordIcon = Icons.visibility;
    }
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(SwitchHiddenForget());
  }

  void sendCodeToMail() async {
    emit(SendCodeLoading());
    final result = await authRepo.sendCodeToMail(emailEditingController.text);
    result.fold((l) {
      emit(SendCodeError(message: l));
    }, (r) {
      emit(SendCodeSucccefuly(message: r));
    });
  }

  void forgetPassChange() async {
    emit(LoadingForgetPassword());
    final result = await authRepo.forgetPassChange(
        emailEditingController.text,
        passwordEditingController.text,
        confirmPasswordEditingController.text,
        codeEditingController.text);
    result.fold(
      (l) => emit(LoadingForgetError(message: l)),
      (r) => emit(LoadingForgetSuccessfuly(message: r)),
    );
  }
}
