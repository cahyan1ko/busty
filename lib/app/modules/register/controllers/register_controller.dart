import 'package:get/get.dart';
import '../../../data/providers/api_service.dart';

class RegisterController extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var noHp = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void register() async {
    isLoading.value = true;
    errorMessage.value = '';

    if (username.isEmpty || email.isEmpty || password.isEmpty || noHp.isEmpty) {
      errorMessage.value = 'Harap isi semua data';
      isLoading.value = false;
      return;
    }

    try {
      final result = await ApiService.register(
        username.value,
        email.value,
        noHp.value,
        password.value,
      );

      print(result);

      if (result['status'] == 'success') {
        // Jika status 'success', tampilkan dialog sukses dan arahkan ke halaman login
        Get.defaultDialog(
          title: "Sukses",
          middleText: "Akun kamu berhasil dibuat. Silakan login.",
          textConfirm: "OK",
          onConfirm: () {
            Get.back(); // Tutup dialog
            Get.offNamed('/login'); // Arahkan ke halaman login
          },
        );
      } else {
        // Jika status 'error', tampilkan pesan dari server
        errorMessage.value = result['message'] ?? 'Registrasi gagal';
      }
    } catch (e) {
      // Tangani error jika terjadi masalah saat request
      errorMessage.value = 'Terjadi kesalahan, coba lagi.';
    }

    isLoading.value = false;
  }
}
