import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;
  var isLoading = false.obs;
  var message = ''.obs;

  void sendResetLink() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulasi proses
    message.value = 'Link reset telah dikirim ke email: ${email.value}';
    isLoading.value = false;
  }
}
