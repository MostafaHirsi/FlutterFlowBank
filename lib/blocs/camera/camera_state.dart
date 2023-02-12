part of 'camera_bloc.dart';

abstract class CameraState extends Equatable {
  final List<Object> restProps;
  const CameraState(this.restProps);

  @override
  List<Object> get props => restProps;
}

class CameraInitial extends CameraState {
  CameraInitial() : super([]);
}

class CameraInitiating extends CameraState {
  CameraInitiating() : super([]);
}

class CameraInitiated extends CameraState {
  final CameraController cameraController;
  CameraInitiated(this.cameraController) : super([cameraController]);
}

class CameraCapturing extends CameraState {
  CameraCapturing() : super([]);
}

class CameraCaptured extends CameraState {
  final Uint8List cameraShot;
  CameraCaptured(this.cameraShot) : super([cameraShot]);
}

class CameraError extends CameraState {
  CameraError() : super([]);
}
