import 'package:busty/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    errorMessage.value = '';

    // Cek dulu apakah ada yang kosong
    if (username.value.isEmpty || password.value.isEmpty) {
      isLoading.value = false;
      errorMessage.value = 'Username dan password wajib diisi';
      return;
    }

    await Future.delayed(Duration(seconds: 2));

    // Cek login
    if (username.value == 'admin' && password.value == 'admin') {
      isLoading.value = false;
      Get.snackbar('Login Sukses', 'Selamat datang, ${username.value}');
      Get.offAllNamed('/home');
    } else {
      isLoading.value = false;
      errorMessage.value = 'Username atau password salah';
    }
  }
}
