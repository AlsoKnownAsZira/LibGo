import 'package:get/get.dart';
    import 'package:venturo_core/features/crud_books/controllers/crud_books_controller.dart';
    class CrudBooksBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(CrudBooksController());
      }
    }
    