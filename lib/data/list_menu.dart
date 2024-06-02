class ListMakanan {
  static List<Map<String, dynamic>> listMakanan = [
    {'Menu': 'Tidak pesan makanan', 'Harga': 0},
    {'Menu': 'Nasi Ayam Katsu', 'Harga': 15000},
    {'Menu': 'Nasi Ayam Geprek', 'Harga': 13000},
    {'Menu': 'Nasi Ayam Bakar', 'Harga': 13000},
    {'Menu': 'Nasi Padang', 'Harga': 17000},
    {'Menu': 'Nasi Goreng Bakso', 'Harga': 12000},
    {'Menu': 'Nasi Goreng Ayam', 'Harga': 12000},
    {'Menu': 'Nasi Goreng Telur', 'Harga': 12000},
    {'Menu': 'Nasi Ayam Bulgogi', 'Harga': 12000},
    {'Menu': 'Nasi Ayam Lada Hitam', 'Harga': 12000},
    {'Menu': 'Nasi Ayam Lada Ungu', 'Harga': 12000},
  ];

  static void addMenu(String valueMenu, int valueHarga) {
    listMakanan.add({
      'Menu': valueMenu,
      'Harga': valueHarga,
    });
  }
}

class ListMinuman {
  static List<Map<String, dynamic>> listMinuman = [
    {'Menu': 'Tidak pesan minuman', 'Harga': 0},
    {'Menu': 'Le Mineral Dingin', 'Harga': 5000},
    {'Menu': 'Le Mineral Biasa', 'Harga': 5000},
    {'Menu': 'Aqua', 'Harga': 5000},
    {'Menu': 'Es Teh', 'Harga': 3000},
    {'Menu': 'Teh Hangat', 'Harga': 3000},
    {'Menu': 'Es Jeruk', 'Harga': 4000},
    {'Menu': 'Jeruk Hangat', 'Harga': 4000},
    {'Menu': 'Chocolatos Coklat', 'Harga': 5000},
  ];

  static void addMenu(String valueMenu, int valueHarga) {
    listMinuman.add({
      'Menu': valueMenu,
      'Harga': valueHarga,
    });
  }
}

class ListJajanan {
  static List<Map<String, dynamic>> listJajanan = [
    {'Menu': 'Tidak pesan jajanan', 'Harga': 0},
    {'Menu': 'Piscok', 'Harga': 5000},
    {'Menu': 'Kue', 'Harga': 5000},
    {'Menu': 'Kerupuk', 'Harga': 5000},
    {'Menu': 'Aoka', 'Harga': 3000},
    {'Menu': 'Momotaro', 'Harga': 3000},
  ];

  static void addMenu(String valueMenu, int valueHarga) {
    listJajanan.add({
      'Menu': valueMenu,
      'Harga': valueHarga,
    });
  }
}
