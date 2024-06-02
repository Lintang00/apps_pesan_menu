import 'package:apps_kasir/component.dart';
import 'package:apps_kasir/screen/buatPesanan_page%20copy.dart';
// import 'package:apps_kasir/screen/lihatPesanan_page.dart';
import 'package:apps_kasir/style.dart';
import 'package:flutter/material.dart';

import 'buatPesanan_page.dart';
import 'daftarPesanan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hai, Alif Lintang Prasaja",
                    style: PoppinsMedium14(color: Color(0xff6C5500))),
                Text("Selamat Datang",
                    style: PoppinsRegular14(color: Color(0xff6C5500))),
              ],
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
                  // Container(
                  //   color: Colors.grey.shade200,
                  //   height: MediaQuery.of(context).size.height * 0.51,
                  // ),
                  Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //       color: Colors.amber,
                      //       borderRadius: BorderRadius.circular(10)),
                      //   height: 200,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.45,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("lib/assets/images/create.png"),
                                  Text(
                                    "Buat Pesanan",
                                    style: PoppinsMedium18(
                                        color: Color(0xff6C5500)),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BuatPesananPageCopy(),
                                  ));
                            },
                          ),
                          InkWell(
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.45,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("lib/assets/images/list.png"),
                                  Text(
                                    "Daftar Pesanan",
                                    style: PoppinsMedium18(
                                        color: Color(0xff6C5500)),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DaftarPesananPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Antrian Pesanan Sekarang",
                    style: PoppinsMedium16(color: Color(0xff6C5500)),
                  ),
                ),
              ),
              ContainerBackground(
                childMethod: Column(
                  children: [
                    ContainerAntrian(pilihan: 1, nama: "Rudi"),
                    ContainerAntrian(pilihan: 2, nama: "Gatotkaca 3"),
                    ContainerAntrian(pilihan: 3, nama: "12 : 23"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SecondaryButton(
                            onPressed: () {}, buttonText: "buttonText"),
                        PrimaryButton(
                            onPressed: () {},
                            childPrimaryButton: Text(
                              "Pesanan Selesai",
                              style: PoppinsMedium16(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
