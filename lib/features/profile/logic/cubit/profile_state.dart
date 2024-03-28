part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ChangePasswordSuccess extends ProfileState {}
final class ChangePasswordError extends ProfileState {}

