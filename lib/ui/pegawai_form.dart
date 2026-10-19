import 'package:flutter/material.dart';
import 'pegawai_detail.dart';
import '../model/pegawai.dart'; // Sesuaikan dengan path model kamu

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Menyiapkan controller untuk masing-masing field
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Tambahan padding agar lebih rapi
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNip(),
                const SizedBox(height: 15),
                _fieldNama(),
                const SizedBox(height: 15),
                _fieldTanggalLahir(),
                const SizedBox(height: 15),
                _fieldNomorTelepon(),
                const SizedBox(height: 15),
                _fieldEmail(),
                const SizedBox(height: 15),
                _fieldPassword(),
                const SizedBox(height: 30),
                _tombolSimpan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNip() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _nipCtrl,
    );
  }

  Widget _fieldNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaCtrl,
    );
  }

  Widget _fieldTanggalLahir() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
    );
  }

  Widget _fieldNomorTelepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
      keyboardType: TextInputType.phone, // Memunculkan keyboard angka
    );
  }

  Widget _fieldEmail() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress, // Memunculkan keyboard email (@)
    );
  }

  Widget _fieldPassword() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
      obscureText: true, // Menyembunyikan input (sensor password)
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // Memasukkan seluruh inputan ke dalam objek Pegawai
        Pegawai pegawai = Pegawai(
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telepon: _nomorTeleponCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );

        // Pindah ke halaman detail dan membawa data pegawai
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiDetail(pegawai: pegawai),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 45), // Tombol dibuat memanjang
      ),
      child: const Text("Simpan"),
    );
  }
}