import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tipout_final/data/repositories/employee_repository.dart';
import '../../data/models/employee_dto.dart';
import '../../data/models/merchant_dto.dart';
import '../../data/repositories/merchant_repository.dart';
import '../../routes/app_pages.dart';
import '../../utilities/ui/functions/show_adaptive_dialog.dart';
import '../employees/add_employee/add_employee_scanning_view.dart';
import '../employees/add_employee/add_employee_id_view.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../home/home_view.dart';

class EmployeesController extends GetxController {
  EmployeesController(this._repository);
  final EmployeeRespository _repository;
  final RxList<EmployeeDTO> employees = <EmployeeDTO>[].obs;
  final RxList<MerchantDTO> merchants = <MerchantDTO>[].obs;
  final RxBool isSaving = false.obs;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mobileTextController = TextEditingController();
  TextEditingController employeeIdTextController = TextEditingController();
  final Rx<EmployeeDTO> newEmployee = EmployeeDTO().obs;
  final Rx<EmployeeDTO> selectedEmployee = EmployeeDTO().obs;
  RxBool isEditing = false.obs;

Future<void> getMerchants() async {
    try {
      merchants.value = await _repository.getAll();
      employees.value = merchants.first.employees;
    } catch (e) {
      return Future<void>.error(e);
    }
  }

Future<void> loadMerchants() async {
    try {
      await getMerchants();
    } catch (e) {
      showAdaptiveDialog(title: 'Load Merchants Error', content: e.toString());
    }
  }


void openNewEmployeeView() {
    Navigator.of(Get.context!).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            const AddEmployeeIdView()));
  }

void cancelNewEmployeeView() {
    Get.back();
  }

Future pickImageFromCamera() async {
    final XFile? photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
      requestFullMetadata: false,
    );

    if (photo != null) {
      Uint8List? compressedImage = await FlutterImageCompress.compressWithFile(
          photo.path,
          minWidth: 400,
          minHeight: 800,
          quality: 30);
      if (compressedImage != null) {
        final tempDir = await getTemporaryDirectory();
        File file = await File('${tempDir.path}/image.png').create();
        file.writeAsBytesSync(compressedImage);

        try {
          isSaving.value = true;
          Get.to(() => const AddEmployeeScanningView());
          EmployeeDTO tempNewEmployee =
              await _repository.postNewEmployeeByDriversLicense(
                  image: file,
                  merchantGuid: merchants.first.merchantGuid,
                  employeeGuid: employeeIdTextController.text);
          newEmployee.value = tempNewEmployee;
          mobileTextController.clear();
          employeeIdTextController.clear();
          await getMerchants();
          Get.to(() => const HomeView());
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
            messageText: Text(
              '${newEmployee.value.firstName} ${newEmployee.value.lastName} was added successfully!',
              style: const TextStyle(color: Colors.white),
            ),
          );
        } catch (e) {
          Get.back();
          Get.back();
          Get.back();
          showAdaptiveDialog(
              title: 'Add Employee Error', content: e.toString());
        } finally {
          isSaving.value = false;
        }
      }
    }
  }  

Future pickImageFromGallery() async {
    final XFile? photo =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo != null) {
      File file = File(photo.path);
      try {
        isSaving.value = true;
        Get.to(() => const AddEmployeeScanningView());
        EmployeeDTO tempNewEmployee =
            await _repository.postNewEmployeeByDriversLicense(
                image: file,
                merchantGuid: merchants.first.merchantGuid,
                employeeGuid: employeeIdTextController.text);

        newEmployee.value = tempNewEmployee;
        mobileTextController.clear();
        employeeIdTextController.clear();
        await getMerchants();
        Get.offNamed(Routes.HOME);
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
          messageText: Text(
            '${newEmployee.value.firstName} ${newEmployee.value.lastName} was added successfully!',
            style: const TextStyle(color: Colors.white),
          ),
        );
      } catch (e) {
        Get.back();
        Get.back();
        Get.back();
        showAdaptiveDialog(title: 'Error', content: e.toString());
      } finally {
        isSaving.value = false;
      }
    }
  }

}
