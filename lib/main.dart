import 'package:flutter/material.dart';

class Transaksi { //model data satu transaksi
  final String title;
  final String date;
  final int nominal;

  const Transaksi(this.title, this.date, this.nominal);
}

const daftarTransaksi = [ //data transaksi
  Transaksi('Top Up Saldo', '01 Januari 2026', 20000),
  Transaksi('Top Up Saldo', '02 Januari 2026', 40000),
  Transaksi('Top Up Saldo', '03 Januari 2026', 50000),
  Transaksi('Top Up Saldo', '04 Januari 2026', 60000),
  Transaksi('Top Up Saldo', '05 Januari 2026', 70000),
  Transaksi('Top Up Saldo', '06 Januari 2026', 80000),
  Transaksi('Top Up Saldo', '07 Januari 2026', 90000),
];

String formatRupiah(int angka) { //fungsi untuk mengubah angka menjadi format Rp ribuan
  final teks = angka.toString();
  var hasil = '';
  for (var i = 0; i < teks.length; i++) {
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
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const RingkasanPage(),
    );
  }
}

class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ringkasan Tabungan')), //judul halaman aplikasi
      body: Padding( //jarak sisi tepi layar
        padding: const EdgeInsets.all(16), //ukuran jarak sisi tepi layar
        child: Column( // susunan bagian atas dan bawah
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox( //bagian pertama berisikan kartu informasi tabungan, dan lebar
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column( //isi daru kartu atas ke bawah
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row( //ikon kiri
                        children: [
                          Container( //kotak latar ikon
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.savings,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded( //nama panjang agar tidak overflow
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
                      const Text('Saldo saat ini'), //label dan nominal
                      Text(
                        formatRupiah(500000),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row( //label target kiri, dan nominal kanan
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Target'),
                          Text(formatRupiah(100000000)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row( //bagian kedua tiga tombol kategori sama dan lebar
              children: [
                Expanded(
                  child: TombolKategori(
                    ikon: Icons.add_card,
                    label: 'Menabung',
                  ),
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

            const Text( //bagian 3 judul daftar transaksi
              'Transaksi Terakhir',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded( //listview mengisi sisa layar aplikasi
              child: ListView.builder( //membuat item sesuai data
                itemCount: daftarTransaksi.length,
                itemBuilder: (context, index) {
                  final item = daftarTransaksi[index];
                  final masuk = item.nominal >= 0;
                  final tanda = masuk ? '+' : '-';
                  return Card( //satu baris transaksi
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Icon(
                        masuk ? Icons.arrow_downward : Icons.arrow_upward,
                        color: masuk ? Colors.green : Colors.red,
                      ),
                      title: Text(item.title),
                      subtitle: Text(item.date),
                      trailing: Text(
                        '$tanda ${formatRupiah(item.nominal.abs())}',
                        style: TextStyle(
                          color: masuk ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TombolKategori extends StatelessWidget { //widget tombol ikon atas dan label bawah
  final IconData ikon;
  final String label;

  const TombolKategori({super.key, required this.ikon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container( //kotak berwarna dengan sudut lengkung
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column( //ikon dan teks rata tengah
        children: [
          Icon(ikon, color: Colors.blue),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}
