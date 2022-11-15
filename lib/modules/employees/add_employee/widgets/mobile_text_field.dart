import 'package:flutter/material.dart';
import 'package:tipout_final/modules/employees/employees_controller.dart';
import '../../../settings/settings_controller.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EmployeesController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      autofocus: true,
      controller: controller.mobileTextController,
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (value) =>
          value!.length < 10 ? 'Cell Number must be 10 digits' : null,
      decoration: InputDecoration(
        counterText: '',
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
                Icons.phone,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        hintStyle: Theme.of(context).textTheme.bodyText1,
        hintText: "Mobile Number",
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
