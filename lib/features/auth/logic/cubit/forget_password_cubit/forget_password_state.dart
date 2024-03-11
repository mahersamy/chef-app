part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}



class SendCodeLoading extends ForgetPasswordState{}

class SendCodeSucccefuly extends ForgetPasswordState{
  final String message;

  SendCodeSucccefuly({required this.message});


}

class SendCodeError extends ForgetPasswordState{
  final String message;

  SendCodeError({required this.message});



}

class LoadingForgetPassword extends ForgetPasswordState {}

class LoadingForgetSuccessfuly extends ForgetPasswordState {
  final String message;

  LoadingForgetSuccessfuly({required this.message});
}

class LoadingForgetError extends ForgetPasswordState {
  final String message;

  LoadingForgetError({required this.message});

}


class SwitchHiddenForget extends ForgetPasswordState{}

