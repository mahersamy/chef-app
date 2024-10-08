import 'package:bloc/bloc.dart';
import 'package:chef_app/core/commen/commen.dart';
import 'package:chef_app/features/signup/data/repository/signup_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../presentions/screens/location_and_min_charge_screen.dart';
import '../../presentions/screens/more_information_of_you_screen.dart';
import '../../presentions/screens/registration_screen.dart';
import '../../presentions/screens/upload_profile_image_screen.dart';


part 'register_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.picker, this.signUpRepo) : super(RegisterInitial());

  final ImagePicker picker;
  final SignUpRepo signUpRepo;


  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> locationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> decumentFormKey = GlobalKey<FormState>();


  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController desEditingController = TextEditingController();
  TextEditingController minEditingController = TextEditingController();
  TextEditingController brandNameEditingController = TextEditingController();
  TextEditingController locationNameEditingController = TextEditingController();
  PageController pageController = PageController(initialPage: 0);

  bool isPasswordHidden = true;
  IconData passwordIcon = Icons.visibility;
  bool isConfirmPasswordHidden = true;
  IconData confirmPasswordIcon = Icons.visibility;
  XFile? image;
  XFile? frontId;
  XFile? backId;
  XFile? healthCertificateId;
  int index = 0;


  void switchHiddenPassword() {
    if (isPasswordHidden) {
      passwordIcon = Icons.visibility_off;
    } else {
      passwordIcon = Icons.visibility;
    }
    isPasswordHidden = !isPasswordHidden;
    emit(SwitchHidden());
  }

  void switchHiddenConfirmPassword() {
    if (isConfirmPasswordHidden) {
      confirmPasswordIcon = Icons.visibility_off;
    } else {
      confirmPasswordIcon = Icons.visibility;
    }
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(SwitchHidden());
  }

  //main register screen


  List<Widget> pages = <Widget>[
    const RegistrationScreen(),
    const UploadProfileImage(),
    const LocationAndMinChargeScreen(),
    const DecumentsScreen()
  ];

  void next() {
    index++;
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    emit(Next());
  }

  void prev() {
    index--;
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    emit(Prev());
  }

  void onIndexChange(int index) {
    this.index = index;
    pageController.animateToPage(
        index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    emit(ChangeIndex());
  }

  void imagePicker(TypeOfImage typeOfImage) async {
    switch (typeOfImage) {
      case TypeOfImage.PresonalImage:
        image = await picker.pickImage(source: ImageSource.gallery);
        image != null ? showSuccessToast("Image selected") : showErrorToast(
            "Image not selected");
        break;
      case TypeOfImage.HealthCertificate:
        healthCertificateId =
        await picker.pickImage(source: ImageSource.gallery);
        healthCertificateId != null ? showSuccessToast(
            "Health Certificate selected") : showErrorToast(
            "Health Certificate not selected");
        break;
      case TypeOfImage.FrontID:
        frontId = await picker.pickImage(source: ImageSource.gallery);
        frontId != null
            ? showSuccessToast("Front ID selected")
            : showErrorToast("Front ID not selected");
        break;
      case TypeOfImage.BackID:
        backId = await picker.pickImage(source: ImageSource.gallery);
        backId != null
            ? showSuccessToast("back ID selected")
            : showErrorToast("back ID not selected");
        break;
    }
    emit(SetImage());
  }

  void signUp() async {
    emit(SignUpLoading());
    final result = await signUpRepo.signUp(email: emailEditingController.text,
        password: passwordEditingController.text,
        confirmPassword: confirmPasswordEditingController.text,
        name: nameEditingController.text,
        phone: phoneEditingController.text,
        desc: desEditingController.text,
        min: minEditingController.text,
        brandName: brandNameEditingController.text,
        locationName: locationNameEditingController.text,
        image: image!,
        frontId: frontId!,
        backId: backId!,
        healthCertificateId: healthCertificateId!);

    try {
      result.fold((l) {
        showErrorToast(l);
        emit(SignUpError(message: l));
      }, (r) {
        showSuccessToast(r);
        emit(SignUpSuccess(message: r));
      });
    } catch (e) {
      showErrorToast(e.toString());
      emit(SignUpError(message: e.toString()));
    }

  }


}

enum TypeOfImage {
  PresonalImage,
  HealthCertificate,
  FrontID,
  BackID
}
