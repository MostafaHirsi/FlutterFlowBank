import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';

class StepHeading extends StatelessWidget {
  final String heading;
  final String subHeading;
  const StepHeading(
      {super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeading(heading, context),
        buildSubHeading(
          subHeading,
        ),
      ],
    );
  }

  Container buildSubHeading(String label) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Spacing.m,
      ),
      child: Text(label),
    );
  }

  Container buildHeading(
    String label,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Spacing.m,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
