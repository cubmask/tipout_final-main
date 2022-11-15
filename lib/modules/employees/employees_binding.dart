import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:tipout_final/data/repositories/employee_repository.dart';
import 'package:tipout_final/modules/employees/employees_controller.dart';

class EmployeesBinding implements Bindings {
  @override
  void dependencies() {
Get.lazyPut<EmployeeRespository>(() => EmployeeRespository(Get.find<Dio>()));
Get.lazyPut<EmployeesController>(() => EmployeesController(Get.find<EmployeeRespository>()));

  }
}
