import 'package:get/get.dart';
import '../modules/activity/activity_binding.dart';
import '../modules/activity/activity_view.dart';
import '../modules/batches/batch_details/batch_details_view.dart';
import '../modules/batches/batches_binding.dart';
import '../modules/batches/batches_view.dart';
import '../modules/employees/add_employee/add_employee_avatar_view.dart';
import '../modules/employees/add_employee/add_employee_idscan_view.dart';
import '../modules/employees/add_employee/add_employee_id_view.dart';
import '../modules/employees/add_employee/add_employee_number_view.dart';
import '../modules/employees/add_employee/add_employee_scanning_view.dart';
import '../modules/employees/employee_details/employee_details_view.dart';
import '../modules/employees/employees_binding.dart';
import '../modules/employees/employees_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.SPLASH;
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.EMPLOYEES,
      page: () => const EmployeesView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.EMPLOYEEDETAILS,
      page: () => const EmployeeDetailsView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.ADDEMPLOYEEID,
      page: () => const AddEmployeeIdView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.SCANEMPLOYEE,
      page: () => const AddEmployeeIdScanView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.ADDEMPLOYEENUMBER,
      page: () => const AddEmployeeNumberView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.ADDEMPLOYEEAVATAR,
      page: () => const AddEmployeeAvatarView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.SCANNING,
      page: () => const AddEmployeeScanningView(),
      binding: EmployeesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.BATCHES,
      page: () => const BatchesView(),
      binding: BatchesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.BATCHDETAILS,
      page: () => const BatchDetailsView(),
      binding: BatchesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.ACTIVITY,
      page: () => const ActivityView(),
      binding: ActivityBinding(),
    ),
  ];
}
