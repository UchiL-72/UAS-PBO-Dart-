import '../models/item.dart';

class Manager {final List<Item> items = [];

void tambah(Item item) {
  items.add(item);
}

void tampilkamSemua() {
  if (items.isEmpty) {
    print('Belum ada data.');
    return;
  }
  for (var item in items) {
    item.tampilkanInfo();
  }
}

void cari(String keyword) {
  var hasil = items.where((i) => i.nama.toLowerCase().contains(keyword.toLowerCase())).toList();
  if (hasil.isEmpty) {
    print('Data tidak ditemukan.');
    return;
  }
  for (var item in hasil) {
    item.tampilkanInfo();
  }
}

double hitungTotal() {
  return items.fold(0.0, (total, item) => total + item.harga);
}

Future<void> simpanData() async {
  print('Menyimpan data...');
  await Future.delayed(Duration(seconds: 2));
  print('Data berhasil disimpan.');
}
}