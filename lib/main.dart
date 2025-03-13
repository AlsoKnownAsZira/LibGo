import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/configs/localizations/app_translation.dart';
import 'package:venturo_core/features/sign_in/controllers/sign_in_controller.dart';
import 'package:venturo_core/shared/controllers/global_controller.dart';
import 'configs/pages/page.dart';
import 'configs/themes/theme.dart';
import 'utils/services/sentry_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
    Hive.registerAdapter(BookAdapter());
  await Hive.openBox('session');
  await Hive.openBox('cart');

  /// Change your options.dns with your project !!!!
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://30fca41e405dfa6b23883af045e4658e@o4505883092975616.ingest.sentry.io/4506539099095040';
      options.tracesSampleRate = 1.0;
      options.beforeSend = filterSentryErrorBeforeSend;
    },
    appRunner: () {
      // Initialize GlobalController
      Get.put(GlobalController());
      Get.lazyPut(() => SignInController());
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslations(),

          title: 'Venturo Core',
          debugShowCheckedModeBanner: false,
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('id', 'ID'),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('id', 'ID'),
          ],
          // initialBinding: , Jika memiliki global bindding
          initialRoute: Routes.splashRoute,
          theme: themeLight,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
        );
      },
    );
  }
}
