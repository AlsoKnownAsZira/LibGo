import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/boarding/bindings/boarding_binding.dart';
import 'package:venturo_core/features/boarding/view/ui/boarding_screen.dart';
import 'package:venturo_core/features/book_detail/bindings/book_detail_binding.dart';
import 'package:venturo_core/features/book_detail/view/ui/book_detail_screen.dart';
import 'package:venturo_core/features/crud_books/bindings/crud_books_binding.dart';
import 'package:venturo_core/features/crud_books/view/ui/crud_books_screen.dart';
import 'package:venturo_core/features/home_page/bindings/home_page_binding.dart';
import 'package:venturo_core/features/home_page/view/ui/home_page_screen.dart';
import 'package:venturo_core/features/no_connection/bindings/no_connection_binding.dart';
import 'package:venturo_core/features/no_connection/view/ui/no_connection_screen.dart';
import 'package:venturo_core/features/sign_in/bindings/sign_in_binding.dart';
import 'package:venturo_core/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splashRoute,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.boardingRoute,
        page: () => const BoardingScreen(),
        binding: BoardingBinding()),
    GetPage(
        name: Routes.signInRoute,
        page: () => SignInScreen(),
        binding: SignInBinding()),
    GetPage(
        name: Routes.noConnectionRoute,
        page: () => NoConnectionScreen(),
        binding: NoConnectionBinding()),
    GetPage(
        name: Routes.homePageRoute,
        page: () => HomePageScreen(),
        binding: HomePageBinding()),
    GetPage(
        name: Routes.crudBooksRoute,
        page: () => CrudBooksScreen(),
        binding: CrudBooksBinding()),
    GetPage(
        name: Routes.bookDetailRoute,
        page: () => BookDetailScreen(),
        binding: BookDetailBinding()),
  ];
}
