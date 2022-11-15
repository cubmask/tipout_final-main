import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tipout_final/data/enums/payout_batch_status.dart';

class BatchCardItem extends StatelessWidget {
  BatchCardItem({
    Key? key,
    this.payoutBatchGuid,
    this.bacthStatus,
    this.tipsFromDtutc,
    this.tipsToDtutc,
    this.tipsPulledDtutc,
    this.payoutSentDtutc,
    this.employeesInBatch,
    this.totalAmountTips,
  }) : super(key: key);

  final String? payoutBatchGuid;
  final int? bacthStatus;
  final DateTime? tipsFromDtutc;
  final DateTime? tipsToDtutc;
  final DateTime? tipsPulledDtutc;
  final DateTime? payoutSentDtutc;
  final int? employeesInBatch;
  final double? totalAmountTips;
  final usCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        //height: 150,
        //width: 350,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                payoutBatchGuid ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                getPayoutBatchStatusUiString(
                    PayoutBatchStatus.values[bacthStatus!]),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat().format(tipsFromDtutc!),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                (employeesInBatch == null)
                    ? "Batch Total Employees: 0"
                    : "Batch Total Employees: ${employeesInBatch.toString()}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                (totalAmountTips == null)
                    ? "\$0.00"
                    : usCurrency.format(totalAmountTips),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
