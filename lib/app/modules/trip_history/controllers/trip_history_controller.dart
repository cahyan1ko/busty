import 'package:get/get.dart';

class Trip {
  final String route;
  final String date;
  final String status;

  Trip(
      {required this.route,
      required this.date,
      required this.status});
}

class TripHistoryController extends GetxController {
  var isLoading = true.obs;
  var tripHistory = <Trip>[].obs;
  var selectedStatus = 'Semua'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTripHistory();
  }

  void fetchTripHistory() async {
    // Simulasi loading
    await Future.delayed(const Duration(seconds: 2));
    tripHistory.value = [
      Trip(route: "Jakarta - Bandung", date: "2025-05-05", status: "Selesai"),
      Trip(route: "Bandung - Surabaya", date: "2025-05-04", status: "Dalam Perjalanan"),
      Trip(route: "Surabaya - Bali", date: "2025-05-01", status: "Selesai"),
    ];
    isLoading.value = false;
  }

  List<Trip> get filteredTrips {
    if (selectedStatus.value == 'Semua') {
      return tripHistory;
    } else {
      return tripHistory
          .where((trip) => trip.status == selectedStatus.value)
          .toList();
    }
  }

  int get total => tripHistory.length;
  int get selesai =>
      tripHistory.where((trip) => trip.status == 'Selesai').length;
  int get dalamPerjalanan =>
      tripHistory.where((trip) => trip.status == 'Dalam Perjalanan').length;
}
