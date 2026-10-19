import 'package:flutter/material.dart';
import 'pasien_detail.dart';
import 'package:klinik_app/model/pasien.dart'; // Pastikan path ini sesuai dengan struktur projectmu

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);

  @override
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk setiap field data Pasien
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Menambahkan padding agar lebih rapi
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRm(),
              const SizedBox(height: 10),
              _fieldNama(),
              const SizedBox(height: 10),
              _fieldTanggalLahir(),
              const SizedBox(height: 10),
              _fieldNomorTelepon(),
              const SizedBox(height: 10),
              _fieldAlamat(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNomorRm() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Rekam Medis"),
      controller: _nomorRmCtrl,
    );
  }

  _fieldNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaCtrl,
    );
  }

  _fieldTanggalLahir() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir (YYYY-MM-DD)"), // Hint format tanggal
      controller: _tanggalLahirCtrl,
    );
  }

  _fieldNomorTelepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
      keyboardType: TextInputType.phone, // Menampilkan keyboard angka
    );
  }

  _fieldAlamat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatCtrl,
      maxLines: 3, // Agar field alamat lebih luas
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // Membuat objek Pasien baru dari inputan
        Pasien pasienBaru = Pasien(
          nomor_rm: _nomorRmCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telepon: _nomorTeleponCtrl.text,
          alamat: _alamatCtrl.text,
        );

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: pasienBaru)));
      },
      child: const Text("Simpan"),
    );
  }
  
  @override
  void dispose() {
    // Membersihkan controller ketika widget dihancurkan untuk menghindari memory leak
    _nomorRmCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _nomorTeleponCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }
}