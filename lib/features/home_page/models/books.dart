class Book {
  final String id;
  final String createdAt;
  final String nama;
  final String gambar;
  final String kategori;
  final String penulis;
  final String bahasa;
  final bool isPrinted;
  final bool isAvailable;
  final String sinopsis;
  final String tglRilis;
  final String penerbit;
  final int isbn;
  final String ttgPenulis;
  final int halaman;

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
    );
  }
}