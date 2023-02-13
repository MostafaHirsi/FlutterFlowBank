import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/gender_modal.dart';
import 'package:flutter_flow_bank/utils/gender.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/dropdown_field.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

import '../widgets/step_heading.dart';

class GenderStep extends StatelessWidget {
  final Function() validate;
  final Function(String) updateGender;
  final String gender;
  const GenderStep(
      {super.key,
      required this.validate,
      required this.updateGender,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    String? formattedGender = gender.isEmpty ? null : gender;

    return Container(
      padding:
          EdgeInsets.only(left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StepHeading(
              heading: "Gender", subHeading: "Select or enter your gender"),
          DropDownFormField(
            hint: "Select your gender",
            options: genderOptions,
            selectedValue: formattedGender,
            onOptionSelected: (String? newValue) async {
              if (newValue == "other") {
                String? specificGender = await showGenderModal(context);
                updateGender(specificGender ?? "other");
              }
              updateGender(newValue!);
            },
          ),
          Spacer(),
          PrimaryButton(
            buttonText: 'Continue',
            onPressed: validate,
          ),
        ],
      ),
    );
  }

  Future<String?> showGenderModal(BuildContext context) async {
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
    return specificGender;
  }
}
