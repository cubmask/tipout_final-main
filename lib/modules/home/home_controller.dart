import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../activity/activity_view.dart';
import '../batches/batches_binding.dart';
import '../batches/batches_view.dart';
import '../settings/settings_view.dart';
import '../activity/activity_binding.dart';
import '../settings/settings_binding.dart';
import '../employees/employees_view.dart';
import '../employees/employees_binding.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _routes = [
    '/employees',
    '/batches',
    '/activity',
    '/settings',
  ];

  final _activeIndex = 0.obs;
  int get activeIndex => _activeIndex.value;
  set activeIndex(int index) {
    _activeIndex(index);
    Get.toNamed(_routes[index], id: NAVIGATOR_KEY);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/employees') {
      return GetPageRoute(
        settings: settings,
        page: () => const EmployeesView(),
        binding: EmployeesBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 10),
      );
    }

    if (settings.name == '/batches') {
      return GetPageRoute(
        settings: settings,
        page: () => const BatchesView(),
        binding: BatchesBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 10),
      );
    }

    if (settings.name == '/activity') {
      return GetPageRoute(
        settings: settings,
        page: () => const ActivityView(),
        binding: ActivityBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 10),
      );
    }

    if (settings.name == '/settings') {
      return GetPageRoute(
        settings: settings,
        page: () => const SettingsView(),
        binding: SettingsBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 10),
      );
    }

    return null;
  }
}
