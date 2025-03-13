import 'package:get/get.dart';
    import 'package:venturo_core/features/admin_report/controllers/admin_report_controller.dart';
    class AdminReportBinding extends Bindings {
      @override
      void dependencies() {
        Get.put(AdminReportController());
      }
    }
    