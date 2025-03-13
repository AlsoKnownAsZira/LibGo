import 'package:get/get.dart';
    import 'package:venturo_core/features/user_report/controllers/user_report_controller.dart';
    class UserReportBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(UserReportController());
      }
    }
    