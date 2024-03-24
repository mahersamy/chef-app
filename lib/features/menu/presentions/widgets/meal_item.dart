import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/shared_widgets/custom_progress.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/features/menu/data/models/meal_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealModel});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          height: 50.h,
            width: 50.w,
          imageUrl: mealModel.image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const CustomCircular(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        SizedBox(
          width: 16.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              mealModel.name,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.black),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              mealModel.description,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.grey),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              mealModel.price,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.grey),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cancel,
              size: 50,
              color: Colors.red,
            ))
      ],
    );
  }
}
