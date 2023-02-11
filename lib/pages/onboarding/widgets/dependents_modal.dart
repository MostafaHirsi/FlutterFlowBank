import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_flow_bank/widgets/text_field.dart';
import 'package:flutter_flow_bank/widgets/text_form_field.dart';

class DependentsModal extends StatelessWidget {
  String dependentName = "";
  DependentsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Spacing.m,
        right: Spacing.m,
        top: Spacing.s,
        bottom: MediaQuery.of(context).viewInsets.bottom + Spacing.m,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputField(
            hintText: "Enter the name of the dependent",
            onChanged: (name) {
              dependentName = name;
            },
          ),
          PrimaryButton(
            buttonText: "Submit",
            onPressed: () {
              Navigator.pop(context, dependentName);
            },
          ),
        ],
      ),
    );
  }
}
