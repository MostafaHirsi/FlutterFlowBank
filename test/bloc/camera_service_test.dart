import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flow_bank/blocs/camera/camera_bloc.dart';
import 'package:flutter_flow_bank/blocs/onboard/onboard_bloc.dart';
import 'package:flutter_flow_bank/models/user_account.dart';
import 'package:flutter_flow_bank/models/address.dart';
import 'package:flutter_flow_bank/models/dependent.dart';
import 'package:flutter_flow_bank/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:mockito/mockito.dart';

import 'camera_service_test.mocks.dart';

@GenerateMocks([CameraPlatform])
void main() {
  CameraPlatform cameraPlatform = MockCameraPlatform();
  CameraDescription frontCamera = const CameraDescription(
      name: "Front Camera",
      lensDirection: CameraLensDirection.front,
      sensorOrientation: 0);
  when(CameraPlatform.instance.availableCameras()).thenAnswer(
    (_) => Future.value([frontCamera]),
  );

  group('cameraBloc', () {
    blocTest<CameraBloc, CameraState>(
      'Empty State',
      build: () => CameraBloc(),
      expect: () => [],
    );
    blocTest<CameraBloc, CameraState>(
      'Initiate Camera',
      build: () => CameraBloc(),
      act: (bloc) {
        bloc.add(CameraInitiate());
      },
      expect: () => [],
    );
  });
}
