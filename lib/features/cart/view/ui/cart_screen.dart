import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home_page/controllers/home_page_controller.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/shared/widgets/custom_button.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final HomePageController controller = Get.find<HomePageController>();
  Book? selectedBook;

  @override
  Widget build(BuildContext context) {
    List<Book> cartBooks = controller.getCartBooks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: ColorStyle.subtlePurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: cartBooks.length,
              itemBuilder: (context, index) {
                final book = cartBooks[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBook = book;
                    });
                  },
                  child: Card(
                    color:
                        selectedBook == book ? Colors.grey[300] : Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          book.gambar,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.nama,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Author: ${book.penulis}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Rating: ${book.penilaian}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SecondaryButton(
              width: Get.width,
              onPressed: () {
                controller.clearCart();
                Get.back();
              },
              text: 'remove_books'.tr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MainButton(
              width: Get.width,
              onPressed: () {
                if (selectedBook != null) {
                  showCheckoutDialog(selectedBook!);
                }
              },
              text: 'checkout_'.tr,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkoutBook(Book book) async {
    final url =
        'https://67c6a9bf351c081993fe3162.mockapi.io/libgo/api/v1/orders';
    final now = DateTime.now();
    final deadline = now.add(Duration(days: 14)); // or 21 days
    var box = Hive.box('session');
    final userId = box.get('userId', defaultValue: '0');
    final nama = box.get('nama', defaultValue: '0');

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'createdAt': now.toIso8601String(),
        'id_book': book.id,
        'deadline': deadline.toIso8601String(),
        'status': '0',
        'id_user': userId,
        'book_name': book.nama,
        'user_name': nama,
        'book_author': book.penulis,
        'book_publisher': book.penerbit,
        'book_isbn': book.isbn,
        'book_language': book.bahasa,
        'book_category': book.kategori,
        'book_isPrinted': book.isPrinted,
        'book_isAvailable': book.isAvailable,
        'book_rating': book.penilaian,
        'book_release_date': book.tglRilis,
        'book_pages': book.halaman,
        'book_synopsis': book.sinopsis,
        'book_author_info': book.ttgPenulis,
        'book_image': book.gambar,
      }),
    );

    if (response.statusCode == 201) {
      // Remove the book from the cart
      var cartBox = Hive.box('cart');
      List<Book> cart =
          (cartBox.get('cart', defaultValue: <Book>[]) as List).cast<Book>();
      cart.remove(book);
      cartBox.put('cart', cart);

      setState(() {
        selectedBook = null;
      });

      Get.snackbar('Success', 'Book checked out successfully',
          backgroundColor: Colors.green);
    } else {
      Get.snackbar('Error', 'Failed to check out book',
          backgroundColor: Colors.red);
    }
  }

  void showCheckoutDialog(Book book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('checkout_book'.tr),
          content: Text('Do you want to checkout "${book.nama}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                checkoutBook(book);
              },
              child: Text('checkout'.tr),
            ),
          ],
        );
      },
    );
  }
}
