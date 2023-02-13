import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  final Function() takePhoto;
  final Function() closePhoto;
  const CameraView({
    super.key,
    required this.controller,
    required this.takePhoto,
    required this.closePhoto,
  });

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: buildPreview(context),
        ),
        Flexible(
          flex: 2,
          child: buildCaptureButton(context),
        ),
      ],
    );
  }

  Widget buildPreview(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: AspectRatio(
        aspectRatio: 1 / controller.value.aspectRatio,
        child: ClipRRect(
          child: CameraPreview(
            controller,
          ),
        ),
      ),
    );
  }

  Widget buildCaptureButton(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: takePhoto,
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOverlay() {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Align(
              alignment: const Alignment(0, -0.3),
              child: ClipOval(
                child: Container(
                  height: 320,
                  width: 217,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
