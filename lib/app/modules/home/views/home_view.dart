import 'package:busty/app/modules/trip_history/views/trip_history_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../beranda/views/beranda_view.dart';
import '../../jadwal/views/jadwal_view.dart';
import '../../profile/views/profile_view.dart';
import '../../../widgets/tab_header.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Membungkus seluruh body dalam SafeArea
        child: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                color: const Color(0xFFf4f4f4),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Image.asset(
                            'assets/img/logo-ls-busty.png',
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.account_circle, size: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'Hi, User',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Icon(Icons.notifications, size: 24),
                                      SizedBox(height: 4),
                                      Text('Notifikasi',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () => Get.to(ProfileView()),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.person, size: 24),
                                        SizedBox(height: 4),
                                        Text('Profil',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Obx(() => TabHeader(
                              activeTab: controller.activeTab.value,
                              onTabChange: controller.setActiveTab,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                // Cek route dan tampilkan view yang sesuai
                return IndexedStack(
                  index: ["Riwayat", "Beranda", "Jadwal"]
                      .indexOf(controller.activeTab.value),
                  children: [
                    TripHistoryView(),
                    BerandaView(),
                    const JadwalView(),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
