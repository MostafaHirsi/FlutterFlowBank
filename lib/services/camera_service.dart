import 'dart:typed_data';

import 'package:camera/camera.dart';

class CameraService {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  Future<void> initialiseController() async {
    _cameras = await availableCameras();
    CameraDescription firstSelfieCamera = _cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () {
        return _cameras.first;
      },
    );
    _cameraController =
        CameraController(firstSelfieCamera, ResolutionPreset.max);
    await _cameraController.initialize();
  }

  Future<Uint8List> takePicture() async {
    XFile file = await _cameraController.takePicture();
    Uint8List imageAsBytes = await file.readAsBytes();
    return imageAsBytes;
  }

  void shutDown() {
    _cameraController.dispose();
  }

  CameraController get cameraController => _cameraController;
}
