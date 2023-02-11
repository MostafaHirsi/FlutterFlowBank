import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';

class InputFormField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final EdgeInsets? margin;
  final Function(String?)? onSaved;
  final String? initialValue;

  InputFormField(
      {super.key,
      this.hintText,
      this.validator,
      this.margin,
      this.onSaved,
      this.textInputAction,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: Spacing.s),
      child: TextFormField(
        initialValue: initialValue,
        textCapitalization: TextCapitalization.words,
        textInputAction: textInputAction ?? TextInputAction.done,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
