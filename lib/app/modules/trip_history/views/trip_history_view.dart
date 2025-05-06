import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trip_history_controller.dart';

class TripHistoryView extends StatelessWidget {
  final TripHistoryController controller = Get.put(TripHistoryController());

  Color getStatusColor(String status) {
    switch (status) {
      case "Selesai":
        return Colors.green;
      case "Dalam Perjalanan":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Icon getStatusIcon(String status) {
    switch (status) {
      case "Selesai":
        return const Icon(Icons.check_circle, color: Colors.green);
      case "Dalam Perjalanan":
        return const Icon(Icons.directions_car, color: Colors.orange);
      default:
        return const Icon(Icons.info_outline, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistik Ringkas (dibungkus dengan Card untuk tampilan yang lebih rapi)
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 0,
                color: Color(0xFFf4f4f4),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Statistik Perjalanan",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text("Total"),
                              Text("${controller.total}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Selesai"),
                              Text("${controller.selesai}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Dalam Perjalanan"),
                              Text("${controller.dalamPerjalanan}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Filter Dropdown
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    const Text("Filter Status:"),
                    const SizedBox(width: 10),
                    Obx(() => DropdownButton<String>(
                          value: controller.selectedStatus.value,
                          items: ['Semua', 'Selesai', 'Dalam Perjalanan']
                              .map((status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedStatus.value = value;
                            }
                          },
                        )),
                  ],
                ),
              ),

              // Daftar Perjalanan
              Expanded(
                child: Obx(() {
                  final trips = controller.filteredTrips;
                  if (trips.isEmpty) {
                    return const Center(child: Text("Tidak ada perjalanan."));
                  }
                  return ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return Card(
                        color: Color(0xFFf4f4f4),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: ExpansionTile(
                          leading: getStatusIcon(trip.status),
                          title: Text(
                            trip.route,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(trip.date),
                          trailing: Text(
                            trip.status,
                            style: TextStyle(
                              color: getStatusColor(trip.status),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Menambahkan informasi estimasi waktu tiba
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time, size: 18),
                                      const SizedBox(width: 8),
                                      Text("Estimasi Tiba: ${trip.date}"),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  // Informasi lokasi tujuan
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, size: 18),
                                      const SizedBox(width: 8),
                                      Text(
                                          "Lokasi Tujuan: ${trip.route.split(' - ')[1]}"),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.map, size: 18),
                                      const SizedBox(width: 8),
                                      Text("Jarak: 120 km"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          );
        }
      }),
    );
  }
}
