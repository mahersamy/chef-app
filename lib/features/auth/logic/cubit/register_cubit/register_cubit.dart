import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> registerFormKey=GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController desEditingController = TextEditingController();
  TextEditingController minEditingController = TextEditingController();
  TextEditingController brandNameEditingController = TextEditingController();


  bool isPasswordHidden=true;
  IconData passwordIcon=Icons.visibility;
  void switchHiddenPassword(){
    if(isPasswordHidden){
      passwordIcon = Icons.visibility_off;
    }else{
      passwordIcon=Icons.visibility;
    }
    isPasswordHidden=!isPasswordHidden;
    emit(SwitchHidden());
  }
}
