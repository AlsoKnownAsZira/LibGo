import 'package:get/get.dart';
    import 'package:venturo_core/features/boarding/controllers/boarding_controller.dart';
    class BoardingBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(BoardingController());
      }
    }
    