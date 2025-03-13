import 'package:get/get.dart';
    import 'package:venturo_core/features/cart/controllers/cart_controller.dart';
    class CartBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(CartController());
      }
    }
    