import 'package:get/get.dart';
    import 'package:venturo_core/features/book_detail/controllers/book_detail_controller.dart';
    class BookDetailBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(BookDetailController());
      }
    }
    