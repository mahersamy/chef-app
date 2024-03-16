import 'dart:io';

import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PersonImagePicker extends StatelessWidget {
  const PersonImagePicker({super.key, this.image, required this.onTap});

  final XFile? image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145.w,
      height: 168.h,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SizedBox(
              height: 161.h,
              width: 158.w,
              child: CircleAvatar(
                backgroundImage:image==null?null:FileImage(File(image!.path)),
                backgroundColor: AppColors.grey,
              )),
          Positioned(
            left: 100.w,
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 28.5,
                width: 27.67,
                decoration: const BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    )),
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
