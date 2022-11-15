import 'package:get/get.dart';


//Employee Class
class EmployeeDTO {
  EmployeeDTO({
    this.merchantGuid,
    this.employeeGuid,
    this.employeeId,
    this.pictureUrl,
    this.firstName,
    this.lastName,
    this.fisPrepaidCardNo,
    this.cellPhoneNo,
    this.emailAddress,
  });


  late String? merchantGuid = "".obs as String?;
  late String? employeeGuid = "".obs as String?;
  late String? pictureUrl = "".obs as String?;
  late String? employeeId = "".obs as String?;
  late String? firstName = "".obs as String?;
  late String? lastName = "".obs as String?;
  late String? fisPrepaidCardNo = "".obs as String?;
  late String? cellPhoneNo = "".obs as String?;
  late String? emailAddress = "".obs as String?;

  factory EmployeeDTO.fromJson(Map<String, dynamic> json) => EmployeeDTO(
        merchantGuid: json["merchantGuid"],
        employeeGuid: json["employeeGuid"],
        pictureUrl: json["pictureUrl"],
        employeeId: json["employeeId"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        fisPrepaidCardNo: json["fisPrepaidCardNo"],
        cellPhoneNo: json["cellPhoneNo"],
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "merchantGuid": merchantGuid,
        "employeeGuid": employeeGuid,
        "pictureUrl": pictureUrl,
        "employeeId": employeeId,
        "FirstName": firstName,
        "LastName": lastName,
        "fisPrepaidCardNo": fisPrepaidCardNo,
        "cellPhoneNo": cellPhoneNo,
        "emailAddress": emailAddress,
      };
}
