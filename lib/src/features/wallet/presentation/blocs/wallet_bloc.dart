import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller/biller.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/cable_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_transaction_pin/create_transaction_pin_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_model.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/provider_data_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/transaction/transaction.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/bill_payment_user_info.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet/wallet.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/account_lookup_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/buy_electricity_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/create_transaction_pin_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/create_wallet_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_banks_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_billers_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_cable_plans_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_provider_data_plans_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_transaction_details_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_transactions_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_wallet_info_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/purchase_airtime_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/purchase_cable_tv_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/send_money_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/validate_bill_payment_user_use_case.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';
part 'wallet_bloc.freezed.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(
    this._accountLookupUseCase,
    this._buyElectricityUseCase,
    this._createWalletUseCase,
    this._getBanksUseCase,
    this._getBillersUseCase,
    this._getCablePlansUseCase,
    this._getProviderDataPlansUseCase,
    this._getTransactionDetailsUseCase,
    this._getTransactionsUseCase,
    this._getWalletInfoUseCase,
    this._purchaseAirtimeUseCase,
    this._purchaseCableTVUseCase,
    this._sendMoneyUseCase,
    this._validateBillPaymentUserUsecase,
    this._createTransactionPINUseCase,
  ) : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_AccountLookup>(_onAccountLookup);
    on<_BuyElectricity>(_onBuyElectricity);
    on<_GetBillers>(_onGetBillers);
    on<_GetCablePlans>(_onGetCablePlans);
    on<_GetProviderDataPlans>(_onGetProviderDataPlans);
    on<_GetTransactionDetails>(_onGetTransactionDetails);
    on<_GetTransaction>(_onGetTransaction);
    on<_GetWalletInfo>(_onGetWalletInfo);
    on<_PurchaseAirtime>(_onPurchaseAirtime);
    on<_PurchaseCableTV>(_onPurchaseCableTV);
    on<_SendMoney>(_onSendMoney);
    on<_ValidateBillPayment>(_onValidateBillPayment);
    on<_CreateTransactionPIN>(_onCreateTransactionPIN);
  }

  final AccountLookupUseCase _accountLookupUseCase;
  final BuyElectricityUseCase _buyElectricityUseCase;
  final CreateWalletUseCase _createWalletUseCase;
  final GetWalletBanksUseCase _getBanksUseCase;
  final GetBillersUseCase _getBillersUseCase;
  final GetCablePlansUseCase _getCablePlansUseCase;
  final GetProviderDataPlansUseCase _getProviderDataPlansUseCase;
  final GetTransactionDetailsUseCase _getTransactionDetailsUseCase;
  final GetTransactionsUseCase _getTransactionsUseCase;
  final GetWalletInfoUseCase _getWalletInfoUseCase;
  final PurchaseAirtimeUseCase _purchaseAirtimeUseCase;
  final PurchaseCableTVUseCase _purchaseCableTVUseCase;
  final SendMoneyUseCase _sendMoneyUseCase;
  final ValidateBillPaymentUserUsecase _validateBillPaymentUserUsecase;
  final CreateTransactionPINUseCase _createTransactionPINUseCase;

  FutureOr<void> _onStarted(
    _Started event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final banks = await _getBanksUseCase(NoParams());
    emit(
      state.copyWith(
        banks: banks.fold(
          (_) => [],
          (right) => right,
        ),
      ),
    );
    add(const _GetWalletInfo());
    add(const _GetTransaction());
  }

  FutureOr<void> _onAccountLookup(
    _AccountLookup event,
    Emitter<WalletState> emit,
  ) async {
    if (state.viewState.isProcessing) return;
    emit(state.copyWith(viewState: ViewState.processing));

    final accountLookup = await _accountLookupUseCase(event.param);

    accountLookup.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (accountLookup) => emit(
        state.copyWith(
          accountLookup: accountLookup,
          viewState: ViewState.success,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onBuyElectricity(
    _BuyElectricity event,
    Emitter<WalletState> emit,
  ) async {
    if (state.viewState.isProcessing) return;
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _buyElectricityUseCase(event.param);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onGetBillers(
    _GetBillers event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _getBillersUseCase(event.type);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (billers) => emit(
        state.copyWith(
          viewState: ViewState.success,
          billers: billers,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onGetCablePlans(
    _GetCablePlans event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _getCablePlansUseCase(event.serviceType);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (cablePlans) => emit(
        state.copyWith(
          viewState: ViewState.success,
          cablePlans: cablePlans,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onGetProviderDataPlans(
    _GetProviderDataPlans event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _getProviderDataPlansUseCase(event.billerId);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (providerDataPlans) => emit(
        state.copyWith(
          viewState: ViewState.success,
          providerDataPlans: providerDataPlans,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onGetTransactionDetails(
    _GetTransactionDetails event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _getTransactionDetailsUseCase(event.reference);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (transactionDetails) => emit(
        state.copyWith(
          viewState: ViewState.success,
          transactionDetails: transactionDetails,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onGetTransaction(
    _GetTransaction event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _getTransactionsUseCase(NoParams());

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (transactions) => emit(
        state.copyWith(
          viewState: ViewState.success,
          transactions: transactions,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onGetWalletInfo(
    _GetWalletInfo event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _getWalletInfoUseCase(NoParams());

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (walletInfo) => emit(
        state.copyWith(
          viewState: ViewState.success,
          walletInfo: walletInfo,
        ),
      ),
    );

    if (response.isLeft) {
      final response = await _createWalletUseCase(NoParams());
      response.fold((left) => null, (right) {
        add(const _GetWalletInfo());
      });
    }

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onPurchaseAirtime(
    _PurchaseAirtime event,
    Emitter<WalletState> emit,
  ) async {
    if (state.viewState.isProcessing) return;
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _purchaseAirtimeUseCase(event.param);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (providerDataPlans) => emit(
        state.copyWith(
          viewState: ViewState.idle,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onPurchaseCableTV(
    _PurchaseCableTV event,
    Emitter<WalletState> emit,
  ) async {
    if (state.viewState.isProcessing) return;
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _purchaseCableTVUseCase(event.param);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (providerDataPlans) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onSendMoney(
    _SendMoney event,
    Emitter<WalletState> emit,
  ) async {
    if (state.viewState.isProcessing) return;
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _sendMoneyUseCase(event.param);

    response.fold(
        (error) => emit(
              state.copyWith(
                errorMessage: error.message,
                viewState: ViewState.error,
              ),
            ), (providerDataPlans) {
      emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      );
      add(const _Started());
    });

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onValidateBillPayment(
    _ValidateBillPayment event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _validateBillPaymentUserUsecase(event.param);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (billPaymentUser) => emit(
        state.copyWith(
          viewState: ViewState.success,
          billPaymentUser: billPaymentUser,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onCreateTransactionPIN(
    _CreateTransactionPIN event,
    Emitter<WalletState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));

    final response = await _createTransactionPINUseCase(event.param);

    response.fold(
      (error) => emit(
        state.copyWith(
          errorMessage: error.message,
          viewState: ViewState.error,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
          transactionPINSet: true,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }
}
