// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      id: fields[0] as String,
      createdAt: fields[1] as String,
      nama: fields[2] as String,
      gambar: fields[3] as String,
      kategori: fields[4] as String,
      penulis: fields[5] as String,
      bahasa: fields[6] as String,
      isPrinted: fields[7] as bool,
      isAvailable: fields[8] as bool,
      sinopsis: fields[9] as String,
      tglRilis: fields[10] as String,
      penerbit: fields[11] as String,
      isbn: fields[12] as int,
      ttgPenulis: fields[13] as String,
      halaman: fields[14] as int,
      penilaian: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.nama)
      ..writeByte(3)
      ..write(obj.gambar)
      ..writeByte(4)
      ..write(obj.kategori)
      ..writeByte(5)
      ..write(obj.penulis)
      ..writeByte(6)
      ..write(obj.bahasa)
      ..writeByte(7)
      ..write(obj.isPrinted)
      ..writeByte(8)
      ..write(obj.isAvailable)
      ..writeByte(9)
      ..write(obj.sinopsis)
      ..writeByte(10)
      ..write(obj.tglRilis)
      ..writeByte(11)
      ..write(obj.penerbit)
      ..writeByte(12)
      ..write(obj.isbn)
      ..writeByte(13)
      ..write(obj.ttgPenulis)
      ..writeByte(14)
      ..write(obj.halaman)
      ..writeByte(15)
      ..write(obj.penilaian);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
