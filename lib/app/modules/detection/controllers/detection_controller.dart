import 'package:camera/camera.dart';
import 'package:get/get.dart';

class DetectionController extends GetxController {
  late CameraController cameraController;
  var isCameraInitialized = false.obs;

  List<CameraDescription> cameras = [];
  int selectedCameraIndex = 0;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    await _initCameraController(cameras[selectedCameraIndex]);
  }

  Future<void> _initCameraController(
      CameraDescription cameraDescription) async {
    if (cameraController.value.isInitialized) {
      await cameraController.dispose();
    }

    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );

    try {
      await cameraController.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  // ✅ Tambahkan fungsi ini
  Future<void> flipCamera() async {
    if (cameras.length < 2) return;
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
    isCameraInitialized.value = false;
    await _initCameraController(cameras[selectedCameraIndex]);
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
