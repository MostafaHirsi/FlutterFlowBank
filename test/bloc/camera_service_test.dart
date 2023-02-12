import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:flutter_flow_bank/services/camera_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:mockito/mockito.dart';

import 'camera_service_test.mocks.dart';

@GenerateMocks([CameraService, CameraController])
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

  when(cameraService.getListofCameras()).thenAnswer(
    (_) => Future.value(mockCameras),
  );

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
