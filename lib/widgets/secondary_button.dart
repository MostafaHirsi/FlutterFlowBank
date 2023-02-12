import 'package:flutter/material.dart';

import '../utils/spacing.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final EdgeInsets? margin;
  final Icon? icon;
  const SecondaryButton(
      {super.key,
      required this.buttonText,
      this.icon,
      required this.onPressed,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? EdgeInsets.symmetric(vertical: Spacing.s, horizontal: 0),
      child: TextButton.icon(
        icon: icon ?? Container(),
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
        onPressed: onPressed,
        label: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
