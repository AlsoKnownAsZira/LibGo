import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/features/home_page/controllers/home_page_controller.dart';
import 'package:venturo_core/features/home_page/models/books.dart';
import 'package:venturo_core/features/home_page/view/components/home_app_bar.dart';
import 'package:venturo_core/features/home_page/view/components/home_search.dart';
import 'package:venturo_core/shared/styles/color_style.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('session');
    String userName = box.get('nama', defaultValue: 'User');
    String userAvatar = box.get('avatar', defaultValue: '');

    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(userName: userName, userAvatar: userAvatar),
        backgroundColor: ColorStyle.subtlePurple,
        elevation: 0,
      ),
      body: Column(
        children: [
          HomeSearch(controller: controller),
          Expanded(
            child: FutureBuilder<List<Book>>(
              future: controller.booksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('failed_load_books'.tr));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('no_books'.tr));
                } else {
                  controller.setBooks(snapshot.data!);
                  return Obx(() {
                    return ListView.builder(
                      itemCount: controller.filteredBooks.length,
                      itemBuilder: (context, index) {
                        final book = controller.filteredBooks[index];
                        return ListTile(
                          title: Text(book.nama),
                          subtitle: Text(book.penulis),
                        );
                      },
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
