import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tipout_final/modules/home/widgets/bottom_navigation_bar_adaptive.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGenerateRoute,
        initialRoute: '/employees',
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBarAdaptive(
          currentIndex: controller.activeIndex,
          onItemSelected: (int value) {
            controller.activeIndex = value;
          },
          items: [
            BottomNavigationBarItem(
              label: 'Employees',
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Batches',
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: 'Activity',
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.local_activity),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.settings),
            ),
          ],
        );
      }),
    );
  }
}
