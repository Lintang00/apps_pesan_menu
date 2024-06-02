import 'package:apps_kasir/component.dart';
import 'package:apps_kasir/data/list_menu.dart';
// import 'package:apps_kasir/data/list_menu.dart';
import 'package:apps_kasir/style.dart';
import 'package:flutter/material.dart';

class BuatPesananPage extends StatefulWidget {
  const BuatPesananPage({super.key});

  @override
  State<BuatPesananPage> createState() => _BuatPesananPageState();
}

class _BuatPesananPageState extends State<BuatPesananPage> {
  List<Widget> ListContainersMakanan = [];
  List<Widget> ListContainersMinuman = [];
  List<Widget> ListContainersJajanan = [];

  int customIndex = 1;

  int jumlah = 0;

  // Fungsi untuk menghapus item dari list berdasarkan indeks
  void deleteItem(int index, int pilihan) {
    setState(() {
      if (pilihan == 1) {
        ListContainersMakanan.removeAt(index);
      } else if (pilihan == 2) {
        ListContainersMinuman.removeAt(index);
      } else {
        ListContainersJajanan.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Pesanan",
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
                TextFieldBuatPesan(pilihan: 1),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TextFieldBuatPesan(pilihan: 2),
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
                      Column(
                        children: [
                          ...ListContainersMakanan.asMap().entries.map((entry) {
                            // print("KEY : ${entry.key}");
                            return ContainerPesanMenu(
                              listMenu: ListMakanan.listMakanan,
                              onDelete: () {
                                // print("KEY_DELETE : ${entry.key}");
                                deleteItem(entry.key, 1);
                              },
                            );
                          })
                        ],
                      ),
                      const Divider(
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Jarak awal dari kiri
                        endIndent: 20, // Jarak akhir dari kanan
                        color: Color(0xffB7A35B),
                      ),
                      PrimaryButton(
                        onPressed: () {
                          setState(() {
                            ListContainersMakanan.add(ContainerPesanMenu(
                              listMenu: ListMakanan.listMakanan,
                              onDelete: () {
                                setState(() {
                                  // print(
                                  //     "DELETE WIDGET : ${ListContainersMakanan.indexOf(widget)}");
                                  // ListContainersMakanan.removeAt(
                                  //     ListContainersMakanan.indexOf(widget));
                                  ListContainersMakanan.removeAt(++customIndex);
                                  print("CUSTOM INDEX : ${customIndex}");
                                });
                              },
                              // index: containers.length,
                            ));
                          });
                        },
                        childPrimaryButton: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
                TitlePemisah("Minuman"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ...ListContainersMinuman.asMap()
                              .entries
                              .map((entry) => ContainerPesanMenu(
                                    listMenu: ListMinuman.listMinuman,
                                    onDelete: () {
                                      deleteItem(entry.key, 2);
                                    },
                                  ))
                        ],
                      ),
                      const Divider(
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Jarak awal dari kiri
                        endIndent: 20, // Jarak akhir dari kanan
                        color: Color(0xffB7A35B),
                      ),
                      PrimaryButton(
                        onPressed: () {
                          setState(() {
                            ListContainersMinuman.add(ContainerPesanMenu(
                              listMenu: ListMinuman.listMinuman,
                              onDelete: () {
                                setState(() {
                                  ListContainersMinuman.removeAt(
                                      ListContainersMinuman.indexOf(widget));
                                });
                              },
                              // index: containers.length,
                            ));
                          });
                        },
                        childPrimaryButton: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
                TitlePemisah("Jajanan / Tambahan"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ...ListContainersJajanan.asMap()
                              .entries
                              .map((entry) => ContainerPesanMenu(
                                    listMenu: ListJajanan.listJajanan,
                                    onDelete: () {
                                      deleteItem(entry.key, 3);
                                    },
                                  ))
                        ],
                      ),
                      const Divider(
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Jarak awal dari kiri
                        endIndent: 20, // Jarak akhir dari kanan
                        color: Color(0xffB7A35B),
                      ),
                      PrimaryButton(
                        onPressed: () {
                          setState(() {
                            ListContainersJajanan.add(ContainerPesanMenu(
                              listMenu: ListJajanan.listJajanan,
                              onDelete: () {
                                setState(() {
                                  ListContainersJajanan.removeAt(
                                      ListContainersJajanan.indexOf(widget));
                                });
                              },
                              // index: containers.length,
                            ));
                          });
                        },
                        childPrimaryButton: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
                TitlePemisah("Permintaan"),
                ContainerBackground(
                  childMethod: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ContainerPesanMenu(),
                      Divider(
                        thickness: 2, // Ketebalan garis
                        indent: 20, // Jarak awal dari kiri
                        endIndent: 20, // Jarak akhir dari kanan
                        color: Color(0xffB7A35B),
                      ),
                      PrimaryButton(
                        onPressed: () {},
                        childPrimaryButton: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01)
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
                Text('${ListContainersMakanan}',
                    style: PoppinsMedium18(color: Color(0xff6C5500))),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    "Reset",
                    style: PoppinsBold20(color: Color(0xff6C5500)),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    "Cetak",
                    style: PoppinsBold20(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
