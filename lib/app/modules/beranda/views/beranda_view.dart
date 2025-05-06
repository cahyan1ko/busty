import 'package:flutter/material.dart';

class BerandaView extends StatelessWidget {
  const BerandaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Mengubah warna background menjadi putih
      child: Center(
        child: Text("Beranda Screen"),
      ),
    );
  }
}
