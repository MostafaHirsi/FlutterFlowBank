import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter_flow_bank/services/camera_service.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraService cameraService;
  CameraBloc(this.cameraService) : super(CameraInitial()) {
    on<CameraEvent>((event, emit) async {
      try {
        if (event is CameraInitiate) {
          emit(CameraInitiating());
          List<CameraDescription> cameras =
              await cameraService.getListofCameras();
          await cameraService.initialiseController();
          emit(CameraInitiated(cameraService.cameraController));
        }

        if (event is CameraCapture) {
          emit(CameraCapturing());
          Uint8List imageAsBytes = await cameraService.takePicture();
          emit(CameraCaptured(imageAsBytes));
        }

        if (event is CameraReInitiate) {
          emit(CameraInitiated(cameraService.cameraController));
        }

        if (event is CameraClose) {
          cameraService.shutDown();
          emit(CameraInitial());
        }
      } catch (e) {
        emit(CameraError());
      }
    });
  }
}
