import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/pages/onboarding/onboarding_page.dart';
import 'package:flutter_flow_bank/utils/assets.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';

class IntroPage extends StatelessWidget {
  static const String routeName = 'IntroPage';
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 7,
            ),
            Container(
              margin: EdgeInsets.only(bottom: Spacing.m),
              child: Image.asset(PngAssets.flutterFlowLogo, scale: 1.5),
            ),
            Text(
              "FlutterFlow Bank",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 6,
            ),
            PrimaryButton(
              buttonText: "Sign up",
              onPressed: () {
                Navigator.pushNamed(context, OnboardingPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
