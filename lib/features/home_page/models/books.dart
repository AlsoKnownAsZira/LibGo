import 'package:hive/hive.dart';

part 'book_adapter.g.dart';

@HiveType(typeId: 0)
class Book extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String createdAt;

  @HiveField(2)
  final String nama;

  @HiveField(3)
  final String gambar;

  @HiveField(4)
  final String kategori;

  @HiveField(5)
  final String penulis;

  @HiveField(6)
  final String bahasa;

  @HiveField(7)
  final bool isPrinted;

  @HiveField(8)
  final bool isAvailable;

  @HiveField(9)
  final String sinopsis;

  @HiveField(10)
  final String tglRilis;

  @HiveField(11)
  final String penerbit;

  @HiveField(12)
  final int isbn;

  @HiveField(13)
  final String ttgPenulis;

  @HiveField(14)
  final int halaman;

  @HiveField(15)
  final String penilaian;

  Book({
    required this.id,
    required this.createdAt,
    required this.nama,
    required this.gambar,
    required this.kategori,
    required this.penulis,
    required this.bahasa,
    required this.isPrinted,
    required this.isAvailable,
    required this.sinopsis,
    required this.tglRilis,
    required this.penerbit,
    required this.isbn,
    required this.ttgPenulis,
    required this.halaman,
    required this.penilaian,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      createdAt: json['createdAt'],
      nama: json['nama'],
      gambar: json['gambar'],
      kategori: json['kategori'],
      penulis: json['penulis'],
      bahasa: json['bahasa'],
      isPrinted: json['isPrinted'],
      isAvailable: json['isAvailable'],
      sinopsis: json['sinopsis'],
      tglRilis: json['tgl_rilis'],
      penerbit: json['penerbit'],
      isbn: json['isbn'],
      ttgPenulis: json['ttg_penulis'],
      halaman: json['halaman'],
      penilaian: json['penilaian'],
    );
  }
}