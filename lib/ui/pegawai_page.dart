import 'package:flutter/material.dart';
import 'pegawai_item.dart';
import '../model/pegawai.dart';
import 'pegawai_form.dart';
import '../widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(), // Memanggil sidebar jika sudah dibuat
      appBar: AppBar(
        title: const Text("Data Pegawai"), // Judul disesuaikan
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // Mengubah GestureDetector menjadi IconButton agar efek kliknya lebih terasa (opsional tapi disarankan)
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Membuat beberapa data dummy untuk ditampilkan di list
          PegawaiItem(
            pegawai: Pegawai(
              nip: "19900101",
              nama: "Maulana Riski",
              tanggal_lahir: "01 Januari 1990",
              nomor_telepon: "081234567890",
              email: "maulana@gmail.com",
              password: "123",
            ),
          ),
          PegawaiItem(
            pegawai: Pegawai(
              nip: "19920202",
              nama: "Alin Syafirah",
              tanggal_lahir: "02 Februari 1992",
              nomor_telepon: "089876543210",
              email: "alin@gmail.com",
              password: "123",
            ),
          ),
          PegawaiItem(
            pegawai: Pegawai(
              nip: "19880303",
              nama: "Nurul Annisa",
              tanggal_lahir: "03 Maret 1988",
              nomor_telepon: "081122334455",
              email: "nurul@gmail.com",
              password: "123",
            ),
          ),
        ],
      ),
    );
  }
}
