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
      body: Padding(
        padding: const EdgeInsets.only(top: 0), // Menghilangkan jarak atas
        child: Center(
          child: Obx(() {
            if (!controller.isCameraInitialized.value) {
              return const CircularProgressIndicator();
            }

            return Container(
              width: MediaQuery.of(context)
                  .size
                  .width, // Otomatis mengikuti lebar layar perangkat
              height: 550, // Tentukan tinggi container
              child: AspectRatio(
                aspectRatio: controller.cameraController.value.aspectRatio,
                child: CameraPreview(controller.cameraController),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              // aksi scan
            },
            label: const Text('Scan'),
            icon: const Icon(Icons.camera),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'flip',
            onPressed: () {
              controller.flipCamera();
            },
            child: const Icon(Icons.flip_camera_android),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
