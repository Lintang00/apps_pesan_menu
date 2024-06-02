import 'package:apps_kasir/data/list_menu.dart';
import 'package:apps_kasir/screen/lihatPesanan_page.dart';
import 'package:apps_kasir/style.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String formatCurrency(int price) {
  final formatter = NumberFormat('#,###');
  return 'Rp ${formatter.format(price)}';
}

Widget ContainerAntrian({int pilihan = 1, String? nama}) {
  String text;
  if (pilihan == 1) {
    text = "Nama Pemesan         : ";
  } else if (pilihan == 2) {
    text = "Ruang Pemesan         : ";
  } else {
    text = "Saat Pesanan dibuat  : ";
  }

  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Text(
          "${text}",
          style: PoppinsRegular14(color: Color(0xff6C5500)),
        ),
        Text(
          "$nama",
          style: PoppinsMedium14(color: Color(0xff6C5500)),
        ),
      ],
    ),
  );
}

// ignore: must_be_immutable
class TextFieldBuatPesan extends StatefulWidget {
  int pilihan;

  TextFieldBuatPesan({
    Key? key,
    required this.pilihan,
  }) : super(key: key);

  @override
  State<TextFieldBuatPesan> createState() => _TextFieldBuatPesanState();
}

class _TextFieldBuatPesanState extends State<TextFieldBuatPesan> {
  TextEditingController _inputBuatPesan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String namaPemesan;
    String text;
    if (widget.pilihan == 1) {
      text = "Nama Pemesan         : ";
    } else {
      text = "Ruang Pemesan         : ";
    }

    return TextField(
      keyboardType: TextInputType.text,
      controller: _inputBuatPesan,
      style: PoppinsMedium14(color: Color(0xff6C5500)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        prefixText: "${text}",
        prefixStyle: PoppinsMedium14(color: Color(0xff6C5500)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        setState(() {
          // Do not modify the controller's text directly, use the value parameter
          // to update the state instead.
        });
      },
    );
  }
}

// ignore: must_be_immutable
class ContainerPesanan extends StatelessWidget {
  String menu, jumlah, hargaSatuan, hargaTotal;

  ContainerPesanan({
    Key? key,
    required this.menu,
    required this.jumlah,
    required this.hargaSatuan,
    required this.hargaTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              "${menu}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05416,
            child: Text(
              "${jumlah}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.19,
            child: Text(
              "${hargaSatuan}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.16,
            child: Text(
              "${hargaTotal}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerPesanMenu extends StatefulWidget {
  final VoidCallback onDelete;
  final List<Map<String, dynamic>> listMenu;
  // final int index;

  ContainerPesanMenu({
    Key? key,
    required this.onDelete,
    required this.listMenu,
    // required this.index,
  }) : super(key: key);

  @override
  State<ContainerPesanMenu> createState() => _ContainerPesanMenuState();
}

class _ContainerPesanMenuState extends State<ContainerPesanMenu> {
  TextEditingController _inputJumlah = TextEditingController();
  int _jumlah = 1;
  int hargaItem = 0;
  // int hargaTotal = 0;

  // int HargaTotal() {
  //   return hargaTotal = hargaItem * _jumlah;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.13,
            child: IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Color(0xff6C5500),
              ),
              onPressed: widget.onDelete,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.33,
            child: PilihanMenu(
              onHargaChanged: (harga) {
                setState(() {
                  hargaItem = harga;
                });
              },
              listMenu: widget.listMenu,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.055,
              child: TextField(
                keyboardType: TextInputType.number,
                style: PoppinsMedium14(color: Color(0xff6C5500)),
                controller: _inputJumlah,
                onChanged: (value) {
                  setState(() {
                    _jumlah = int.tryParse(value) ?? 1;
                  });
                },
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.19,
            child: Text(
              "${formatCurrency(hargaItem)}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.19,
            child: Text(
              "${formatCurrency(hargaItem * _jumlah)}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerPesanMenu2 extends StatefulWidget {
  final VoidCallback onDelete;
  final List<Map<String, dynamic>> listMenu;
  // final int index;

  ContainerPesanMenu2({
    Key? key,
    required this.onDelete,
    required this.listMenu,
    // required this.index,
  }) : super(key: key);

  @override
  _ContainerPesanMenu2State createState() => _ContainerPesanMenu2State();
}

class _ContainerPesanMenu2State extends State<ContainerPesanMenu> {
  TextEditingController _inputJumlah = TextEditingController();
  int _jumlah = 1;
  int hargaItem = 0;
  // int hargaTotal = 0;

  // int HargaTotal() {
  //   return hargaTotal = hargaItem * _jumlah;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.13,
            child: IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Color(0xff6C5500),
              ),
              onPressed: widget.onDelete,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.33,
            child: TextField(),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.055,
              child: TextField(
                keyboardType: TextInputType.number,
                style: PoppinsMedium14(color: Color(0xff6C5500)),
                controller: _inputJumlah,
                onChanged: (value) {
                  setState(() {
                    _jumlah = int.tryParse(value) ?? 1;
                  });
                },
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.19,
            child: Text(
              "${formatCurrency(hargaItem)}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.19,
            child: Text(
              "${formatCurrency(hargaItem * _jumlah)}",
              style: PoppinsRegular14(color: Color(0xff6C5500)),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ContainerBackground({Widget? childMethod}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      // color: Colors.black,
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(8),
    ),
    child: childMethod,
  );
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget childPrimaryButton;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.childPrimaryButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber, // Warna latar belakang
          onPrimary: Colors.white, // Warna teks
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Radius border
          ),
        ),
        onPressed: onPressed,
        child: childPrimaryButton);
    ;
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SecondaryButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Warna latar belakang
        onPrimary: Colors.white, // Warna teks
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Radius border
          side: BorderSide(
            color: Colors.amber, // Warna border
            width: 2.0, // Ketebalan border
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LihatPesananPage(),
          ),
        );
      },
      child: Text(
        'Lihat Pesanan',
        style: PoppinsMedium16(color: Color(0xff6C5500)),
      ),
    );
  }
}

Widget TitlePemisah(String title) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "$title",
        style: PoppinsMedium16(color: Color(0xff6C5500)),
      ),
    ),
  );
}

class PilihanMenu extends StatefulWidget {
  final Function(int) onHargaChanged;
  final List<Map<String, dynamic>> listMenu;

  const PilihanMenu({
    Key? key,
    required this.onHargaChanged,
    required this.listMenu,
  }) : super(key: key);

  @override
  State<PilihanMenu> createState() => _PilihanMenuState();
}

class _PilihanMenuState extends State<PilihanMenu> {
  List<Map<String, dynamic>> listMakanan = ListMakanan.listMakanan;
  List<Map<String, dynamic>> listMinuman = ListMinuman.listMinuman;
  List<Map<String, dynamic>> listJajanan = ListJajanan.listJajanan;
  TextEditingController _inputJumlah = TextEditingController();
  String selectedMenu = "Pilih menu";

  int getHarga(String menu) {
    return widget.listMenu.firstWhere((map) => map['Menu'] == menu)['Harga']
        as int;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownSearchTextStyle: PoppinsMedium14(color: Color(0xff6C5500)),
      dropdownSearchTextAlignVertical: TextAlignVertical.center,
      // popupProps: PopupProps,
      dropdownSearchDecoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none),
      items: widget.listMenu.map((menu) => menu['Menu'].toString()).toList(),
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            selectedMenu = value;
            int harga = getHarga(selectedMenu);
            widget.onHargaChanged(harga);
          });
        }
      },
      selectedItem: "Pilih menu",
    );
  }
}

// void Objek(BuildContext context) {
//   showModalBottomSheet<void>(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(20.0),
//       ),
//     ),
//     context: context,
//     isScrollControlled: true, // allow scrolling
//     builder: (BuildContext context) {
//       return Container(
//         height: MediaQuery.of(context).size.height *
//             0.45, // adjust the height as needed
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: Icon(Icons.close),
//                   ),
//                 ),
//               ),
//               TitlePemisah("Makanan"),
//               ContainerBackground(
//                 childMethod: DropdownSearch<String>(
//                   // popupProps: PopupProps,
//                   dropdownSearchDecoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8))),
//                   items: listMakanan
//                       .map((menu) => menu['Menu'].toString())
//                       .toList(),
//                   onChanged: (String? value) {
//                     if (value != null) {
//                       setState(() {
//                         selectedMenu = value;
//                       });
//                     }
//                   },
//                   selectedItem: "Pilih menu",
//                 ),
//               ),
//               TitlePemisah("Jumlah"),
//               ContainerBackground(
//                 childMethod: TextField(
//                   controller: _inputJumlah,
//                   keyboardType: TextInputType.number,
//                   style: PoppinsMedium14(color: Color(0xff6C5500)),
//                   decoration: InputDecoration(
//                     hintText: "Masukan Jumlah",
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//                     hoverColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.amber, // Warna latar belakang
//                     onPrimary: Colors.white, // Warna teks
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0), // Radius border
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       height: MediaQuery.of(context).size.width * 0.1,
//                       child: Center(
//                           child: Text(
//                         "Tambah",
//                         style: PoppinsBold18(color: Colors.white),
//                       ))))
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
