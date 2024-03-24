part of 'menu_cubit.dart';

@immutable
sealed class MenuState {}

final class MenuInitial extends MenuState {}


final class GetMealsSuccess extends MenuState {}
final class GetMealsError extends MenuState {}
final class GetMealsLoading extends MenuState {}

