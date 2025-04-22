import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeTab = "Beranda".obs;

  void setActiveTab(String tab) {
    activeTab.value = tab;
  }
}
