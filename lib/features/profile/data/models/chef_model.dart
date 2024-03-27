import 'package:chef_app/core/networking/end_points.dart';

class Chef {
  final String id;
  final String name;
  final String phone;
  final String brandName;
  final double minCharge;
  final String description;
  final Map<String, dynamic> location;
  final String email;
  final String profilePic;

  Chef({
    required this.id,
    required this.name,
    required this.phone,
    required this.brandName,
    required this.minCharge,
    required this.description,
    required this.location,
    required this.email,
    required this.profilePic,
  });

  factory Chef.fromJson(Map<String, dynamic> json) {
    return Chef(
      id: json['_id'],
      name: json[ApiKeys.name],
      phone: json[ApiKeys.phone],
      brandName: json[ApiKeys.brandName],
      minCharge: json[ApiKeys.minOrder].toDouble(),
      description: json[ApiKeys.desc],
      location: json[ApiKeys.locationName],
      email: json[ApiKeys.email],
      profilePic: json[ApiKeys.image],
    );
  }
}