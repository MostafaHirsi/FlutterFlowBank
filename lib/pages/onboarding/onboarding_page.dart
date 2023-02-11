import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/address_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/dependent_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/dob_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/gender_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/liveness_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/name_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/gender_modal.dart';
import 'package:flutter_flow_bank/utils/camera.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/date_picker_field.dart';
import 'package:flutter_flow_bank/widgets/dropdown_field.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_flow_bank/widgets/secondary_button.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = 'OnboardingPage';

  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  CameraViewState cameraViewState = CameraViewState.Initial;

  late UserAccount userAccount;
  late Address address;

  _OnboardingPageState() {
    DateTime dateOfBirth =
        DateTime.now().subtract(const Duration(days: 365 * 11));
    address = Address("", "", "", "", "", "");
    userAccount =
        UserAccount("", "", "", dateOfBirth, "", const [], address, "");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cameraViewState != CameraViewState.Ready
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (pageIndex > 0) {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linearToEaseOut,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              // title: Text(pageTitles[pageIndex]),
            )
          : null,
      body: Container(
        padding: cameraViewState != CameraViewState.Ready
            ? EdgeInsets.only(
                left: Spacing.m, right: Spacing.m, bottom: Spacing.m)
            : null,
        child: Form(
          key: _formKey,
          child: buildPageView(),
        ),
      ),
    );
  }

  Widget buildPageView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: true,
            onPageChanged: (value) {
              pageIndex = value;
            },
            children: [
              buildNameStep(),
              buildGenderField(),
              buildDobPicker(),
              buildDependentStep(),
              buildAddressStep(),
              buildCameraStep(),
            ],
          ),
        ),
      ],
    );
  }

  validate() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (pageIndex < 5) {
        await pageController.animateToPage(
          ++pageIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut,
        );
        setState(() {
          pageIndex;
        });
      } else {}
    }
  }

  Widget buildCameraStep() {
    return LivenessCheckStep(
      onCameraStatusChanged: (cameraStatus) {
        setState(() {
          cameraViewState = cameraStatus;
        });
      },
      onLivenessComplete: (photo) {
        String encodedPhoto = base64Encode(photo);
        updateUserAccount(photo: encodedPhoto);
      },
    );
  }

  Widget buildAddressStep() {
    return AddressStep(
      validate: validate,
      address: userAccount.address,
      updateAddress: (updatedAddress) {
        setState(() {
          updateUserAccount(address: updatedAddress);
        });
      },
    );
  }

  Widget buildDependentStep() {
    return DependentStep(
      validate: validate,
      dependents: userAccount.dependents,
      onDependentSaved: (Dependent dependent) {
        List<Dependent> dependents = [...userAccount.dependents, dependent];
        setState(() {
          updateUserAccount(dependents: dependents);
        });
      },
      onDependentDeleted: (dependent) {
        List<Dependent> dependents = [...userAccount.dependents];
        dependents.remove(dependent);
        setState(() {
          updateUserAccount(dependents: dependents);
        });
      },
    );
  }

  Widget buildNameStep() {
    return NameStep(
      validate: validate,
      userAccount: userAccount,
      onFirstNameSaved: (updatedFirstName) {
        updateUserAccount(firstName: updatedFirstName);
      },
      onMiddleNameSaved: (updatedMiddleName) {
        updateUserAccount(middleName: updatedMiddleName);
      },
      onLastNameSaved: (updatedLastName) {
        updateUserAccount(lastName: updatedLastName);
      },
    );
  }

  Widget buildGenderField() {
    return GenderStep(
      validate: validate,
      updateGender: (gender) => updateUserAccount(gender: gender),
      gender: userAccount.gender,
    );
  }

  Widget buildDobPicker() {
    return DobStep(
      validate: validate,
      updateDateOfBirth: (dateOfBirth) =>
          updateUserAccount(dateOfBirth: dateOfBirth),
      dateOfBirth: userAccount.dateOfBirth,
    );
  }

  void updateUserAccount(
      {String? firstName,
      String? middleName,
      String? lastName,
      DateTime? dateOfBirth,
      String? gender,
      List<Dependent>? dependents,
      Address? address,
      String? photo}) {
    userAccount = userAccount.copyWith(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        gender: gender,
        dependents: dependents,
        address: address,
        photo: photo);
  }
}
