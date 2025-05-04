// detection_controller.dart
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class DetectionController extends GetxController {
  late CameraController cameraController;
  var isCameraInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.first;

    cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    await cameraController.initialize();
    isCameraInitialized.value = true;
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
