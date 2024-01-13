import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal/appraisal.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_details/appraisal_details.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/get_appraisal_details_use_case.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/get_appraisal_use_case.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/take_appraisal_use_case.dart';

part 'appraisal_event.dart';
part 'appraisal_state.dart';
part 'appraisal_bloc.freezed.dart';

class AppraisalBloc extends Bloc<AppraisalEvent, AppraisalState> {
  AppraisalBloc(
    this._getAppraisalUseCase,
    this._getAppraisalDetailsUseCase,
    this._takeAppraisalUseCase,
  ) : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_GetAppraisal>(_onGetAppraisal);
    on<_GetAppraisalDetails>(_onGetAppraisalDetails);
    on<_GetAppraisalQuestionnaire>(_onGetAppraisalQuestionnaire);
    on<_UpdateAppraisalQuestionAndAnswer>(_onUpdateAppraisalQuestionAndAnswer);
  }

  final GetAppraisalUseCase _getAppraisalUseCase;
  final GetAppraisalDetailsUseCase _getAppraisalDetailsUseCase;
  final TakeAppraisalUseCase _takeAppraisalUseCase;

  FutureOr<void> _onStarted(_Started event, Emitter<AppraisalState> emit) {
    add(const _GetAppraisal());
  }

  FutureOr<void> _onGetAppraisal(
    _GetAppraisal event,
    Emitter<AppraisalState> emit,
  ) async {
    emit(
      state.copyWith(
        viewState: ViewState.processing,
      ),
    );
    await _getAppraisalUseCase(NoParams()).then(
      (value) => value.fold(
        (error) => emit(
          state.copyWith(
            viewState: ViewState.error,
            errorMessage: error.message,
          ),
        ),
        (appraisals) => emit(
          state.copyWith(
            viewState: ViewState.success,
            appraisal: appraisals,
          ),
        ),
      ),
    );
    emit(
      state.copyWith(
        viewState: ViewState.idle,
      ),
    );
  }

  FutureOr<void> _onGetAppraisalDetails(
    _GetAppraisalDetails event,
    Emitter<AppraisalState> emit,
  ) async {
    emit(
      state.copyWith(
        getAppraisalDetailsState: ViewState.processing,
      ),
    );
    await _getAppraisalDetailsUseCase(event.id).then(
      (value) => value.fold(
        (error) => emit(
          state.copyWith(
            getAppraisalDetailsState: ViewState.error,
            errorMessage: error.message,
          ),
        ),
        (appraisalDetails) => emit(
          state.copyWith(
            getAppraisalDetailsState: ViewState.success,
            appraisalDetails: appraisalDetails,
          ),
        ),
      ),
    );
    emit(
      state.copyWith(
        getAppraisalDetailsState: ViewState.idle,
      ),
    );
  }

  FutureOr<void> _onGetAppraisalQuestionnaire(
    _GetAppraisalQuestionnaire event,
    Emitter<AppraisalState> emit,
  ) async {
    emit(
      state.copyWith(
        getAppraisalQuestionnairesState: ViewState.processing,
      ),
    );
    await _takeAppraisalUseCase(event.id).then(
      (value) => value.fold(
        (error) => emit(
          state.copyWith(
            getAppraisalQuestionnairesState: ViewState.error,
            errorMessage: error.message,
          ),
        ),
        (appraisalQuestionnaire) => emit(
          state.copyWith(
            getAppraisalQuestionnairesState: ViewState.success,
            appraisalQuestionnaire: appraisalQuestionnaire,
            appraisalQuestionAndAnswer: [],
          ),
        ),
      ),
    );
    emit(
      state.copyWith(
        getAppraisalQuestionnairesState: ViewState.idle,
      ),
    );
  }

  FutureOr<void> _onUpdateAppraisalQuestionAndAnswer(
    _UpdateAppraisalQuestionAndAnswer event,
    Emitter<AppraisalState> emit,
  ) {
    emit(
      state.copyWith(
        appraisalQuestionAndAnswer: [
          ...state.appraisalQuestionAndAnswer.where(
            (qa) => qa.$1 != event.questionAndAnswer.$1,
          ),
          event.questionAndAnswer,
        ],
      ),
    );
  }
}
