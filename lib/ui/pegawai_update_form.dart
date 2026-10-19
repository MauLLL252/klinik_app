import 'package:flutter/material.dart';
import '../model/pegawai.dart'; // Sesuaikan dengan path kamu
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  
  @override
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Controller untuk masing-masing field
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengisi nilai awal TextField dengan data pegawai yang dipilih
    setState(() {
      _nipCtrl.text = widget.pegawai.nip;
      _namaCtrl.text = widget.pegawai.nama;
      _tanggalLahirCtrl.text = widget.pegawai.tanggal_lahir;
      _nomorTeleponCtrl.text = widget.pegawai.nomor_telepon;
      _emailCtrl.text = widget.pegawai.email;
      _passwordCtrl.text = widget.pegawai.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Pegawai"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding agar lebih rapi
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
      keyboardType: TextInputType.phone,
    );
  }

  Widget _fieldEmail() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _fieldPassword() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
      obscureText: true, // Sensor untuk password
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // Membuat objek pegawai baru dengan data yang sudah diubah
        Pegawai pegawaiBaru = Pegawai(
          id: widget.pegawai.id, // ID tetap mengikuti data lama
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telepon: _nomorTeleponCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );

        Navigator.pop(context); // Tutup halaman update form
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PegawaiDetail(pegawai: pegawaiBaru)),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 45),
      ),
      child: const Text("Simpan Perubahan"),
    );
  }
}