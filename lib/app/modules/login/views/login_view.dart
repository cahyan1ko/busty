import 'package:busty/app/modules/home/views/home_view.dart';
import 'package:busty/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../routes/app_pages.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/img/logo-busty.png', width: 100),
                        const SizedBox(height: 16),
                        const Text(
                          'Please login to continue',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Image.asset('assets/img/bro.png', width: 200),
                        const SizedBox(height: 2),
                        Obx(() => controller.errorMessage.isNotEmpty
                            ? Text(
                                controller.errorMessage.value,
                                style: TextStyle(color: Colors.red),
                              )
                            : SizedBox.shrink()),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) =>
                              controller.username.value = value,
                          decoration: _inputDecoration('Email'),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) =>
                              controller.password.value = value,
                          obscureText: true,
                          decoration: _inputDecoration('Password'),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.FORGOT_PASSWORD);
                              },
                              child: const Text(
                                'Lupa Password?',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        Obx(() => ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE25353),
                                foregroundColor: Colors.white,
                                minimumSize: Size(double.infinity, 50),
                                padding: EdgeInsets.symmetric(vertical: 20),
                                textStyle: TextStyle(fontSize: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: controller.isLoading.value
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Text('Login'),
                            )),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.REGISTER);
                              },
                              child: Text(
                                  "Don't have an account yet? Sign up here."),
                            ),
                          ],
                        ),

                        // style: TextStyle(fontSize: 16, color: Colors.grey)),
                        // const SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Iconify(Logos.google_icon, size: 30),
                        //     SizedBox(width: 30),
                        //     Iconify(Logos.facebook, size: 30),
                        //   ],
                        // )
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.shade50,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }
}
