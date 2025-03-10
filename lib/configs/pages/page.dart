import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/boarding/bindings/boarding_binding.dart';
import 'package:venturo_core/features/boarding/view/ui/boarding_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => SplashScreen(),
      binding: SplashBinding()
    ),
    GetPage(
      name: Routes.boardingRoute,
      page: () => boardingScreen(),
      binding: boardingBinding()
    ),
  ];
}
