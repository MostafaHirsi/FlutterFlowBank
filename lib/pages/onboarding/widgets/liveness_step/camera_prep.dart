import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

class CameraPrep extends StatelessWidget {
  final Function() onContinuePressed;
  const CameraPrep({
    super.key,
    required this.onContinuePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(
          flex: 1,
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: Spacing.m,
          ),
          child: Text(
            "Time to take a selfie",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const Text(
          "We need to do a liveness check on you to make sure you're real",
        ),
        const Spacer(
          flex: 4,
        ),
        AspectRatio(
          aspectRatio: 9 / 13,
          child: Container(
            margin: EdgeInsets.all(Spacing.l),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF4B39EF),
                  width: 5,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                )),
            child: const Icon(
              Icons.perm_identity_rounded,
              size: 100,
              color: Color(0xFF4B39EF),
            ),
          ),
        ),
        Spacer(),
        PrimaryButton(
          buttonText: "Continue",
          onPressed: onContinuePressed,
        ),
      ],
    );
  }
}
