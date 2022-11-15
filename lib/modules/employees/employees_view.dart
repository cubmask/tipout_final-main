import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tipout_final/modules/employees/widgets/employee_card_item.dart';
import '../../data/models/employee_dto.dart';
import '../../utilities/ui/widgets/refresh_list_adaptive.dart';
import 'employee_details/employee_details_view.dart';
import 'employees_controller.dart';

class EmployeesView extends GetView<EmployeesController> {
  const EmployeesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Employees'),
        centerTitle: true,
        actions: const <Widget>[IconButton(
            onPressed: controller.openNewEmployeeView,
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.secondary,
              size: 40.0,
            ),
            tooltip: 'Employee',
          ),
        ]],
      ),
      body: Obx(
        () => RefreshListAdaptive(
          onRefresh: controller.loadMerchants,
          itemCount: controller.employees.length,
          itemBuilder: (BuildContext context, int i) {
            final EmployeeDTO employee =
                controller.employees.reversed.toList()[i];
            return InkWell(
              onTap: () {
                controller.selectedEmployee.value = employee;
                Get.to(() => const EmployeeDetailsView());
              },
              child: EmployeeCardItem(
                key: const Key("12345"),
                employeeId: employee.employeeId,
                firstName: employee.firstName,
                lastName: employee.lastName,
                pictureUrl: employee.pictureUrl,
                fisPrepaidCardNo: employee.fisPrepaidCardNo,
                cellPhoneNo: employee.cellPhoneNo,
                emailAddress: employee.emailAddress,
              ),
            );
          },
        ),
      ),
    );
  }
}


