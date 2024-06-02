import 'package:apps_kasir/style.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'lib/assets/images/cashier.png', // Ganti dengan path dan nama file gambar ikon Anda
              width: 200,
              height: 200,
            ),
          ),
          Text("Kasir Lintang", style: PoppinsBold40(color: Color(0xff6C5500))),
          // Text("Kasir Lintang", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
