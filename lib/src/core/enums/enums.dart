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
  nextOfKin,
  bank,
  guarantor,
  emergency,
}
