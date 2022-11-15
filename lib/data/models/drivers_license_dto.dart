import 'dart:convert';

DriversLicenseDTO driversLicenseFromJson(String str) =>
    DriversLicenseDTO.fromJson(json.decode(str));

String driversLicenseToJson(DriversLicenseDTO data) =>
    json.encode(data.toJson());

class DriversLicenseDTO {
  DriversLicenseDTO({
    required this.docType,
    required this.dateOfIssue,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
    required this.documentDiscriminator,
    required this.endorsements,
    required this.restrictions,
    required this.vehicleClassification,
    required this.countryRegion,
    required this.dateOfBirth,
    required this.dateOfExpiration,
    required this.documentNumber,
    required this.firstName,
    required this.lastName,
    required this.nationality,
    required this.sex,
    required this.documentType,
    required this.addressLine1,
    required this.addressLine2,
    required this.region,
    required this.totalElapsedSecs,
  });

  final String docType;
  final DateTime dateOfIssue;
  final String height;
  final String weight;
  final String eyeColor;
  final String hairColor;
  final String documentDiscriminator;
  final String endorsements;
  final String restrictions;
  final String vehicleClassification;
  final String countryRegion;
  final DateTime dateOfBirth;
  final DateTime dateOfExpiration;
  final String documentNumber;
  final String firstName;
  final String lastName;
  final String nationality;
  final String sex;
  final String documentType;
  final String addressLine1;
  final String addressLine2;
  final String region;
  final double totalElapsedSecs;

  factory DriversLicenseDTO.fromJson(Map<String, dynamic> json) =>
      DriversLicenseDTO(
        docType: json["docType"],
        dateOfIssue: DateTime.parse(json["dateOfIssue"]),
        height: json["height"],
        weight: json["weight"],
        eyeColor: json["eyeColor"],
        hairColor: json["hairColor"],
        documentDiscriminator: json["documentDiscriminator"],
        endorsements: json["endorsements"],
        restrictions: json["restrictions"],
        vehicleClassification: json["vehicleClassification"],
        countryRegion: json["countryRegion"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        dateOfExpiration: DateTime.parse(json["dateOfExpiration"]),
        documentNumber: json["documentNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        nationality: json["nationality"],
        sex: json["sex"],
        documentType: json["documentType"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        region: json["region"],
        totalElapsedSecs: json["totalElapsedSecs"],
      );

  Map<String, dynamic> toJson() => {
        "docType": docType,
        "dateOfIssue": dateOfIssue.toIso8601String(),
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hairColor": hairColor,
        "documentDiscriminator": documentDiscriminator,
        "endorsements": endorsements,
        "restrictions": restrictions,
        "vehicleClassification": vehicleClassification,
        "countryRegion": countryRegion,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "dateOfExpiration": dateOfExpiration.toIso8601String(),
        "documentNumber": documentNumber,
        "firstName": firstName,
        "lastName": lastName,
        "nationality": nationality,
        "sex": sex,
        "documentType": documentType,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "region": region,
        "totalElapsedSecs": totalElapsedSecs,
      };
}
