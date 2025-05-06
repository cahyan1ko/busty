import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class TabHeader extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const TabHeader({
    Key? key,
    required this.activeTab,
    required this.onTabChange,
  }) : super(key: key);

  String _getRouteFromTab(String tab) {
    switch (tab) {
      case 'Riwayat':
        return Routes.TRIP_HISTORY;
      case 'Beranda':
        return Routes.BERANDA;
      case 'Jadwal':
        return Routes.JADWAL;
      default:
        return Routes.BERANDA;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ["Riwayat", "Beranda", "Jadwal"].map((tab) {
          return Flexible(
            child: GestureDetector(
              onTap: () {
                // Pindah ke tab yang diinginkan
                onTabChange(tab);
                // Pindah route ke tab tersebut
                Get.toNamed(_getRouteFromTab(tab));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: activeTab == tab
                      ? const Color(0xFFE25353).withOpacity(0.6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  tab,
                  style: TextStyle(
                    fontSize: activeTab == tab ? 16 : 14,
                    fontWeight: FontWeight.bold,
                    color: activeTab == tab ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
