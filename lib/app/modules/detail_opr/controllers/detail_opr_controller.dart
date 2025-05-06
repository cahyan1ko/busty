import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOprController extends GetxController {
  var jurusan = 'Tegal - Brebes';
  var perjalananStatus = 'Sedang Berjalan';
  var jumlahSaatIni = 0.obs;
  var terminalTerdekat = 'Terminal Brebes';
  var checkpoints = <Map<String, dynamic>>[
    {
      'terminal': 'Terminal Tegal',
      'estimasi': '08:00',
      'status': 'sudah',
      'naik': 3,
      'turun': 0,
    },
    {
      'terminal': 'Terminal Brebes',
      'estimasi': '08:45',
      'status': 'sedang',
      'naik': 2,
      'turun': 1,
    },
    {
      'terminal': 'Terminal Slawi',
      'estimasi': '09:30',
      'status': 'belum',
      'naik': 0,
      'turun': 0,
    },
  ].obs;

  void openCheckpointForm() {
    final TextEditingController terminalController = TextEditingController();
    final TextEditingController estimasiController = TextEditingController();
    final TextEditingController statusController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text('Tambah Checkpoint'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: terminalController,
                decoration: const InputDecoration(labelText: 'Nama Terminal'),
              ),
              TextField(
                controller: estimasiController,
                decoration:
                    const InputDecoration(labelText: 'Estimasi Kedatangan'),
              ),
              TextField(
                controller: statusController,
                decoration: const InputDecoration(
                  labelText: 'Status (sudah/sedang/belum)',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              // Tambahkan checkpoint baru
              checkpoints.add({
                'terminal': terminalController.text,
                'estimasi': estimasiController.text,
                'status': statusController.text.toLowerCase(),
                'naik': 0,
                'turun': 0,
              });
              Get.back(); // Tutup dialog
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
