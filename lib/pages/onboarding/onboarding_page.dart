import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/address_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/dependent_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/steps/name_step.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/gender_modal.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/date_picker_field.dart';
import 'package:flutter_flow_bank/widgets/dropdown_field.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

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
  final List<String> genderOptions = [
    "Male",
    "Female",
    "Custom",
    "Rather not say"
  ];
  final List<String> pageTitles = [
    "Name",
    "Gender",
    "Age",
    "Dependents",
    "Address"
  ];

  late UserAccount userAccount;
  late Address address;

  _OnboardingPageState() {
    DateTime dateOfBirth =
        DateTime.now().subtract(const Duration(days: 365 * 11));
    address = Address("", "", "", "", "", "");
    userAccount = UserAccount("", "", "", dateOfBirth, "", const [], address);
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
        title: Text(pageTitles[pageIndex]),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
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
                  ],
                ),
              ),
              PrimaryButton(
                buttonText: pageIndex < 4 ? "Next" : "Complete",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (pageIndex < 4) {
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AddressStep buildAddressStep() {
    return AddressStep(
      address: userAccount.address,
      updateAddress: (updatedAddress) =>
          updateUserAccount(address: updatedAddress),
    );
  }

  Widget buildDependentStep() {
    return DependentStep(
      dependents: userAccount.dependents,
      onDependentSaved: (Dependent dependent) {
        setState(() {
          userAccount.dependents.add(dependent);
        });
      },
      onDependentDeleted: (dependent) {
        setState(() {
          userAccount.dependents.remove(dependent);
        });
      },
    );
  }

  NameStep buildNameStep() {
    return NameStep(
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

  DropDownFormField buildGenderField() {
    String? gender = userAccount.gender.isEmpty ? null : userAccount.gender;
    return DropDownFormField(
      hint: "Select your gender",
      options: genderOptions,
      selectedValue: gender,
      onOptionSelected: (String? newValue) async {
        if (newValue == "custom") {
          String? specificGender = await showModalBottomSheet(
            context: context,
            enableDrag: false,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => GenderModal(),
          );
          setState(() {
            updateUserAccount(gender: specificGender ?? "custom");
          });
        }
        setState(() {
          updateUserAccount(gender: newValue);
        });
      },
    );
  }

  DatePickerField buildDobPicker() {
    return DatePickerField(
      hintText: 'Date of Birth',
      selectedDate: userAccount.dateOfBirth,
      initialDate: userAccount.dateOfBirth,
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 11)),
      onDatePicked: (selectedDate) {
        setState(() {
          updateUserAccount(dateOfBirth: selectedDate);
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid date of birth';
        }
        return null;
      },
    );
  }

  void updateUserAccount(
      {String? firstName,
      String? middleName,
      String? lastName,
      DateTime? dateOfBirth,
      String? gender,
      List<Dependent>? dependents,
      Address? address}) {
    userAccount = userAccount.copyWith(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        gender: gender,
        dependents: dependents,
        address: address);
  }
}
