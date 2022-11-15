import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tipout_final/modules/settings/settings_controller.dart';
import 'package:tipout_final/modules/splash/splash_controller.dart';
import '../../data/repositories/merchant_repository.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantRepository>(() => MerchantRepository(Get.find<Dio>()));
    Get.lazyPut<SplashController>(
        () => SplashController(Get.find<MerchantRepository>()));
  }
}
