import 'package:flutter/material.dart';
import 'package:tipout_final/modules/employees/employees_controller.dart';

class EmployeeIdTextField extends StatelessWidget {
  const EmployeeIdTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EmployeesController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      autofocus: true,
      controller: controller.employeeIdTextController,
      maxLength: 10,
      validator: (value) => value!.isEmpty ? 'Enter Employee Id' : null,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 5,
            bottom: 2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2.0, color: Theme.of(context).colorScheme.secondary),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
