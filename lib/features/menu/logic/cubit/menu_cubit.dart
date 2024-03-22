import 'package:bloc/bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.imagePicker) : super(MenuInitial());
  final ImagePicker imagePicker;

  HowToSell howToSell = HowToSell.number;
  List<DropDownValueModel> categories = const [
    DropDownValueModel(
      name: "Beef",
      value: "Beef",
    ),
    DropDownValueModel(
      name: "Chicken",
      value: "Chicken",
    ),
    DropDownValueModel(
      name: "Fish",
      value: "Fish",
    ),
    DropDownValueModel(
      name: "Seafood",
      value: "Seafood",
    ),
    DropDownValueModel(
      name: "Pork",
      value: "Pork",
    ),
    DropDownValueModel(
      name: "Lamb",
      value: "Lamb",
    ),
    DropDownValueModel(
      name: "Vegetarian",
      value: "Vegetarian",
    ),
    DropDownValueModel(
      name: "Vegan",
      value: "Vegan",
    ),
    DropDownValueModel(
      name: "Gluten-free",
      value: "Gluten-free",
    ),
    DropDownValueModel(
      name: "Dairy-free",
      value: "Dairy-free",
    ),
    DropDownValueModel(
      name: "Breakfast",
      value: "Breakfast",
    ),
    DropDownValueModel(
      name: "Lunch",
      value: "Lunch",
    ),
    DropDownValueModel(
      name: "Dinner",
      value: "Dinner",
    ),
    DropDownValueModel(
      name: "Appetizers",
      value: "Appetizers",
    ),
    DropDownValueModel(
      name: "Salads",
      value: "Salads",
    ),
    DropDownValueModel(
      name: "Soups",
      value: "Soups",
    ),
    DropDownValueModel(
      name: "Sandwiches",
      value: "Sandwiches",
    ),
    DropDownValueModel(
      name: "Pasta",
      value: "Pasta",
    ),
    DropDownValueModel(
      name: "Pizza",
      value: "Pizza",
    ),
    DropDownValueModel(
      name: "Rice dishes",
      value: "Rice dishes",
    ),
    DropDownValueModel(
      name: "Stir-fries",
      value: "Stir-fries",
    ),
    DropDownValueModel(
      name: "Curries",
      value: "Curries",
    ),
    DropDownValueModel(
      name: "Desserts",
      value: "Desserts",
    ),
    DropDownValueModel(
      name: "Baked goods",
      value: "Baked goods",
    ),
    DropDownValueModel(
      name: "Snacks",
      value: "Snacks",
    ),
  ];
  GlobalKey<FormState> addMealFormKey = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  SingleValueDropDownController categoryEditingController = SingleValueDropDownController();

  XFile? mealImage;

  void changeHowToSell(HowToSell? newHowToSell) {
    howToSell = newHowToSell!;
    emit(MenuInitial());
  }
}

enum HowToSell { number, quality }
