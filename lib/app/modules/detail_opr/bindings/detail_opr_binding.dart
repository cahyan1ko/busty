import 'package:get/get.dart';

import '../controllers/detail_opr_controller.dart';

class DetailOprBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOprController>(
      () => DetailOprController(),
    );
  }
}

