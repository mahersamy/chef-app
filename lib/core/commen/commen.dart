import 'package:flutter/material.dart';
void navigator({required BuildContext context,required String route ,Object? arguments}){
  Navigator.of(context).pushNamed(route,arguments:arguments );
}