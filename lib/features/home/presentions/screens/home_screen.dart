import 'package:chef_app/core/local/app_locale.dart';
import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:chef_app/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utlis/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        body:BlocProvider.of<HomeCubit>(context).pages[BlocProvider.of<HomeCubit>(context).currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
        onTap: (BlocProvider.of<HomeCubit>(context).changeScreen),
        elevation: 10,
        items:  [
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,size: 30,),
            label: 'Profile',),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home,size: 30,),
            label: AppStrings.editProfile.tr(context),
          ),
      
        ],
      
      ),
      ),
    );
  },
);
  }
}
