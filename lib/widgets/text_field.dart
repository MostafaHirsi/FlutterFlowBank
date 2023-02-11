import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final EdgeInsets? margin;

  InputField({super.key, this.hintText, this.onChanged, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: Spacing.s),
      child: TextField(
        textCapitalization: TextCapitalization.words,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
