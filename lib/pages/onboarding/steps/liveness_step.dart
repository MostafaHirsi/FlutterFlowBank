import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/liveness_step/camera_prep.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/liveness_step/camera_preview.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/liveness_step/picture_view.dart';

class LivenessStep extends StatelessWidget {
  final Function(Uint8List) onLivenessComplete;
  late CameraController cameraController;

  LivenessStep({super.key, required this.onLivenessComplete});
  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    CameraBloc cameraBloc = BlocProvider.of(context);
    return BlocBuilder<CameraBloc, CameraState>(
      builder: (context, state) {
        if (state is CameraInitial) {
          return CameraPrep(
            onContinuePressed: () {
              cameraBloc.add(CameraInitiate());
            },
          );
        }

        if (state is CameraInitiated) {
          cameraController = state.cameraController;
          return CameraView(
            controller: cameraController,
            closePhoto: () {
              cameraBloc.add(CameraClose());
            },
            takePhoto: () {
              cameraBloc.add(CameraCapture());
            },
          );
        }

        if (state is CameraCaptured) {
          return PictureView(
            image: state.cameraShot,
            retakePhoto: () {
              cameraBloc.add(CameraReInitiate());
            },
            onProceedWithPhoto: onLivenessComplete,
          );
        }

        if (state is CameraError) {
          return Center(
            child: Text(
              "Oh no! Looks like your camera failed to load, please try again later",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
  }
}
