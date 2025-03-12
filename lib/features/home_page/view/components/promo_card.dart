import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/utils/functions/category_utils.dart';

class PromoCard extends StatelessWidget {
  final Book book;

  PromoCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.bookDetailRoute, arguments: book);
      },
      child: Container(
        width: 282.w,
        height: 188.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(115, 71, 70, 70),
              offset: Offset(0, 2),
              blurRadius: 8,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: book.gambar,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                padding: EdgeInsets.all(16.w),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        book.penulis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        book.nama,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        getReadableCategory(book.kategori),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
