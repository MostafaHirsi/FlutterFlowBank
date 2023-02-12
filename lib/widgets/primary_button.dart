import 'package:flutter/material.dart';

import '../utils/spacing.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Widget? icon;
  final Function()? onPressed;
  final EdgeInsets? margin;
  const PrimaryButton(
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
      child: icon != null
          ? ElevatedButton.icon(
              icon: icon!,
              style: buildStyle(),
              onPressed: onPressed,
              label: buildChild(),
            )
          : ElevatedButton(
              style: buildStyle(),
              onPressed: onPressed,
              child: buildChild(),
            ),
    );
  }

  Text buildChild() {
    return Text(
      buttonText,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  ButtonStyle buildStyle() {
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: Spacing.m, vertical: Spacing.s),
      tapTargetSize: MaterialTapTargetSize.padded,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
    );
  }
}
