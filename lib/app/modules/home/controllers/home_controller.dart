import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeTab = "Beranda".obs;
  final PageController pageController = PageController(initialPage: 0);

  void setActiveTab(String tab) {
    activeTab.value = tab;
    final index = ["Riwayat", "Beranda", "Jadwal"].indexOf(tab);
    if (index != -1) {
      pageController.jumpToPage(index);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
