import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/models/bank_account.dart';
import 'package:flutter_flow_bank/utils/assets.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';

class SuccessPage extends StatelessWidget {
  static const String routeName = 'SuccessPage';
  final BankAccount bankAccount;
  const SuccessPage({super.key, required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          buildLogo(),
          const Spacer(flex: 1),
          buildHeading(context),
          buildSubheading(),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }

  Container buildLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: Spacing.m),
      child: Image.asset(PngAssets.flutterFlowLogo, scale: 1.8),
    );
  }

  Container buildSubheading() {
    return Container(
      margin: EdgeInsets.only(
        bottom: Spacing.m,
      ),
      child: Text(
        "Your bank account number is ${bankAccount.accountNumber}",
      ),
    );
  }

  Container buildHeading(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Spacing.m,
      ),
      child: Text(
        "Congratulations, you now have a FlutterFlow bank account!",
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
