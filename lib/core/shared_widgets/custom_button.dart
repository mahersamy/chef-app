import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
