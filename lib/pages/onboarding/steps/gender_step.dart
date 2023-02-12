import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/gender_modal.dart';
import 'package:flutter_flow_bank/utils/gender.dart';
import 'package:flutter_flow_bank/widgets/dropdown_field.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropDownFormField(
          hint: "Select your gender",
          options: genderOptions,
          selectedValue: formattedGender,
          onOptionSelected: (String? newValue) async {
            if (newValue == "custom") {
              String? specificGender = await showGenderModal(context);
              updateGender(specificGender ?? "custom");
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
