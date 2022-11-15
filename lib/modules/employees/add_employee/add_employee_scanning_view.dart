import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../employees_controller.dart';

class AddEmployeeScanningView extends GetView<EmployeesController> {
  const AddEmployeeScanningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Scanning...",
                style: Get.textTheme.headline4?.copyWith(
                  height: 1.5,
                  color: Theme.of(context).textTheme.headline4?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
