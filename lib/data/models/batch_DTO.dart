import 'dart:convert';

import 'package:get/get.dart';

List<BatchDTO> batchFromJson(String str) =>
    List<BatchDTO>.from(json.decode(str).map((x) => BatchDTO.fromJson(x)));

String batchToJson(List<BatchDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BatchDTO {
  BatchDTO({
    this.payoutBatchGuid,
    this.bacthStatus,
    this.tipsFromDtutc,
    this.tipsToDtutc,
    this.tipsPulledDtutc,
    this.payoutSentDtutc,
    this.employeesInBatch,
    this.totalAmountTips,
  });

  late String? payoutBatchGuid = "".obs as String?;
  late int? bacthStatus = 0.obs as int?;
  late DateTime? tipsFromDtutc = DateTime.now().obs as DateTime?;
  late DateTime? tipsToDtutc = DateTime.now().obs as DateTime?;
  late DateTime? tipsPulledDtutc = DateTime.now().obs as DateTime?;
  late DateTime? payoutSentDtutc = DateTime.now().obs as DateTime?;
  late int? employeesInBatch = 0.obs as int?;
  late double? totalAmountTips = 0.obs as double?;

  factory BatchDTO.fromJson(Map<String, dynamic> json) => BatchDTO(
        payoutBatchGuid: json["payoutBatchGuid"],
        bacthStatus: json["bacthStatus"],
        tipsFromDtutc: DateTime.tryParse(json["tipsFromDTUTC"].toString()),
        tipsToDtutc: DateTime.tryParse(json["tipsToDTUTC"].toString()),
        tipsPulledDtutc: DateTime.tryParse(json["tipsPulledDTUTC"].toString()),
        payoutSentDtutc: DateTime.tryParse(json["payoutSentDTUTC"].toString()),
        employeesInBatch: json["employeesInBatch"],
        totalAmountTips: json["totalAmountTips"],
      );

  Map<String, dynamic> toJson() => {
        "payoutBatchGuid": payoutBatchGuid,
        "bacthStatus": bacthStatus,
        "tipsFromDTUTC": tipsFromDtutc,
        "tipsToDTUTC": tipsToDtutc,
        "tipsPulledDTUTC": tipsPulledDtutc,
        "payoutSentDTUTC": payoutSentDtutc,
        "employeesInBatch": employeesInBatch,
        "totalAmountTips": totalAmountTips,
      };
}
