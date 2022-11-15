import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utilities/ui/widgets/adaptive_button.dart';
import '../employees_controller.dart';

class AddEmployeeIdScanView extends GetView<EmployeesController> {
  const AddEmployeeIdScanView({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Employee's Drivers License",
                style: Get.textTheme.headline4?.copyWith(
                  height: 1.5,
                  color: Theme.of(context).textTheme.headline4?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Please click the button below to take a photo of the employee's drivers license.",
                style: Get.textTheme.headline6?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: AdaptiveButton(
                  onPressed: () async {
                    await controller.pickImageFromCamera();
                  },
                  text: 'Open Camera',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: AdaptiveButton(
                  onPressed: () async {
                    await controller.pickImageFromGallery();
                  },
                  text: 'Select From Gallery',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
