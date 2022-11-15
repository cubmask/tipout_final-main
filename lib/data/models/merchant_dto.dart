import 'dart:convert';
import 'employee_dto.dart';

//test
List<MerchantDTO> merchantFromJson(String str) => List<MerchantDTO>.from(
    json.decode(str).map((x) => MerchantDTO.fromJson(x)));

String merchantToJson(List<MerchantDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MerchantDTO {
  MerchantDTO({
    required this.merchantGuid,
    required this.mid,
    required this.merchantName,
    required this.fisPrepaidCardNo,
    required this.employees,
  });

  final String merchantGuid;
  final String mid;
  final String merchantName;
  final String? fisPrepaidCardNo;
  final List<EmployeeDTO> employees;

  factory MerchantDTO.fromJson(Map<String, dynamic> json) => MerchantDTO(
        merchantGuid: json["merchantGuid"],
        mid: json["mid"],
        merchantName: json["merchantName"],
        fisPrepaidCardNo: json["fisPrepaidCardNo"],
        employees: List<EmployeeDTO>.from(
            json["employees"].map((x) => EmployeeDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "merchantGuid": merchantGuid,
        "mid": mid,
        "merchantName": merchantName,
        "fisPrepaidCardNo": fisPrepaidCardNo,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}
