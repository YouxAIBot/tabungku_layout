import 'package:flutter/material.dart';

class Transaksi {
  final String title;
  final String date;
  final int nominal;
  const Transaksi(
      this.title,
      this.date,
      this.nominal
      );
}

const daftarTransaksi = [
  Transaksi('Setoran awal', '01 Januari 2026', 20000),
  Transaksi('Setoran awal', '02 Januari 2026', 40000),
  Transaksi('Setoran awal', '03 Januari 2026', 50000),
  Transaksi('Setoran awal', '04 Januari 2026', 60000),
  Transaksi('Setoran awal', '05 Januari 2026', 70000),
  Transaksi('Setoran awal', '06 Januari 2026', 80000),
  Transaksi('Setoran awal', '07 Januari 2026', 90000),
];

String formatRupiah(int angka) {
  final teks = angka.toString();
  var hasil = '';
  for (var i = 0; i < teks.length; i++){
    if (i > 0 && (teks.length - i) % 3 == 0) hasil += '.';
    hasil += teks[i];
  }
  return 'Rp $hasil';
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabungku',
      theme: ThemeData(colorSchemeSeed:
        Colors.green,
        useMaterial3: true
      ),

      home: const RingkasanPage(),

    );
  }
}

class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Tabungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.savings, color: Colors.lightBlueAccent),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Tabungan Top Up Ml',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Saldo saat ini'),
                      Text(
                        formatRupiah(500000),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Target'),
                          Text(formatRupiah(100000000)),
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: TombolKategori(ikon: Icons.add_card, label: 'Menabung'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TombolKategori(ikon: Icons.payment, label: 'Tarik'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TombolKategori(ikon: Icons.history, label: 'Riwayat'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Daftar Transaksi'),
          ],
        ),
      ),
    );
  }
}

class TombolKategori extends StatelessWidget {
  final IconData ikon;
  final String label;
  const TombolKategori({super.key,
    required this.ikon,
    required this.label
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(ikon, color: Colors.blue),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}