import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tipout_final/modules/employees/add_employee/widgets/mobile_text_field.dart';
import '../../../utilities/ui/widgets/adaptive_button.dart';
import '../employees_controller.dart';
import 'add_employee_idscan_view.dart';

class AddEmployeeNumberView extends GetView<EmployeesController> {
  const AddEmployeeNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: controller.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Add Employee'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 0),
          child: Form(
            //key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Employee's Mobile Number",
                  style: Get.textTheme.headline4?.copyWith(
                    height: 1.5,
                    color: Theme.of(context).textTheme.headline4?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please enter the employee's mobile number to continue.",
                  style: Get.textTheme.headline6?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MobileTextField(controller: controller),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: AdaptiveButton(
                    onPressed: () {
                      controller.newEmployee.value.cellPhoneNo =
                          controller.mobileTextController.text;
                      Get.to(() => const AddEmployeeIdScanView());
                    },
                    text: 'Next',
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
