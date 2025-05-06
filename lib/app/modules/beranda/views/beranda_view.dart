import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  final BerandaController controller = Get.put(BerandaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Obx(() => Text(
                  'Halo, ${controller.namaSupir.value} 👋',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.directions_bus_filled,
                      color: Colors.red, size: 40),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Selamat bertugas! Cek jadwal perjalananmu hari ini.',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Jadwal Hari Ini',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Obx(() {
              final jadwal = controller.jadwalHariIni;
              return Card(
                color: Color(0xFFf4f4f4),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoRow("Tujuan", jadwal['tujuan']),
                      infoRow("Jam Berangkat", jadwal['jam']),
                      infoRow("Bus", jadwal['bus']),
                      infoRow("Status", jadwal['status']),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.snackbar(
                            "Konfirmasi",
                            "Siap berangkat!",
                            backgroundColor: Colors.green[100],
                            colorText: Colors.black,
                          );
                        },
                        icon: const Icon(Icons.check, color: Colors.white),
                        label: const Text(
                          "Konfirmasi Berangkat",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFE25353).withOpacity(0.6),
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
