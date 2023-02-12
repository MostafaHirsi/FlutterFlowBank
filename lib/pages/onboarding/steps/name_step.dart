import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_flow_bank/widgets/text_form_field.dart';

class NameStep extends StatelessWidget {
  final Function() validate;
  final UserAccount userAccount;
  final Function(String?) onFirstNameSaved;
  final Function(String?) onMiddleNameSaved;
  final Function(String?) onLastNameSaved;
  const NameStep({
    super.key,
    required this.onFirstNameSaved,
    required this.onMiddleNameSaved,
    required this.onLastNameSaved,
    required this.validate,
    required this.userAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            children: [
              buildInputFormField(
                  'First name',
                  (onSaved) => onFirstNameSaved(onSaved),
                  userAccount.firstName),
              buildInputFormField(
                  'Middle name',
                  (onSaved) => onMiddleNameSaved(onSaved),
                  userAccount.middleName),
              buildInputFormField('Last name',
                  (onSaved) => onLastNameSaved(onSaved), userAccount.lastName),
            ],
          ),
        ),
        PrimaryButton(
          buttonText: 'Continue',
          onPressed: validate,
        ),
      ],
    );
  }

  InputFormField buildInputFormField(
      String fieldName, Function(String?)? onSaved, String initialValue) {
    return InputFormField(
      onSaved: (savedValue) => onSaved,
      hintText: fieldName,
      initialValue: initialValue,
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
