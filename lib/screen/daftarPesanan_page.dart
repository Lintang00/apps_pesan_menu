import 'package:apps_kasir/style.dart';
import 'package:flutter/material.dart';

class DaftarPesananPage extends StatelessWidget {
  const DaftarPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Daftar Pesanan Page",
          style: PoppinsBold30(),
        ),
      ),
    );
  }
}