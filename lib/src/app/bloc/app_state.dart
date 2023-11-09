part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial({
    @Default([]) List<Bank> banks,
    @Default([]) List<Hospital> hospitals,
    @Default([]) List<PensionAdmin> pensionAdmins,
    @Default([]) List<StateResponse> states,
  }) = _Initial;
}
