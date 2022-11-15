import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../data/api.dart';

class AppBinding implements Bindings {
  AppBinding(this._baseUrl);

  final String _baseUrl;

  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Api(_baseUrl).init());
  }
}
