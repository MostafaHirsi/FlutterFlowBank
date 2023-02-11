import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final DateTime selectedDate;
  final Function(DateTime selectedDate) onDatePicked;
  final EdgeInsets? margin;
  final String? Function(String?)? validator;

  const DatePickerField(
      {super.key,
      this.hintText,
      required this.onDatePicked,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.margin,
      required this.selectedDate,
      this.validator});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    TextEditingController textEditingController =
        TextEditingController(text: formattedDate);
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(vertical: Spacing.s, horizontal: Spacing.xxxxs),
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () async {
          await selectDate(context);
        },
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(color: Colors.black),
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.date_range),
            hintText: hintText,
          ),
          enabled: false,
          controller: textEditingController,
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1900, 8),
        lastDate: lastDate ?? DateTime(2101));
    if (picked != null) {
      onDatePicked(picked);
    }
  }
}
