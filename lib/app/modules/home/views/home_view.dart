import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../beranda/views/beranda_view.dart';
import '../../tracking/views/tracking_view.dart';
import '../../jadwal/views/jadwal_view.dart';
import '../../profile/views/profile_view.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          'img/logo-ls-busty.png',
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
                                            fontSize: 10, color: Colors.grey)),
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
                      Obx(() => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 22),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: ["Tracking", "Beranda", "Jadwal"]
                                  .map((tab) => Expanded(
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.setActiveTab(tab),
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            decoration: BoxDecoration(
                                              color:
                                                  controller.activeTab.value ==
                                                          tab
                                                      ? const Color(0xFFE25353)
                                                          .withOpacity(0.6)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              tab,
                                              style: TextStyle(
                                                  fontSize: controller.activeTab
                                                              .value ==
                                                          tab
                                                      ? 16
                                                      : 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: controller.activeTab
                                                              .value ==
                                                          tab
                                                      ? Colors.black
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return IndexedStack(
                index: ["Tracking", "Beranda", "Jadwal"]
                    .indexOf(controller.activeTab.value),
                children: const [
                  TrackingView(),
                  BerandaView(),
                  JadwalView(),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
