// ignore_for_file: constant_identifier_names

import 'package:hr56_staff/src/core/constants/app_asset_path.dart';

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

enum TvCable {
  starTimes,
  dstv,
  showMax,
  goTv;

  bool get isStarTimes => this == TvCable.starTimes;
  bool get isDstv => this == TvCable.dstv;
  bool get isShowMax => this == TvCable.showMax;
  bool get isGoTv => this == TvCable.goTv;

  String get assets {
    switch (this) {
      case starTimes:
        return AppAssetPath.starTimes;
      case TvCable.dstv:
        return AppAssetPath.dstv;
      case TvCable.showMax:
        return AppAssetPath.showMax;
      case TvCable.goTv:
        return AppAssetPath.goTv;
    }
  }

  String get name {
    switch (this) {
      case starTimes:
        return 'StarTimes';
      case TvCable.dstv:
        return 'DSTV';
      case TvCable.showMax:
        return 'ShowMax';
      case TvCable.goTv:
        return 'GOtv';
    }
  }
}

enum NetworkProvider {
  glo,
  airtel,
  nineMobile,
  mtn;

  String get assets {
    switch (this) {
      case glo:
      case airtel:
      case mtn:
      case nineMobile:
        return AppAssetPath.glo;
    }
  }

  String get name {
    switch (this) {
      case glo:
        return 'Glo';
      case airtel:
        return 'Airtel';
      case mtn:
        return 'MTN';
      case nineMobile:
        return '9Mobile';
    }
  }
}

enum ElectricityBiller {
  ikeja,
  ibadan,
  abuja,
  eko;

  String get assets {
    switch (this) {
      case ikeja:
      case ibadan:
      case abuja:
      case eko:
        return AppAssetPath.glo;
    }
  }

  String get name {
    switch (this) {
      case ikeja:
        return 'Ikeja Electric';
      case ibadan:
        return 'Ibadan Electricity';
      case abuja:
        return 'Abuja Electricity';
      case eko:
        return 'Eko Electricity';
    }
  }
}
