part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  final List<Object> restProps;
  const CameraEvent(this.restProps);

  @override
  List<Object> get props => restProps;
}

class CameraInitiate extends CameraEvent {
  CameraInitiate() : super([]);
}

class CameraCapture extends CameraEvent {
  final CameraController cameraController;
  CameraCapture(this.cameraController) : super([cameraController]);
}

class CameraReInitiate extends CameraEvent {
  CameraReInitiate() : super([]);
}

class CameraClose extends CameraEvent {
  CameraClose() : super([]);
}
