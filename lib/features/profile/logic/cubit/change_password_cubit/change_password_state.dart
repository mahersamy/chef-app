part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}


final class SwitchHiddenForget extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {}
final class ChangePasswordError extends ChangePasswordState {
  final String error;
  ChangePasswordError({required this.error});
}




