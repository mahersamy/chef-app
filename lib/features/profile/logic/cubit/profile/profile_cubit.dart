import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/chef_model.dart';
import '../../../data/repository/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Chef? chef;

  void getChefProfile() async{
    emit(GetProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold((l) {
      emit(GetProfileError());
    }, (r) {
      chef = r;
      emit(GetProfileSuccess());
    });
  }

  void logout() async{
    final result = await profileRepo.logout();
    result.fold((l) {
      emit(LogoutSuccess());
    }, (r) {
      emit(LogoutError());
    });
  }
}
