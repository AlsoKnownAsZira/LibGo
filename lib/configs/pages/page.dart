import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/admin_report/bindings/admin_report_binding.dart';
import 'package:venturo_core/features/admin_report/view/ui/admin_report_screen.dart';
import 'package:venturo_core/features/boarding/bindings/boarding_binding.dart';
import 'package:venturo_core/features/boarding/view/ui/boarding_screen.dart';
import 'package:venturo_core/features/book_detail/bindings/book_detail_binding.dart';
import 'package:venturo_core/features/book_detail/view/ui/book_detail_screen.dart';
import 'package:venturo_core/features/cart/bindings/cart_binding.dart';
import 'package:venturo_core/features/cart/view/ui/cart_screen.dart';
import 'package:venturo_core/features/crud_books/bindings/crud_books_binding.dart';
import 'package:venturo_core/features/crud_books/view/ui/crud_books_screen.dart';
import 'package:venturo_core/features/crud_users/bindings/crud_users_binding.dart';
import 'package:venturo_core/features/crud_users/view/ui/crud_users_screen.dart';
import 'package:venturo_core/features/home_page/bindings/home_page_binding.dart';
import 'package:venturo_core/features/home_page/view/ui/home_page_screen.dart';
import 'package:venturo_core/features/no_connection/bindings/no_connection_binding.dart';
import 'package:venturo_core/features/no_connection/view/ui/no_connection_screen.dart';
import 'package:venturo_core/features/profile/bindings/profile_binding.dart';
import 'package:venturo_core/features/profile/view/ui/profile_screen.dart';
import 'package:venturo_core/features/sign_in/bindings/sign_in_binding.dart';
import 'package:venturo_core/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';
import 'package:venturo_core/features/user_report/bindings/user_report_binding.dart';
import 'package:venturo_core/features/user_report/view/ui/user_report_screen.dart';

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
        page: () => BookDetailScreen(book: Get.arguments,),
        binding: BookDetailBinding()),
    GetPage(
        name: Routes.adminReportRoute,
        page: () => AdminReportScreen(),
        binding: AdminReportBinding()),
    GetPage(
        name: Routes.crudUsersRoute,
        page: () => CrudUsersScreen(),
        binding: CrudUsersBinding()),
    GetPage(
        name: Routes.profileRoute,
        page: () => ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.userReportRoute,
        page: () => UserReportScreen(),
        binding: UserReportBinding()),
    GetPage(
        name: Routes.cartRoute,
        page: () => CartScreen(),
        binding: CartBinding()),
  ];
}
