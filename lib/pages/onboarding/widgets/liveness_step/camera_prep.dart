import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/utils/assets.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CameraPrep extends StatelessWidget {
  final Function() onContinuePressed;
  const CameraPrep({
    super.key,
    required this.onContinuePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            "We need to do a liveness check on you to make sure you're real!",
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.all(Spacing.l),
            child: Image.asset(PngAssets.kycIcon),
          ),
          Spacer(),
          PrimaryButton(
            buttonText: "Continue",
            onPressed: onContinuePressed,
          ),
        ],
      ),
    );
  }
}
