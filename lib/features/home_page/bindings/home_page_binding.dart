import 'package:get/get.dart';
    import 'package:venturo_core/features/home_page/controllers/home_page_controller.dart';
    class HomePageBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(HomePageController());
      }
    }
    