import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pasien_item.dart';
import '../model/pasien.dart';
import 'pasien_form.dart';
import '../widget/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Pasien"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          // Contoh dummy data pasien
          PasienItem(pasien: Pasien(
            nomor_rm: "RM-001", 
            nama: "Budi Santoso", 
            tanggal_lahir: "1990-01-01", 
            nomor_telepon: "081234567890", 
            alamat: "Jakarta"
          )),
          PasienItem(pasien: Pasien(
            nomor_rm: "RM-002", 
            nama: "Siti Aminah", 
            tanggal_lahir: "1995-02-14", 
            nomor_telepon: "089876543210", 
            alamat: "Bandung"
          )),
          PasienItem(pasien: Pasien(
            nomor_rm: "RM-003", 
            nama: "Andi Saputra", 
            tanggal_lahir: "1988-11-20", 
            nomor_telepon: "085612349876", 
            alamat: "Surabaya"
          )),
          PasienItem(pasien: Pasien(
            nomor_rm: "RM-004", 
            nama: "Rina Kumala", 
            tanggal_lahir: "2000-05-15", 
            nomor_telepon: "082233445566", 
            alamat: "Semarang"
          )),
        ],
      ),
    );
  }
}