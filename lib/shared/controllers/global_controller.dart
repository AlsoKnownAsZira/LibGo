import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:venturo_core/configs/routes/route.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  var isConnect = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _listenToConnectionChanges();
  }

  Future<void> _checkInitialConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      isConnect.value = true;
    } else {
      isConnect.value = false;
    }
  }

  void _listenToConnectionChanges() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      if (results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi)) {
        isConnect.value = true;
      } else {
        isConnect.value = false;
      }
    });
  }

  Future<void> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      isConnect.value = true;
    } else {
      isConnect.value = false;
    }
  }

  Future<void> signOut() async {
    var box = Hive.box('session');
    await box.clear();
    isConnect.value = false;
    Get.offNamed(Routes.signInRoute);
  }
}