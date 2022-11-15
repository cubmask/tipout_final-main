import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../employees_controller.dart';

class EmployeeDetailsView extends GetView<EmployeesController> {
  const EmployeeDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
            controller.isEditing.value = false;
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Employee Details"),
        centerTitle: true,
        actions: <Widget>[
          Obx(
            () => TextButton(
              onPressed: () =>
                  controller.isEditing.value = !controller.isEditing.value,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  controller.isEditing.value ? "Done" : "Edit",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 100,
              backgroundImage:
                  NetworkImage(controller.selectedEmployee.value.pictureUrl!),
            ),
            const SizedBox(height: 10),
            Text(
              "${controller.selectedEmployee.value.firstName} ${controller.selectedEmployee.value.lastName}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${controller.selectedEmployee.value.cellPhoneNo}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${controller.selectedEmployee.value.employeeId}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
