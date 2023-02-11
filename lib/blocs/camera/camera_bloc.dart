import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  CameraBloc() : super(CameraInitial()) {
    on<CameraEvent>((event, emit) async {
      try {
        if (event is CameraInitiate) {
          emit(CameraInitiating());
          cameras = await availableCameras();
          CameraDescription firstSelfieCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
            orElse: () {
              return cameras.first;
            },
          );
          cameraController =
              CameraController(firstSelfieCamera, ResolutionPreset.max);
          await cameraController.initialize();
          emit(CameraInitiated(cameras, cameraController));
        }

        if (event is CameraCapture) {
          emit(CameraCapturing());
          XFile file = await event.cameraController.takePicture();
          Uint8List imageAsBytes = await file.readAsBytes();
          emit(CameraCaptured(imageAsBytes));
        }

        if (event is CameraReInitiate) {
          emit(CameraInitiated(cameras, cameraController));
        }

        if (event is CameraClose) {
          cameraController.dispose();
          emit(CameraInitial());
        }
      } catch (e) {
        emit(CameraError());
      }
    });
  }
}
