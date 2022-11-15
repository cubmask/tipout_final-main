import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';
import '../../modules/employees/add_employee/add_employee_scanning_view.dart';
import '../models/batch_DTO.dart';
import '../models/employee_dto.dart';
import '../models/merchant_dto.dart';
import 'package:get/get.dart' hide Response, FormData;

class MerchantRepository {
  MerchantRepository(this._dio);

  final Dio _dio;

  Future<List<MerchantDTO>> getAll() async {
    try {
      final Response<List<dynamic>> result =
          await _dio.get('/api/DataAccess/merchants');
      return List<Map<String, dynamic>>.from(result.data ?? <dynamic>[])
          .map((Map<String, dynamic> e) => MerchantDTO.fromJson(e))
          .toList();
    } catch (e, stackTrace) {
      return Future<List<MerchantDTO>>.error(e, stackTrace);
    }
  }

/*  Future<MerchantDTO> getMerchantDataExport(String mid) async {
    try {
      final Response<Map<String, dynamic>> result =
          await _dio.download('/api/DataAccess/merchants/$mid/export');
      return MerchantDTO.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<MerchantDTO>.error(e, stackTrace);
    }
  }*/

  Future<MerchantDTO> getMerchant(String mid) async {
    try {
      final Response<Map<String, dynamic>> result =
          await _dio.get('/api/DataAccess/merchants/$mid');
      return MerchantDTO.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<MerchantDTO>.error(e, stackTrace);
    }
  }

  Future<List<BatchDTO>> getBatches(String mid) async {
    try {
      final Response<List<dynamic>> result =
          await _dio.get('/api/DataAccess/merchants/$mid/batches');
      return List<Map<String, dynamic>>.from(result.data ?? <dynamic>[])
          .map((Map<String, dynamic> e) => BatchDTO.fromJson(e))
          .toList();
    } catch (e, stackTrace) {
      return Future<List<BatchDTO>>.error(e, stackTrace);
    }
  }

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
      return EmployeeDTO.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      return Future<EmployeeDTO>.error(e, stackTrace);
    }
  }

  Future<bool> delete(String merchantGuid, String employeeGuid) async {
    try {
      await _dio.delete<dynamic>(
          '/api/DataAccess/merchants/$merchantGuid/employees/$employeeGuid');
      return true;
    } catch (e, stackTrace) {
      return Future<bool>.error(e, stackTrace);
    }
  }

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
      return EmployeeDTO.fromJson(result.data ?? <String, dynamic>{});
    } catch (e, stackTrace) {
      Get.to(const AddEmployeeScanningView());
      return Future<EmployeeDTO>.error(e, stackTrace);
    }
  }
}
