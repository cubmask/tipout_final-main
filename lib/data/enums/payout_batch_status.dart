enum PayoutBatchStatus {
  active,
  requested,
  onHold,
  cancelled,
  complete,
}

String getPayoutBatchStatusUiString(PayoutBatchStatus batchStatus) {
  switch (batchStatus) {
    case PayoutBatchStatus.active:
      return "Active";
    case PayoutBatchStatus.requested:
      return "Requested";
    case PayoutBatchStatus.onHold:
      return "On Hold";
    case PayoutBatchStatus.cancelled:
      return "Cancelled";
    case PayoutBatchStatus.complete:
      return "Complete";
  }
}
