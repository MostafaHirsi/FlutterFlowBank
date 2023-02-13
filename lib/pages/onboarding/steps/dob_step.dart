import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/step_heading.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/date_picker_field.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

class DobStep extends StatelessWidget {
  final Function() validate;
  final Function(DateTime) updateDateOfBirth;
  final DateTime dateOfBirth;
  const DobStep(
      {super.key,
      required this.validate,
      required this.updateDateOfBirth,
      required this.dateOfBirth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StepHeading(
              heading: "Date of Birth",
              subHeading:
                  "You'll need to be 11 or older to open a bank account"),
          DatePickerField(
            hintText: 'Date of Birth',
            selectedDate: dateOfBirth,
            initialDate: dateOfBirth,
            lastDate: DateTime.now().subtract(const Duration(days: 365 * 11)),
            onDatePicked: updateDateOfBirth,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid date of birth';
              }
              return null;
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
}
