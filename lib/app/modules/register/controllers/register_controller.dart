import 'package:get/get.dart';

class RegisterController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void register() async {
    isLoading.value = true;
    errorMessage.value = '';

    await Future.delayed(Duration(seconds: 2)); // Simulasi API call

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      errorMessage.value = 'Harap isi semua data';
    } else {
      Get.snackbar('Sukses', 'Registrasi berhasil! Silakan login.');
      Get.back();
    }

    isLoading.value = false;
  }
}
