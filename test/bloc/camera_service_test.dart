import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera/camera.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/services/camera_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'camera_service_test.mocks.dart';

@GenerateMocks([CameraService])
void main() {
  CameraService cameraService = MockCameraService();
  CameraDescription firstSelfieCamera = const CameraDescription(
      name: "Main Front Camera",
      lensDirection: CameraLensDirection.front,
      sensorOrientation: 0);
  List<CameraDescription> mockCameras = [firstSelfieCamera];
  CameraController cameraController =
      CameraController(firstSelfieCamera, ResolutionPreset.max);

  Uint8List mockPicture = Uint8List.fromList([1, 2, 3, 4]);

  when(cameraService.initialiseController()).thenAnswer((_) async {});

  when(cameraService.takePicture())
      .thenAnswer((_) => Future.value(mockPicture));

  when(cameraService.cameraController).thenReturn(cameraController);

  group('cameraBloc', () {
    blocTest<CameraBloc, CameraState>(
      'Empty State',
      build: () => CameraBloc(cameraService),
      expect: () => [],
    );
    blocTest<CameraBloc, CameraState>(
      'Initiate Camera',
      build: () => CameraBloc(cameraService),
      act: (bloc) {
        bloc.add(CameraInitiate());
      },
      expect: () => [CameraInitiating(), CameraInitiated(cameraController)],
    );
    blocTest<CameraBloc, CameraState>(
      'Take Picture',
      build: () => CameraBloc(cameraService),
      act: (bloc) {
        bloc.add(CameraCapture());
      },
      expect: () => [CameraCapturing(), CameraCaptured(mockPicture)],
    );
  });
}
