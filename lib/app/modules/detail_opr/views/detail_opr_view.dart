import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_opr_controller.dart';

class DetailOprView extends GetView<DetailOprController> {
  const DetailOprView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailOprView'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Stack(
        children: [
          // Konten yang bisa di-scroll
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Tambahkan konten panjang di sini agar bisa di-scroll
                  for (var i = 0; i < 20; i++)
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text('Item $i'),
                        subtitle: Text('Detail untuk item $i'),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Button dengan posisi tetap
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                // Tindakan ketika tombol ditekan
              },
              child: const Text(
                'Tambah',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
