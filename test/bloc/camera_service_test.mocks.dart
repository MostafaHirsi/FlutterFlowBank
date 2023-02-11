// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_flow_bank/test/bloc/camera_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:math' as _i6;

import 'package:camera_platform_interface/camera_platform_interface.dart'
    as _i2;
import 'package:flutter/services.dart' as _i4;
import 'package:flutter/widgets.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeXFile_0 extends _i1.SmartFake implements _i2.XFile {
  _FakeXFile_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_1 extends _i1.SmartFake implements _i3.Widget {
  _FakeWidget_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [CameraPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockCameraPlatform extends _i1.Mock implements _i2.CameraPlatform {
  MockCameraPlatform() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.CameraDescription>> availableCameras() =>
      (super.noSuchMethod(
        Invocation.method(
          #availableCameras,
          [],
        ),
        returnValue: _i5.Future<List<_i2.CameraDescription>>.value(
            <_i2.CameraDescription>[]),
      ) as _i5.Future<List<_i2.CameraDescription>>);
  @override
  _i5.Future<int> createCamera(
    _i2.CameraDescription? cameraDescription,
    _i2.ResolutionPreset? resolutionPreset, {
    bool? enableAudio = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createCamera,
          [
            cameraDescription,
            resolutionPreset,
          ],
          {#enableAudio: enableAudio},
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
  @override
  _i5.Future<void> initializeCamera(
    int? cameraId, {
    _i2.ImageFormatGroup? imageFormatGroup = _i2.ImageFormatGroup.unknown,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initializeCamera,
          [cameraId],
          {#imageFormatGroup: imageFormatGroup},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Stream<_i2.CameraInitializedEvent> onCameraInitialized(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #onCameraInitialized,
          [cameraId],
        ),
        returnValue: _i5.Stream<_i2.CameraInitializedEvent>.empty(),
      ) as _i5.Stream<_i2.CameraInitializedEvent>);
  @override
  _i5.Stream<_i2.CameraResolutionChangedEvent> onCameraResolutionChanged(
          int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #onCameraResolutionChanged,
          [cameraId],
        ),
        returnValue: _i5.Stream<_i2.CameraResolutionChangedEvent>.empty(),
      ) as _i5.Stream<_i2.CameraResolutionChangedEvent>);
  @override
  _i5.Stream<_i2.CameraClosingEvent> onCameraClosing(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #onCameraClosing,
          [cameraId],
        ),
        returnValue: _i5.Stream<_i2.CameraClosingEvent>.empty(),
      ) as _i5.Stream<_i2.CameraClosingEvent>);
  @override
  _i5.Stream<_i2.CameraErrorEvent> onCameraError(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #onCameraError,
          [cameraId],
        ),
        returnValue: _i5.Stream<_i2.CameraErrorEvent>.empty(),
      ) as _i5.Stream<_i2.CameraErrorEvent>);
  @override
  _i5.Stream<_i2.VideoRecordedEvent> onVideoRecordedEvent(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #onVideoRecordedEvent,
          [cameraId],
        ),
        returnValue: _i5.Stream<_i2.VideoRecordedEvent>.empty(),
      ) as _i5.Stream<_i2.VideoRecordedEvent>);
  @override
  _i5.Stream<_i2.DeviceOrientationChangedEvent> onDeviceOrientationChanged() =>
      (super.noSuchMethod(
        Invocation.method(
          #onDeviceOrientationChanged,
          [],
        ),
        returnValue: _i5.Stream<_i2.DeviceOrientationChangedEvent>.empty(),
      ) as _i5.Stream<_i2.DeviceOrientationChangedEvent>);
  @override
  _i5.Future<void> lockCaptureOrientation(
    int? cameraId,
    _i4.DeviceOrientation? orientation,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #lockCaptureOrientation,
          [
            cameraId,
            orientation,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> unlockCaptureOrientation(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #unlockCaptureOrientation,
          [cameraId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i2.XFile> takePicture(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #takePicture,
          [cameraId],
        ),
        returnValue: _i5.Future<_i2.XFile>.value(_FakeXFile_0(
          this,
          Invocation.method(
            #takePicture,
            [cameraId],
          ),
        )),
      ) as _i5.Future<_i2.XFile>);
  @override
  _i5.Future<void> prepareForVideoRecording() => (super.noSuchMethod(
        Invocation.method(
          #prepareForVideoRecording,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> startVideoRecording(
    int? cameraId, {
    Duration? maxVideoDuration,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #startVideoRecording,
          [cameraId],
          {#maxVideoDuration: maxVideoDuration},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> startVideoCapturing(_i2.VideoCaptureOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #startVideoCapturing,
          [options],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i2.XFile> stopVideoRecording(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #stopVideoRecording,
          [cameraId],
        ),
        returnValue: _i5.Future<_i2.XFile>.value(_FakeXFile_0(
          this,
          Invocation.method(
            #stopVideoRecording,
            [cameraId],
          ),
        )),
      ) as _i5.Future<_i2.XFile>);
  @override
  _i5.Future<void> pauseVideoRecording(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #pauseVideoRecording,
          [cameraId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> resumeVideoRecording(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #resumeVideoRecording,
          [cameraId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Stream<_i2.CameraImageData> onStreamedFrameAvailable(
    int? cameraId, {
    _i2.CameraImageStreamOptions? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #onStreamedFrameAvailable,
          [cameraId],
          {#options: options},
        ),
        returnValue: _i5.Stream<_i2.CameraImageData>.empty(),
      ) as _i5.Stream<_i2.CameraImageData>);
  @override
  _i5.Future<void> setFlashMode(
    int? cameraId,
    _i2.FlashMode? mode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFlashMode,
          [
            cameraId,
            mode,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setExposureMode(
    int? cameraId,
    _i2.ExposureMode? mode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setExposureMode,
          [
            cameraId,
            mode,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setExposurePoint(
    int? cameraId,
    _i6.Point<double>? point,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setExposurePoint,
          [
            cameraId,
            point,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<double> getMinExposureOffset(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #getMinExposureOffset,
          [cameraId],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<double> getMaxExposureOffset(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #getMaxExposureOffset,
          [cameraId],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<double> getExposureOffsetStepSize(int? cameraId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExposureOffsetStepSize,
          [cameraId],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<double> setExposureOffset(
    int? cameraId,
    double? offset,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setExposureOffset,
          [
            cameraId,
            offset,
          ],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<void> setFocusMode(
    int? cameraId,
    _i2.FocusMode? mode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFocusMode,
          [
            cameraId,
            mode,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setFocusPoint(
    int? cameraId,
    _i6.Point<double>? point,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFocusPoint,
          [
            cameraId,
            point,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<double> getMaxZoomLevel(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #getMaxZoomLevel,
          [cameraId],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<double> getMinZoomLevel(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #getMinZoomLevel,
          [cameraId],
        ),
        returnValue: _i5.Future<double>.value(0.0),
      ) as _i5.Future<double>);
  @override
  _i5.Future<void> setZoomLevel(
    int? cameraId,
    double? zoom,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setZoomLevel,
          [
            cameraId,
            zoom,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> pausePreview(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #pausePreview,
          [cameraId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> resumePreview(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #resumePreview,
          [cameraId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setDescriptionWhileRecording(
          _i2.CameraDescription? description) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDescriptionWhileRecording,
          [description],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i3.Widget buildPreview(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #buildPreview,
          [cameraId],
        ),
        returnValue: _FakeWidget_1(
          this,
          Invocation.method(
            #buildPreview,
            [cameraId],
          ),
        ),
      ) as _i3.Widget);
  @override
  _i5.Future<void> dispose(int? cameraId) => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [cameraId],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
