import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/models/chef_model.dart';
import '../../../data/repository/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  Chef? chef;

  XFile? image;
  GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController brandNameEditingController = TextEditingController();
  TextEditingController desEditingController = TextEditingController();
  TextEditingController minEditingController = TextEditingController();

  void updateProfile() async {
    emit(UpdateProfileLoading());
    final result = await profileRepo.updateProfile(
      name: nameEditingController.text,
      phone: phoneEditingController.text,
      desc: desEditingController.text,
      min: minEditingController.text,
      brandName: brandNameEditingController.text,
      image: image!,
    );
    result.fold((l) {
      emit(UpdateProfileError());
    }, (r) {
      emit(UpdateProfileSuccess());
    });
  }

  void getChefProfile() async {
    emit(GetProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold((l) {
      emit(GetProfileError());
    }, (r) {
      chef = r;
      nameEditingController.text = chef!.name;
      phoneEditingController.text = chef!.phone;
      desEditingController.text = chef!.description;
      minEditingController.text = chef!.minCharge.toString();
      brandNameEditingController.text = chef!.brandName;
      emit(GetProfileSuccess());
    });
  }

  void logout() async {
    final result = await profileRepo.logout();
    result.fold((l) {
      emit(LogoutError());
    }, (r) {
      emit(LogoutSuccess());
    });
  }
}
