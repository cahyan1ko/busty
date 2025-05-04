import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalView extends StatefulWidget {
  const JadwalView({super.key});

  @override
  _JadwalViewState createState() => _JadwalViewState();
}

class _JadwalViewState extends State<JadwalView> {
  int? selectedCardIndex;

  final RxString activeTab = 'Jadwal'.obs;
  void handleTabChange(String tab) {
    activeTab.value = tab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Maret 2025',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(10, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCardIndex =
                                      selectedCardIndex == index ? null : index;
                                });
                              },
                              child: Container(
                                width: 82,
                                height: 114,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: AssetImage('img/sampletujuan.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 8,
                                      bottom: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          '${index + 1}', // Tanggal
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: Container(
                          width: 350,
                          height: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (selectedCardIndex != null) ...[
                        const SizedBox(height: 8),
                        const Text(
                          'Detail Keberangkatan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140, child: Text('Nomor Plat')),
                                    Text(': AB 1234 CD'),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140, child: Text('Nomor Bus')),
                                    Text(': 002'),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140, child: Text('Status Bus')),
                                    Text(': Berangkat'),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140,
                                        child: Text('Penumpang Awal')),
                                    Text(': 30'),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140,
                                        child: Text('Jam Keberangkatan')),
                                    Text(': 10:30 AM'),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140, child: Text('Pengemudi')),
                                    Text(': Budi Santoso'),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                        width: 140, child: Text('Catatan')),
                                    Expanded(
                                        child: Text(': Bus berjalan lancar')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Membuat sudut card melengkung
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/detail-opr');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tegal - Jakarta',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          'klik untuk detail',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Header untuk Terminal dan Estimasi
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'Terminal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Estimasi',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      // Jadwal Keberangkatan
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Tegal'),
                                          Text('10:30 AM'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Pemalang'),
                                          Text('11:15 AM'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Pekalongan'),
                                          Text('12:00 PM'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Cirebon'),
                                          Text('1:45 PM'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Bekasi'),
                                          Text('4:30 PM'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Jakarta'),
                                          Text('5:15 PM'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16), // Atur sesuai kebutuhan
        child: SizedBox(
          width: 150,
          height: 45,
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/detection');
            },
            backgroundColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Mulai Perjalanan!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
