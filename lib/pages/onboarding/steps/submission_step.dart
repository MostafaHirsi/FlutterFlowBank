import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/utils/string.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:intl/intl.dart';

class SubmissionStep extends StatelessWidget {
  final OnboardState state;
  final UserAccount userAccount;
  final Function() onSubmit;
  const SubmissionStep(
      {super.key,
      required this.state,
      required this.userAccount,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: buildDetailsList(context),
          ),
          PrimaryButton(
            icon: state is OnboardLoading ? buildLoadingIndicator() : null,
            buttonText: state is OnboardLoading ? "Submitting" : "Submit",
            onPressed: state is! OnboardLoading ? onSubmit : null,
          )
        ],
      ),
    );
  }

  Widget buildDetailsList(
    BuildContext context,
  ) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(userAccount.dateOfBirth);
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: Spacing.m,
          ),
          child: Text(
            "Ready to submit your details?",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        buildFieldItem("Name",
            "${userAccount.firstName} ${userAccount.middleName} ${userAccount.lastName}"),
        buildFieldItem("Date Of Birth", "$formattedDate"),
        buildFieldItem("Gender", "${userAccount.gender.capitalize()}"),
        buildFieldItem("No of Dependents", "${userAccount.dependents.length}"),
        buildFieldItem("Address",
            "${userAccount.address.addressLine1}, ${userAccount.address.city}, ${userAccount.address.country}, ${userAccount.address.zipPostalCode} "),
        buildLivenessImage(),
      ],
    );
  }

  Container buildLivenessImage() {
    Uint8List imageBytes = base64Decode(
      userAccount.photo,
    );
    return Container(
      margin: EdgeInsets.only(bottom: Spacing.m),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          18,
        ),
        child: Image.memory(
          imageBytes,
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.image),
          ),
        ),
      ),
    );
  }

  Widget buildFieldItem(String field, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Spacing.s),
      child: Text(
        "$field: $value",
      ),
    );
  }

  Widget buildLoadingIndicator() {
    double size = 15;
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.only(right: Spacing.s),
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
