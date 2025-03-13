import 'package:get/get.dart';
    import 'package:venturo_core/features/crud_users/controllers/crud_users_controller.dart';
    class CrudUsersBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(CrudUsersController());
      }
    }
    