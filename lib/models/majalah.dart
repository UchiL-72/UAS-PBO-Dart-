import 'item.dart';

class Majalah extends Item {
  int edisi;

  Majalah(String nama, double harga, this.edisi) : super(nama, harga);

  @override
  void tampilkanInfo() {
    print('Majalah : $nama | Harga : Rp$harga | Edisi : $edisi');
  }
}