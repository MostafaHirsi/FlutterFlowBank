import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/address_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/dependent_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/dob_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/gender_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/liveness_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/name_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/submission_step.dart';
import 'package:flutter_flow_bank/pages/success/success_page.dart';
import 'package:flutter_flow_bank/utils/camera.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
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
      appBar: AppBar(
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
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: buildPageView(),
        ),
      ),
    );
  }

  Widget buildPageView() {
    OnboardBloc onboardBloc = BlocProvider.of(context);
    return BlocListener(
      bloc: onboardBloc,
      listener: (context, state) {
        if (state is OnboardSuccess) {
          Navigator.pushNamed(context, SuccessPage.routeName,
              arguments: state.bankAccount);
        }

        if (state is OnboardError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Something seems to have gone wrong"),
              content: Text("Please try again later"),
              actions: [
                SecondaryButton(
                    buttonText: "OK", onPressed: () => Navigator.pop(context)),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<OnboardBloc, OnboardState>(
        builder: (context, state) {
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
                    buildSubmissionStep(state, userAccount),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SubmissionStep buildSubmissionStep(
      OnboardState state, UserAccount userAccount) {
    OnboardBloc onboardBloc = BlocProvider.of(context);
    return SubmissionStep(
      state: state,
      userAccount: userAccount,
      onSubmit: () {
        onboardBloc.add(CommitOnboarding(userAccount));
      },
    );
  }

  validate() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (pageIndex < 6) {
        await pageController.animateToPage(
          ++pageIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linearToEaseOut,
        );
        setState(() {
          pageIndex;
        });
      }
    }
  }

  Widget buildCameraStep() {
    return LivenessStep(
      onLivenessComplete: (photo) {
        String encodedPhoto = base64Encode(photo);
        updateUserAccount(photo: encodedPhoto);
        validate();
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
