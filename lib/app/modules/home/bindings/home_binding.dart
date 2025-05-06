import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../trip_history/controllers/trip_history_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TripHistoryController>(() => TripHistoryController());
  }
}
