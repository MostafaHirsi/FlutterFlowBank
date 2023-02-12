import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
    );
  }
}
