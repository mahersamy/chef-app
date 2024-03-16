import 'package:flutter/material.dart';

import '../../../../core/utlis/app_colors.dart';

class DecumentItem extends StatelessWidget {
  const DecumentItem({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.grey),
        ),
        const Spacer(),
        IconButton(
            onPressed: onPressed, icon: const Icon(Icons.camera_alt_outlined,color: AppColors.primary,))
      ],
    );
  }
}
