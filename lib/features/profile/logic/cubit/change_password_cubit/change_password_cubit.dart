import 'package:bloc/bloc.dart';
import 'package:chef_app/features/profile/data/repository/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.profileRepo) : super(ChangePasswordInitial());
  final ProfileRepo profileRepo;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();

  bool isNewPasswordHidden = true;
  IconData newPasswordIcon = Icons.visibility;
  bool isConfirmPasswordHidden = true;
  IconData confirmPasswordIcon = Icons.visibility;


  void switchHiddenPassword() {
    if (isNewPasswordHidden) {
      newPasswordIcon = Icons.visibility_off;
    } else {
      newPasswordIcon = Icons.visibility;
    }
    isNewPasswordHidden = !isNewPasswordHidden;
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



  void changePassword() async{
    emit(ChangePasswordLoading());
    final result =await profileRepo.changePassword(oldPassword: oldPasswordController.text, newPassword: newPasswordController.text, confirmPassword: confirmPasswordController.text);
    result.fold((l) {
      emit(ChangePasswordError(error: l));
    }, (r) {
      emit(ChangePasswordSuccess());
    });

  }



}
