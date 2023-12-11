// ignore_for_file: constant_identifier_names

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

enum Services { data, airtime, cable, electricity, education }

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

enum SnackBarType {
  error,
  success,
  info;

  bool get isError => this == SnackBarType.error;
  bool get isSuccess => this == SnackBarType.success;
  bool get isInfo => this == SnackBarType.info;
}

enum Gender {
  male,
  female,
  other,
}

enum MaritalStatus {
  single,
  married,
  divorced,
  separated,
  other,
}

enum RelationShip {
  father,
  mother,
  brother,
  sister,
  uncle,
  aunt,
  nephew,
  niece,
  cousin,
  grandfather,
  grandmother,
  grandson,
  granddaughter,
  husband,
  wife,
  son,
  daughter,
  father_in_law,
  mother_in_law,
  brother_in_law,
  sister_in_law,
  son_in_law,
  daughter_in_law,
  other,
}

enum IdentificationMeans {
  national_id_card,
  voters_card,
  drivers_license,
  international_passport,
}

enum AppraisalStatus {
  approved,
  declined,
  pending,
}
