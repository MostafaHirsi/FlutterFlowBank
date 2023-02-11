import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';

class DropDownFormField extends StatelessWidget {
  final String hint;
  final List<String> options;
  final String? selectedValue;
  final Function(String?) onOptionSelected;
  final EdgeInsets? margin;
  const DropDownFormField(
      {super.key,
      required this.hint,
      required this.options,
      required this.selectedValue,
      required this.onOptionSelected,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: Spacing.s),
      alignment: Alignment.topCenter,
      child: DropdownButtonFormField(
        hint: Text(hint),
        value: selectedValue,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid date of birth';
          }
          return null;
        },
        icon: const Icon(Icons.keyboard_arrow_down),
        items: options.map((String item) {
          return DropdownMenuItem(
            value: item.replaceAll(" ", "_").toLowerCase(),
            child: Text(item),
          );
        }).toList(),
        onChanged: onOptionSelected,
      ),
    );
  }
}
