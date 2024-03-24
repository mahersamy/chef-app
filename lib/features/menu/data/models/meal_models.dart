import 'package:chef_app/core/networking/end_points.dart';

class MealModels{
  String massage;
  List<MealModel> mealModel;

  MealModels({required this.massage,required this.mealModel});


  factory MealModels.fromJson(Map<String, dynamic>  json) {
    return MealModels(
      massage: json[ApiKeys.message],
      mealModel: List<MealModel>.from(
          json["meals"].map((meal) => MealModel.fromJson(meal))),
    );
  }
}






class MealModel {
  String image;
  String name;
  String description;
  String price;
  MealModel(
      {required this.image,
      required this.name,
      required this.description,
      required this.price,
      });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      image: json["images"] != null && json["images"].isNotEmpty ? json["images"][0] : "", // assuming you want the first image
      name: json["name"],
      description: json["description"],
      price: json["price"] != null ? json["price"].toString() : "", // converting price to string
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ApiKeys.image] = image;
    data[ApiKeys.name] =name;
    data[ApiKeys.description] = description;
    data[ApiKeys.price] =price;
    return data;
  }
}