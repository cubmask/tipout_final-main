import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';
import '../../modules/employees/add_employee/add_employee_scanning_view.dart';
import '../models/employee_dto.dart';
import 'package:get/get.dart' hide Response, FormData;

class EmployeeRespository {
  EmployeeRespository(this._dio);

  final Dio _dio;

//GET EMPLOYEE
  Future<EmployeeDTO> addEmployee(
      {required String? merchantGuid,
      required String? employeeId,
      required String? firstName,
      required String? lastName,
      required String? fisPrepaidCardNo,
      required String? cellPhoneNo,
      required String? emailAddress}) async {
    try {
      final Response result = await _dio
          .post("/api/DataAccess/merchants/$merchantGuid/employees", data: {
        'employeeId': employeeId,
        'FirstName': firstName,
        'LastName': lastName,
        'fisPrepaidCardNo': "empty",
        'cellPhoneNo': cellPhoneNo,
        'emailAddress': "empty",
      });
      print(
          "Result Status Code and Message: ${result.statusCode} + ${result.statusMessage}");
      print("Result Data: ${result.data}");
      return EmployeeDTO.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<EmployeeDTO>.error(e, stackTrace);
    }
  }

//CREATE EMPLOYEE
Future<EmployeeDTO> postNewEmployeeByDriversLicense( 
      {required File image,
      required String merchantGuid,
      required String employeeGuid}) async {
    List<int> imageBytes = image.readAsBytesSync();
    String imageString = base64Encode(imageBytes);
    try {
      final Response<Map<String, dynamic>> result = await _dio.post(
        '/api/DataAccess/merchants/$merchantGuid/employees/$employeeGuid/ocrid',
        data: {
          "data": imageString,
          "fileType": "image/png",
          "size": 0,
        },
      );
      print("Add New Employee Response: $result");
      return EmployeeDTO.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      Get.to(const AddEmployeeScanningView());
      return Future<EmployeeDTO>.error(e, stackTrace);
    }
  }  

//DELETE EMPLOYEE
  Future<bool> delete(String merchantGuid, String employeeGuid) async {
    try {
      await _dio.delete<dynamic>(
          '/api/DataAccess/merchants/$merchantGuid/employees/$employeeGuid');
      return true;
    } catch (e, stackTrace) {
      return Future<bool>.error(e, stackTrace);
    }
  }

//??
  Future<bool> resetDB() async {
    try {
      final Response result =
          await _dio.post<dynamic>('/api/DataAccess/resetDB');

      if (result.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } catch (e, stackTrace) {
      return Future<bool>.error(e, stackTrace);
    }
  }
}
