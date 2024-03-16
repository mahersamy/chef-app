part of 'register_cubit.dart';

@immutable
abstract class SignUpState {}

class RegisterInitial extends SignUpState {}

class SwitchHidden extends SignUpState {}


class Next extends SignUpState {}
class Prev extends SignUpState {}
class ChangeIndex extends SignUpState {}


class SetImage extends SignUpState {}
class SignUp extends SignUpState {}



