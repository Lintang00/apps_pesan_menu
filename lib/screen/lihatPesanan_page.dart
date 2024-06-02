import 'package:apps_kasir/component.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class LihatPesananPage extends StatelessWidget {
  const LihatPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lihat Pesanan",
          style: PoppinsBold18(color: Color(0xff6C5500)),
        ),
        iconTheme: IconThemeData(color: Color(0xff6C5500)),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 1), // mengatur offset bayangan
                ),
              ],
            ),
            child: Center(
                child: ContainerBackground(
                    childMethod: Column(
              children: [
                ContainerAntrian(pilihan: 1, nama: "Agus"),
                ContainerAntrian(pilihan: 2, nama: "Gatotkaca 2"),
              ],
            ))),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                TitlePemisah("Makanan"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerPesanan(
                        menu: "Ayam Bakar",
                        jumlah: "2",
                        hargaSatuan: "Rp 12.000",
                        hargaTotal: "Rp 24.000",
                      ),
                      ContainerPesanan(
                        menu: "Ayam Bakar",
                        jumlah: "2",
                        hargaSatuan: "Rp 12.000",
                        hargaTotal: "Rp 24.000",
                      ),
                    ],
                  ),
                ),
                TitlePemisah("Minuman"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerPesanan(
                        menu: "Es Teh",
                        jumlah: "1",
                        hargaSatuan: "Rp 3.000",
                        hargaTotal: "Rp 3.000",
                      ),
                      ContainerPesanan(
                        menu: "Es Chocolatos",
                        jumlah: "2",
                        hargaSatuan: "Rp 5.000",
                        hargaTotal: "Rp 5.000",
                      ),
                    ],
                  ),
                ),
                TitlePemisah("Jajanan / Tambahan"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerPesanan(
                        menu: "Kerupuk",
                        jumlah: "2",
                        hargaSatuan: "Rp 3.000",
                        hargaTotal: "Rp 6.000",
                      ),
                      ContainerPesanan(
                        menu: "Pisang Coklat",
                        jumlah: "3",
                        hargaSatuan: "Rp 2.000",
                        hargaTotal: "Rp 6.000",
                      ),
                    ],
                  ),
                ),
                TitlePemisah("Permintaan"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerPesanan(
                        menu: "Nasi goreng telurnya dimasak 1/2 mateng",
                        jumlah: "2",
                        hargaSatuan: "Rp 13.000",
                        hargaTotal: "Rp 26.000",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, -1), // mengatur offset bayangan
                ),
              ],
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jumlah',
                    style: PoppinsMedium18(color: Color(0xff6C5500))),
                Text('Rp 90.000',
                    style: PoppinsMedium18(color: Color(0xff6C5500))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
