import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "https://img.freepik.com/free-psd/delicious-fried-chicken-with-french-fries-isolated-transparent-background_191095-11719.jpg?t=st=1711058653~exp=1711062253~hmac=f104b99d6c6b9f53a6d74a44bf55e936bf5c2cd7536b48e382b592a1b3bd9f47&w=740",
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(
          width: 16.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Fried Chicken",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.black),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Checken hint",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.grey),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "200 LE",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.grey),
            ),
          ],
        ),
        Spacer(),
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
