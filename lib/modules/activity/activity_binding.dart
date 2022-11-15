import 'package:get/get.dart';
import 'activity_controller.dart';

class ActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivityController());
  }
}
