import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr56_staff/src/app/router/app_router.dart';
import 'package:hr56_staff/src/core/constants/app_asset_path.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/fund_wallet_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/transfer/transfer_page.dart';
import 'package:hr56_staff/src/features/wallet/presentation/pages/withdraw_page.dart';

extension ResponsiveExtension on num {
  double get width => w;
  double get height => h;
  double get fontSize => sp;
  double get radius => r;
}

extension RouterExtension on BuildContext {
  StackRouter get navigator => router;
  void popUntilMain() => navigator.popUntil(
        (route) => route.settings.name == MainRoute.name,
      );
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension ViewStateExtension on ViewState {
  bool get isIdle => this == ViewState.idle;
  bool get isProcessing => this == ViewState.processing;
  bool get isSuccess => this == ViewState.success;
  bool get isError => this == ViewState.error;
}

extension LeaveStatusExtension on LeaveStatus {
  bool get isPending => this == LeaveStatus.pending;
  bool get isApproved => this == LeaveStatus.approved;
  bool get isDenied => this == LeaveStatus.denied;

  Color get color {
    switch (this) {
      case LeaveStatus.pending:
        return const Color(0xFFF3A804);
      case LeaveStatus.approved:
        return const Color(0xFF039847);
      case LeaveStatus.denied:
        return const Color(0xFFEE2011);
    }
  }
}

extension LoanStatusExtension on LoanStatus {
  bool get isApproved => this == LoanStatus.approved;
  bool get isPending => this == LoanStatus.pending;
  bool get isDecline => this == LoanStatus.declined;
  bool get isDisbursed => this == LoanStatus.disbursed;

  Color get color {
    switch (this) {
      case LoanStatus.approved:
        return const Color(0xFF00BA00);
      case LoanStatus.pending:
        return const Color(0xFFF3A804);
      case LoanStatus.declined:
        return const Color(0xFFCC1D10);
      case LoanStatus.disbursed:
        return const Color(0xFF037EEF);
    }
  }
}

extension UserInfoExtension on UserInformation {
  String get text1 {
    switch (this) {
      case UserInformation.personal:
      case UserInformation.spouse:
        return 'Cheers almost there fill in your';
      case UserInformation.nextOfKin:
        return 'Yes you are almost close, fill your';
      case UserInformation.bank:
        return 'Yes you are almost close, fill in';
      case UserInformation.guarantor:
        return 'We feel it  you are closer than ever, fill in';
      case UserInformation.emergency:
        return 'Cheers you got here finally, fill in';
      case UserInformation.reference:
        return 'Pictures gives us memories, take';
    }
  }

  String get text2 {
    switch (this) {
      case UserInformation.personal:
      case UserInformation.spouse:
        return 'next of kin details.';
      case UserInformation.nextOfKin:
        return 'Bank details.';
      case UserInformation.bank:
        return 'Two(2) Guarantor  details';
      case UserInformation.guarantor:
        return 'Emergency contact';
      case UserInformation.emergency:
        return 'References';
      case UserInformation.reference:
        return 'ID Photo';
    }
  }

  String get buttonText {
    switch (this) {
      case UserInformation.personal:
      case UserInformation.spouse:
        return 'Fill next of kin details';
      case UserInformation.nextOfKin:
        return 'Fill bank details';
      case UserInformation.bank:
        return 'Fill guarantor details';
      case UserInformation.guarantor:
        return 'Fill emergency contact';
      case UserInformation.emergency:
        return 'Fill references';
      case UserInformation.reference:
        return 'Take photo';
    }
  }

  String get imagePath {
    switch (this) {
      case UserInformation.spouse:
      case UserInformation.personal:
      case UserInformation.reference:
      case UserInformation.emergency:
        return AppAssetPath.personalInfoSuccess;
      case UserInformation.nextOfKin:
        return AppAssetPath.nextOfKinSuccess;
      case UserInformation.bank:
      case UserInformation.guarantor:
        return AppAssetPath.guarantorSuccess;
    }
  }

  VoidCallback onPressed(BuildContext context, [bool isSpouse = false]) {
    switch (this) {
      case UserInformation.personal:
        if (isSpouse) {
          return () => context.navigator.replace(
                SpouseDetailsRoute(isAfterLogin: true),
              );
        } else {
          return () => context.navigator.replace(
                NextOfKinRoute(isAfterLogin: true),
              );
        }
      case UserInformation.spouse:
        return () => context.navigator.replace(
              NextOfKinRoute(isAfterLogin: true),
            );
      case UserInformation.nextOfKin:
        return () => context.navigator.replace(
              BankDetailsRoute(isAfterLogin: true),
            );
      case UserInformation.bank:
        return () => context.navigator.replace(
              GuarantorRoute(isAfterLogin: true),
            );
      case UserInformation.guarantor:
        return () => context.navigator.replace(
              EmergencyContactRoute(isAfterLogin: true),
            );
      case UserInformation.emergency:
        return () => context.navigator.replace(
              ReferenceRoute(isAfterLogin: true),
            );
      case UserInformation.reference:
        return () => context.navigator.replace(
              IDPhotoRoute(isAfterLogin: true),
            );
    }
  }
}

extension DisciplinaryTypeExtension on DisciplinaryType {
  String get title {
    switch (this) {
      case DisciplinaryType.queries:
        return 'Query';
      case DisciplinaryType.warnings:
        return 'Warning';
      case DisciplinaryType.suspensions:
        return 'Suspension';
    }
  }
}

extension LeaveTypeExtension on LeaveType {
  bool get isParental => this == LeaveType.parental;
  bool get isHospital => this == LeaveType.hospital;
  bool get isMaternal => this == LeaveType.maternal;
  bool get isSick => this == LeaveType.sick;

  String get title {
    switch (this) {
      case LeaveType.parental:
        return 'Parental Leave 5 days (s)';
      case LeaveType.sick:
        return 'Sick Leave 4 days (s)';
      case LeaveType.hospital:
        return 'Hospital Leave 10 days (s)';
      case LeaveType.maternal:
        return 'Maternal Leave 10 days (s)';
    }
  }

  String get iconPath {
    switch (this) {
      case LeaveType.parental:
        return AppAssetPath.parentalLeave;
      case LeaveType.hospital:
      case LeaveType.sick:
        return AppAssetPath.sickLeave;
      case LeaveType.maternal:
        return AppAssetPath.maternalLeave;
    }
  }
}

extension StringExtension on String {
  String get capitalizeFirst => this[0].toUpperCase() + substring(1);
}

extension WithdrawActionExtension on WalletAction {
  String get asset {
    switch (this) {
      case WalletAction.withdraw:
        return AppAssetPath.withdraw;
      case WalletAction.send:
        return AppAssetPath.send;
      case WalletAction.fund:
        return AppAssetPath.wallet;
    }
  }

  String get title {
    switch (this) {
      case WalletAction.withdraw:
        return 'Withdraw';
      case WalletAction.send:
        return 'Send';
      case WalletAction.fund:
        return 'Fund Wallet';
    }
  }

  String get route {
    switch (this) {
      case WalletAction.withdraw:
        return WithdrawPage.routeName;
      case WalletAction.send:
        return TransferPage.routeName;
      case WalletAction.fund:
        return FundWalletPage.routeName;
    }
  }
}

extension ServicesExtension on Services {
  String get title {
    switch (this) {
      case Services.data:
        return 'Data';
      case Services.airtime:
        return 'Airtime';
      case Services.cable:
        return 'Tv/Cable';
      case Services.electricity:
        return 'Electricity';
      case Services.education:
        return 'Education';
    }
  }

  String get asset {
    switch (this) {
      case Services.data:
        return AppAssetPath.data;
      case Services.airtime:
        return AppAssetPath.airtime;
      case Services.cable:
        return AppAssetPath.tv;
      case Services.electricity:
        return AppAssetPath.electricity;
      case Services.education:
        return AppAssetPath.education;
    }
  }
}

extension FundWalletExtension on FundWallet {
  bool get isTransfer => this == FundWallet.transfer;
  bool get isUSSD => this == FundWallet.ussd;

  String get title {
    switch (this) {
      case FundWallet.transfer:
        return 'Bank Transfer';
      case FundWallet.ussd:
        return 'USSD';
    }
  }

  String get asset {
    switch (this) {
      case FundWallet.transfer:
        return AppAssetPath.bank;
      case FundWallet.ussd:
        return AppAssetPath.ussd;
    }
  }

  String get description {
    switch (this) {
      case FundWallet.transfer:
        return 'Add money via mobile or internet banking';
      case FundWallet.ussd:
        return 'Add money via mobile or internet banking';
    }
  }
}

extension BankExtension on Bank {
  
  bool get isGt => this == Bank.gt;
  bool get isZenith => this == Bank.zenith;
  bool get isAccess => this == Bank.access;
  bool get isPolaris => this == Bank.polaris;
  bool get isWema => this == Bank.wema;

  String get asset {
    switch (this) {
      case Bank.access:
        return AppAssetPath.access;
      case Bank.gt:
        return AppAssetPath.gt;
      case Bank.polaris:
        return AppAssetPath.polaris;
      case Bank.wema:
        return AppAssetPath.wema;
      case Bank.zenith:
        return AppAssetPath.zenith;
    }
  }

  String get name {
    switch (this) {
      case Bank.access:
        return 'Access Bank';
      case Bank.gt:
        return 'GTBank';
      case Bank.polaris:
        return 'Polaris Bank';
      case Bank.wema:
        return 'Wema Bank';
      case Bank.zenith:
        return 'Zenith Bank';
    }
  }

  String get pin {
    switch (this) {
      case Bank.access:
        return '901';
      case Bank.gt:
        return '737';
      case Bank.polaris:
        return '833';
      case Bank.wema:
        return '945';
      case Bank.zenith:
        return '966';
    }
  }
}
