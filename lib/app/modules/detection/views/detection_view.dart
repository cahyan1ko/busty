// detection_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

import '../controllers/detection_controller.dart';

class DetectionView extends GetView<DetectionController> {
  const DetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetectionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (!controller.isCameraInitialized.value) {
            return const CircularProgressIndicator();
          }

          return AspectRatio(
            aspectRatio: controller.cameraController.value.aspectRatio,
            child: CameraPreview(controller.cameraController),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Aksi: misalnya ambil foto, atau pindah layar
        },
        label: const Text('Scan'),
        icon: const Icon(Icons.camera),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
