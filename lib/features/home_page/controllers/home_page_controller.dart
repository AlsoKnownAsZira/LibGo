import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
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
  final Logger logger = Logger();

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
      final matchesCategory = selectedCategory.value == 'All' ||
          book.kategori == selectedCategory.value;
      final matchesQuery = book.nama.toLowerCase().contains(query) ||
          book.penulis.toLowerCase().contains(query);
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

  void addToCart(Book book) {
    var box = Hive.box('cart');
    List<Book> cart =
        (box.get('cart', defaultValue: <Book>[]) as List).cast<Book>();
    cart.add(book);
    box.put('cart', cart);
    logger.i('Book added to cart: ${book.nama}');
    logger.i('Current cart: ${cart.map((b) => b.nama).toList()}');
  }

  List<Book> getCartBooks() {
    var box = Hive.box('cart');
    List<Book> cart =
        (box.get('cart', defaultValue: <Book>[]) as List).cast<Book>();
    logger.i('Retrieved cart: ${cart.map((b) => b.nama).toList()}');
    return cart;
  }

  void clearCart() {
    var box = Hive.box('cart');
    box.clear();
    logger.i('Cart cleared');
  }
}
