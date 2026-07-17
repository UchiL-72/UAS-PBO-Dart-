import 'item.dart';

class Buku extends Item {
  String penulis;

  Buku(String nama, double harga, this.penulis) : super(nama, harga);

  @override
  void tampilkanInfo() {
    print('Buku : $nama | Harga : Rp$harga | Penulis : $penulis');
  }
}