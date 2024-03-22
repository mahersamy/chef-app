import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../menu/presentions/screens/menu_home.dart';
import '../../../profile/presentions/screens/profile_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  List<Widget> pages = [ const ProfileScreen(),const MenuHomeScreen()];
  int currentIndex = 1;

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreen());
  }
}
