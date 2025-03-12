import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/features/home_page/repositories/home_page_repository.dart';

class HomePageController extends GetxController {
  final HomePageRepository _repository = HomePageRepository();
  late Future<List<Book>> booksFuture;
  var books = <Book>[].obs;
  var randomBooks = <Book>[].obs;
  var filteredBooks = <Book>[].obs;
  var selectedCategory = 'All'.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    booksFuture = _repository.getAllBooks();
    searchController.addListener(_filterBooks);
  }

  @override
  void onClose() {
    searchController.removeListener(_filterBooks);
    searchController.dispose();
    super.onClose();
  }

  void _filterBooks() {
    final query = searchController.text.toLowerCase();
    filteredBooks.value = books.where((book) {
      final matchesCategory = selectedCategory.value == 'All' || book.kategori == selectedCategory.value;
      final matchesQuery = book.nama.toLowerCase().contains(query) || book.penulis.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void setBooks(List<Book> bookList) {
    books.value = bookList;
    _shuffleAndSetRandomBooks();
    _filterBooks();
  }

  void _shuffleAndSetRandomBooks() {
    final random = Random();
    final shuffledBooks = List<Book>.from(books)..shuffle(random);
    randomBooks.value = shuffledBooks.take(5).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    _filterBooks();
  }
}