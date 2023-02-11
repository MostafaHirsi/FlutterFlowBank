import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/widgets/text_form_field.dart';

class NameStep extends StatelessWidget {
  final Function(String?) onFirstNameSaved;
  final Function(String?) onMiddleNameSaved;
  final Function(String?) onLastNameSaved;
  const NameStep({
    super.key,
    required this.onFirstNameSaved,
    required this.onMiddleNameSaved,
    required this.onLastNameSaved,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildInputFormField(
            'First name', (onSaved) => onFirstNameSaved(onSaved)),
        buildInputFormField(
            'Middle name', (onSaved) => onMiddleNameSaved(onSaved)),
        buildInputFormField('Last name', (onSaved) => onLastNameSaved(onSaved)),
      ],
    );
  }

  InputFormField buildInputFormField(
      String fieldName, Function(String?)? onSaved) {
    return InputFormField(
      onSaved: (savedValue) => onSaved,
      hintText: fieldName,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid ${fieldName.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
