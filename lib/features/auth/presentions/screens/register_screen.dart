// import 'package:chef_app/core/local/app_locale.dart';
// import 'package:chef_app/core/shared_widgets/custom_button.dart';
// import 'package:chef_app/core/shared_widgets/person_image_widgets.dart';
// import 'package:chef_app/core/utlis/app_colors.dart';
// import 'package:chef_app/core/utlis/app_strings.dart';
// import 'package:chef_app/features/auth/logic/cubit/register_cubit/register_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/commen/commen.dart';
// import '../../../../core/routes/app_route.dart';
// import '../../../../core/shared_widgets/custom_input.dart';
// import '../../../../core/utlis/app_assets.dart';
//
// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<RegisterCubit, RegisterState>(
//   builder: (context, state) {
//     return Stack(
//         children: [
//           Container(
//             height: 180.h,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(AppAssets.background), fit: BoxFit.fill),
//             ),
//             child: Center(
//                 child: Text(
//                   AppStrings.welcomeToChefApp.tr(context),
//                   style: Theme.of(context).textTheme.displayLarge,
//                 )),
//           ),
//           Form(
//             key: BlocProvider.of<RegisterCubit>(context).registerFormKey,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 200.h,
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           PersonImagePicker(onTap: () {  },),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.email.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).emailEditingController,
//                             validation: (value) {
//                               if (value == null ||
//                                   value.trim().isEmpty ||
//                                   value.contains("@") == false) {
//                                 return AppStrings.pleaseEnterValidEmail.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.password.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).passwordEditingController,
//                             isPassword: BlocProvider.of<RegisterCubit>(context).isPasswordHidden,
//                             icon: BlocProvider.of<RegisterCubit>(context).passwordIcon,
//                             suffixIconOnPressed: BlocProvider.of<RegisterCubit>(context).switchHiddenPassword,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty||value.length<6){
//                                 return AppStrings.pleaseEnterValidPassword.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.confirmPassword.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).confirmPasswordEditingController,
//                             isPassword: true,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty||value.length<6){
//                                 return AppStrings.pleaseEnterValidPassword.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.phoneNumber.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).phoneEditingController,
//                             textInputType: TextInputType.number,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty||value.length<8){
//                                 return AppStrings.pleaseEnterValidNumber.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.name.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).nameEditingController,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty){
//                                 return AppStrings.pleaseEnterValidName.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.brandName.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).brandNameEditingController,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty){
//                                 return AppStrings.pleaseEnterValidBrandName.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.description.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).desEditingController,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty){
//                                 return AppStrings.pleaseEnterValidDesc.tr(context);
//                               }
//                             },
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//                           CustomField(
//                             hintText: AppStrings.minCharge.tr(context),
//                             controller: BlocProvider.of<RegisterCubit>(context).minEditingController,
//                             textInputType: TextInputType.number,
//                             validation: (value) {
//                               if(value==null||value.trim().isEmpty){
//                                 return AppStrings.pleaseEnterValidNumber.tr(context);
//                               }
//                             },
//                           ),
//
//                           SizedBox(
//                             height: 64.h,
//                           ),
//                           CustomButton(text: AppStrings.signUp.tr(context),onPressed: ()=> BlocProvider.of<RegisterCubit>(context)
//                                 .registerFormKey
//                                 .currentState!
//                                 .validate()),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//
//                               Text(AppStrings.iHaveAccount.tr(context)),
//                               SizedBox(
//                                 height: 72.h,
//                               ),
//                               TextButton(
//                                   onPressed: () {
//                                     navigatorReplacement(context: context, route: Routes.loginScreen);
//                                   },
//                                   child: Text(
//                                     AppStrings.signIn.tr(context),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .displaySmall!
//                                         .copyWith(color: AppColors.primary),
//                                   )),
//                             ],
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
//   },
// ),
//     );
//   }
// }
