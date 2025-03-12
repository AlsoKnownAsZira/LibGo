import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/utils/functions/category_utils.dart';

class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.nama),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                book.gambar,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book.nama,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Author: ${book.penulis}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Publisher: ${book.penerbit}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'ISBN: ${book.isbn}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Language: ${(book.bahasa)}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${getReadableCategory(book.kategori)}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Printed: ${book.isPrinted ? "Yes" : "No"}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Available: ${book.isAvailable ? "Yes" : "No"}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Release Date: ${book.tglRilis}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Pages: ${book.halaman}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Rating: ${book.penilaian}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Synopsis:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              book.sinopsis,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'About the Author:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              book.ttgPenulis,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
