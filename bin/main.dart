import 'dart:io';
import '../lib/models/buku.dart';
import '../lib/models/majalah.dart';
import '../lib/controllers/manager.dart';
import '../lib/exceptions/data_tidak_valid_exception.dart';

void main() async {
  final manager = Manager();
  bool berjalan = true;

  try {
    manager.tambah(Buku('Dart Dasar', 75000, 'Andi'));
    manager.tambah(Majalah('Teknologi', 2500, 12));
  } catch (e) {
    print (e);
  }


  while (berjalan) {
    print('\n===== MENU =====');
    print('1. Tambah Data');
    print('2. List Semua Data');
    print('3. Cari Data');
    print('4. Hitung Total');
    print('5. Simpan Data');
    print('6. Keluar');
    print('================');
    stdout.write('Pilih menu (1-6)\t: ');

    String? pilihan = stdin.readLineSync();

    try {
      switch (pilihan) {
        case '1' :
        print('\n--- Tambah Data ---');
        print('\nPilih Jenis Item :');
        print('1. Buku');
        print('2. Majalah');
        stdout.write('Pilihan\t: ');
        String? jenis = stdin.readLineSync();

        stdout.write('Masukkan Nama\t: ');
        String nama = stdin.readLineSync() ?? '';

        stdout.write('Masukkan Harga\t: ');
        double harga = double.tryParse(stdin.readLineSync() ?? '') ?? -1;

        if (jenis == '1') {
          stdout.write('Masukkan Penulis\t: ');
          String penulis = stdin.readLineSync() ?? '';
          manager.tambah(Buku(nama, harga, penulis));
          print('Buku berhasil ditambahkan.');
        } else if (jenis == '2') {
          stdout.write('Masukkan Edisi (Angka) : ');
          int edisi = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
          manager.tambah(Majalah(nama, harga, edisi));
          print('Majalah berhasil ditambahkan.');
        } else {
          print('Jenis item tidak vallid.');
        }
        break;

        case '2':
        print('\n--- Semua Data ---');
        manager.tampilkamSemua();
        break;

        case '3':
        stdout.write('\nMasukkan kata kunci pencarian : ');
        String keyword = stdin.readLineSync() ?? '';
        print('\n--- Hasil Pencarian ---');
        manager.cari(keyword);
        break;

        case '4':
        double total = manager.hitungTotal();
        print('\n--- Total ---');
        print('Total Harga Semua Item : Rp$total');
        break;

        case '5':
        print('');
        await manager.simpanData();
        break;

        case '6':
        berjalan = false;
        print('\nKeluar dari program. Terimakasih ~');
        break;

        default:
        print('Pilihan tidak valid. (Silahkan pilih menu 1-6)');
      }
    } on DataTidakValidException catch (e) {
      print('\nGagal memproses data ($e)');
    } catch (e) {
      print('\nTerjadi kesalahan input data ($e)');
    }
  }
}