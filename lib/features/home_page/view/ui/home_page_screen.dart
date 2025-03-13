import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/features/home_page/controllers/home_page_controller.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/features/home_page/view/components/home_app_bar.dart';
import 'package:venturo_core/features/home_page/view/components/promo_card.dart';
import 'package:venturo_core/shared/styles/color_style.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/shared/widgets/custom_botnav.dart';
import 'package:venturo_core/utils/functions/category_utils.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});

  final HomePageController controller = Get.put(HomePageController());

  final List<String> categories = [
    'All',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    String userName = box.get('nama', defaultValue: 'User');
    String userAvatar = box.get('avatar', defaultValue: '');

    return Scaffold(
      bottomNavigationBar: CustomBotNav(
        currentIndex: 0,
      ),
      extendBody: false,
      appBar: AppBar(
        title: HomeAppBar(userName: userName, userAvatar: userAvatar),
        backgroundColor: ColorStyle.subtlePurple,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'search_books'.tr,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Book>>(
              future: controller.booksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('failed_load_books'.tr));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('no_books'.tr));
                } else {
                  controller.setBooks(snapshot.data!);
                  return Obx(() {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Icon(Icons.book,
                                    color: ColorStyle.purple),
                                const SizedBox(width: 8),
                                Text("recommended_books".tr,
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.sp,
                                        color: ColorStyle.purple,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200.h,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                            ),
                            items: controller.randomBooks
                                .map((book) => PromoCard(book: book))
                                .toList(),
                          ),
                          SizedBox(height: 20.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categories.map((category) {
                                return Obx(() {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: ChoiceChip(
                                      selectedColor: ColorStyle.purple,
                                      backgroundColor: Colors.white,
                                      shape: const StadiumBorder(
                                        side: BorderSide(
                                          color: ColorStyle.purple,
                                        ),
                                      ),
                                      label: Text(
                                        category == 'All'
                                            ? 'All Books'
                                            : getReadableCategory(category),
                                        style: TextStyle(
                                          color: controller
                                                      .selectedCategory.value ==
                                                  category
                                              ? Colors.white
                                              : ColorStyle.purple,
                                        ),
                                      ),
                                      selected:
                                          controller.selectedCategory.value ==
                                              category,
                                      onSelected: (selected) {
                                        controller.selectCategory(
                                            selected ? category : 'All');
                                      },
                                    ),
                                  );
                                });
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Obx(() {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: controller.filteredBooks.length,
                              itemBuilder: (context, index) {
                                final book = controller.filteredBooks[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.bookDetailRoute,
                                        arguments: book);
                                  },
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          book.gambar,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                            );
                          }),
                        ],
                      ),
                    );
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
