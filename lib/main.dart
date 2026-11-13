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
          Text('Tabungan'),
          Text('Kategori'),
          Text('Daftar Transaksi'),
          ],
        ),
      ),
    );
  }
}