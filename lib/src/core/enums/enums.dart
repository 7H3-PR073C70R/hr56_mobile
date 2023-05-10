enum ViewState {
  idle,
  processing,
  success,
  error,
}

enum LeaveStatus {
  pending,
  approved,
  denied,
}

enum NotificationType {
  loan,
  leave,
  payroll,
  wallet,
}

enum LoanStatus {
  approved,
  pending,
  declined,
  disbursed,
}

enum UserInformation {
  personal,
  spouse,
  nextOfKin,
  bank,
  guarantor,
  emergency,
  reference,
}

enum LeaveType {
  parental,
  sick,
  hospital,
  maternal,
}

enum DisciplinaryType {
  queries,
  warnings,
  suspensions,
}
