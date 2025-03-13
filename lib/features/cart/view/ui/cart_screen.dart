import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home_page/controllers/home_page_controller.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class CartScreen extends StatelessWidget {
  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    List<Book> cartBooks = controller.getCartBooks();

    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
        backgroundColor: ColorStyle.subtlePurple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        itemCount: cartBooks.length,
        itemBuilder: (context, index) {
          final book = cartBooks[index];
          return Card(
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
          );
        },
      ),
    );
  }
}