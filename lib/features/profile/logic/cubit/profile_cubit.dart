import 'package:bloc/bloc.dart';
import 'package:chef_app/features/profile/data/repository/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/models/chef_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Chef? chef;

  void changePassword() async{
    final result =await profileRepo.changePassword(oldPassword: oldPasswordController.text, newPassword: newPasswordController.text, confirmPassword: confirmPasswordController.text);
    result.fold((l) {
      emit(ChangePasswordError());
    }, (r) {
      emit(ChangePasswordSuccess());
    });

  }

  void getChefProfile() async{
    final result = await profileRepo.getProfile();
    result.fold((l) {
      emit(ProfileInitial());
    }, (r) {
      chef = r;
      emit(ProfileInitial());
    });
  }

  void logout() async{
    final result = await profileRepo.logout();
    result.fold((l) {
      emit(ProfileInitial());
    }, (r) {
      emit(ProfileInitial());
    });
  }

}
