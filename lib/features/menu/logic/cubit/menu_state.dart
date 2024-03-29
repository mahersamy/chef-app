part of 'menu_cubit.dart';

@immutable
sealed class MenuState {}

final class MenuInitial extends MenuState {}


final class GetMealsSuccess extends MenuState {}
final class GetMealsError extends MenuState {}
final class GetMealsLoading extends MenuState {}


final class DeleteMealsSuccess extends MenuState {}
final class DeleteMealsError extends MenuState {}

final class AddMealsSuccess extends MenuState {}
final class AddMealsLoading extends MenuState {}
final class AddMealsError extends MenuState {}




final class SetImage extends MenuState {}



