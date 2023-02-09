import 'package:flutter/material.dart';

import '../utils/spacing.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Icon? icon;
  const PrimaryButton({super.key, required this.buttonText, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding:
            EdgeInsets.symmetric(horizontal: Spacing.m, vertical: Spacing.s),
        tapTargetSize: MaterialTapTargetSize.padded,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
      ),
      onPressed: () => {},
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
