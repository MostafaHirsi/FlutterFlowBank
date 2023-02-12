import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/liveness_step/camera_prep.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/liveness_step/camera_preview.dart';
import 'package:flutter_flow_bank/pages/onboarding/widgets/liveness_step/picture_view.dart';
import 'package:flutter_flow_bank/utils/camera.dart';
import 'package:flutter_flow_bank/utils/spacing.dart';

class LivenessCheckStep extends StatelessWidget {
  final Function(CameraViewState) onCameraStatusChanged;
  final Function(Uint8List) onLivenessComplete;
  late CameraController cameraController;

  LivenessCheckStep(
      {super.key,
      required this.onCameraStatusChanged,
      required this.onLivenessComplete});
  @override
  Widget build(BuildContext context) {
    CameraBloc cameraBloc = BlocProvider.of(context);
    return BlocListener<CameraBloc, CameraState>(
      listener: (context, state) {
        if (state is CameraInitial) {
          onCameraStatusChanged(CameraViewState.Initial);
          return;
        }

        if (state is CameraInitiated) {
          onCameraStatusChanged(CameraViewState.Ready);
          return;
        }

        if (state is CameraCaptured) {
          onCameraStatusChanged(CameraViewState.PictureTaken);
          return;
        }

        onCameraStatusChanged(CameraViewState.Loading);
      },
      child: BlocBuilder<CameraBloc, CameraState>(
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
      ),
    );
  }

  @override
  void dispose() {
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
  }
}
