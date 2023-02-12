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
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Container(
        alignment: Alignment.center,
        child: Transform.scale(
          scale: 1.25,
          child: CameraPreview(
            controller,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                buildOverlay(),
                buildCaptureButton(),
                buildBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildBackButton() {
    return Positioned(
      left: 35,
      top: 45,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
        onPressed: closePhoto,
      ),
    );
  }

  Positioned buildCaptureButton() {
    return Positioned(
      bottom: 30,
      child: GestureDetector(
        onTap: takePhoto,
        child: Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white60,
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
              alignment: Alignment(0, -0.3),
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
