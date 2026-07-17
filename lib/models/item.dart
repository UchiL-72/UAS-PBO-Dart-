import '../exceptions/data_tidak_valid_exception.dart';

abstract class Item {
  String _nama;
  double _harga;

  Item(this._nama, this._harga) {
    if (_nama.trim().isEmpty) {
      throw DataTidakValidException('Nama tidak boleh kosong!');
    }
    if (_harga < 0) {
      throw DataTidakValidException('Harga tidak valid!');
    }
  }

  String get nama => _nama;
  set nama(String value) {
    if (value.trim().isEmpty) {
      throw DataTidakValidException('Nama tidak boleh kosong!');
    }
    _nama = value;
  }

  double get harga => _harga;
  set harga(double value) {
    if (value < 0) {
      throw DataTidakValidException('Harga tidak boleh negatif!');
    }
    _harga = value;
  }

  void tampilkanInfo();
}