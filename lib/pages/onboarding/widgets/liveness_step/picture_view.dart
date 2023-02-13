import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';
import 'package:flutter_flow_bank/widgets/primary_button.dart';
import 'package:flutter_flow_bank/widgets/secondary_button.dart';

class PictureView extends StatelessWidget {
  final Uint8List image;
  final Function() retakePhoto;
  final Function(Uint8List) onProceedWithPhoto;
  const PictureView({
    super.key,
    required this.image,
    required this.retakePhoto,
    required this.onProceedWithPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Spacing.m, right: Spacing.m, bottom: Spacing.m),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: Spacing.m,
            ),
            child: Text(
              "All clear?",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: Spacing.m,
            ),
            child: const Text(
              "Take another picture if your selfie is blurry or unclear.",
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: Spacing.m),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  18,
                ),
                child: Image.memory(
                  image,
                ),
              ),
            ),
          ),
          PrimaryButton(
            icon: Icon(Icons.check),
            buttonText: "My selfie is clear",
            onPressed: () {
              onProceedWithPhoto(image);
            },
          ),
          SecondaryButton(
            icon: Icon(Icons.replay),
            buttonText: "Retake Photo",
            onPressed: retakePhoto,
          )
        ],
      ),
    );
  }
}
