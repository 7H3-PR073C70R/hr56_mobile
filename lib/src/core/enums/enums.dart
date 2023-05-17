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

enum WalletAction {
  withdraw,
  send,
  fund,
}

enum Services {
  data,
  airtime,
  cable,
  electricity,
  education
}

enum FundWallet {
  transfer,
  ussd,
}

enum Bank {
  access,
  gt,
  polaris,
  wema,
  zenith,
}
