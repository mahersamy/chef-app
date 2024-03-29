import 'package:bloc/bloc.dart';
import 'package:chef_app/core/di/dependency_injection.dart';
import 'package:chef_app/core/helpers/cache_helper.dart';
import 'package:chef_app/core/networking/end_points.dart';
import 'package:chef_app/features/menu/data/models/meal_models.dart';
import 'package:chef_app/features/menu/data/repository/menu_repo.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/commen/commen.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit( this.menuRepo, this.picker)
      : super(MenuInitial());

  final MenuRepo menuRepo;
  final ImagePicker picker;

  MealModels? mealModels;

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
  SingleValueDropDownController categoryEditingController =
      SingleValueDropDownController();

  XFile? mealImage;

  void changeHowToSell(HowToSell? newHowToSell) {
    howToSell = newHowToSell!;
    emit(MenuInitial());
  }

  void getMeals() {
    emit(GetMealsLoading());
    menuRepo.getAllMeals().then((value) {
      value.fold((l) {
        getIt<CacheHelper>().removeData(key: ApiKeys.token,);
        emit(GetMealsError());
      }, (r) {
        mealModels = r;
        emit(GetMealsSuccess());
      });
    });
  }

  void deleteMeal(String id) {
    menuRepo.deleteMeal(id).then((value) {
      value.fold((l) {
        emit(DeleteMealsError());
      }, (r) {
        getMeals();
        emit(DeleteMealsSuccess());
      });
    });
  }

  void imagePicker() async {
    mealImage = await picker.pickImage(source: ImageSource.gallery);
    mealImage != null
        ? showSuccessToast("Image selected")
        : showErrorToast("Image not selected");
    emit(MenuInitial());
  }





  void addMeal() {
   if(mealImage==null){
     showErrorToast("Please select image");
   }else{
     if (addMealFormKey.currentState!.validate()) {
       emit(AddMealsLoading());
       menuRepo.addMeal(
         name: nameEditingController.text,
         description: descEditingController.text,
         price: priceEditingController.text,
         image: mealImage!,
         howToSell: howToSell.name,
         category: categoryEditingController.dropDownValue!.name,).then((value) {
         value.fold((l) {
           showErrorToast(l);
           emit(AddMealsError());
         }, (r) {
           getMeals();
           emit(AddMealsSuccess());
         });
       });

     }
   }
  }




}

enum HowToSell { number, quantity }
