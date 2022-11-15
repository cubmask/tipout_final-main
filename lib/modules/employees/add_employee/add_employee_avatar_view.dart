import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tipout_final/modules/employees/add_employee/widgets/employee_id_text_field.dart';
import 'package:tipout_final/modules/employees/add_employee/widgets/mobile_text_field.dart';
import '../../../utilities/ui/widgets/adaptive_button.dart';
import '../employees_controller.dart';
import 'add_employee_idscan_view.dart';

class AddEmployeeAvatarView extends GetView<EmployeesController> {
  const AddEmployeeAvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Add Employee'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Employee's Avatar Photo",
                  style: Get.textTheme.headline6?.copyWith(
                    height: 1.5,
                    color: Theme.of(context).textTheme.headline4?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please enter the employee's mobile number and employeeId to continue",
                  style: Get.textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MobileTextField(controller: controller),
                const SizedBox(
                  height: 20,
                ),
                EmployeeIdTextField(controller: controller),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: AdaptiveButton(
                    onPressed: () {
                      controller.newEmployee.value.cellPhoneNo =
                          controller.mobileTextController.text;
                      controller.newEmployee.value.employeeId =
                          controller.employeeIdTextController.text;
                      Get.to(() => const AddEmployeeIdScanView());
                    },
                    text: 'Next',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary),
                        onPressed: () {
                          controller.newEmployee.value.cellPhoneNo =
                              controller.mobileTextController.text;
                          controller.newEmployee.value.employeeId =
                              controller.employeeIdTextController.text;
                          Get.to(() => const AddEmployeeIdScanView());
                        },
                        child: const Text('Skip'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
