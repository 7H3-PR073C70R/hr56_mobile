// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_colors.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/di/locator.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';
import 'package:hr56_staff/src/features/appraisal/presentation/blocs/appraisal_bloc.dart';
import 'package:hr56_staff/src/features/appraisal/presentation/pages/appraisal_feedback_page.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class AppraisalRequestFormPage extends HookWidget {
  const AppraisalRequestFormPage({
    super.key,
  });

  static const routeName = 'appraisal-request-form';

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);
    final selectedRadioIndex = useState(-1);
    final answerController = useTextEditingController();
    final user = useMemoized(() => locator<UserStorageService>().user);
    final hasText = useState(false);
    answerController.addListener(() {
      hasText.value = answerController.text.isNotEmpty;
    });
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: BlocBuilder<AppraisalBloc, AppraisalState>(
        buildWhen: (previous, current) {
          if (previous.getAppraisalQuestionnairesState.isProcessing &&
              current.getAppraisalQuestionnairesState.isError) {
            context.showErrorSnackBar(
              message:
                  current.errorMessage ?? 'Unable to get questionnaires state',
            );
            Navigator.of(context).pop();
          }
          return true;
        },
        builder: (context, state) {
          final questions =
              state.appraisalQuestionnaire?.appraisalQuestions ?? [];
          return Column(
            children: [
              const CustomAppBarWithBackButton(
                text: 'Appraisal Request',
              ),
              AppSpacing.setVerticalSpace(23),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.width),
                  child: BlocBuilder<AppraisalBloc, AppraisalState>(
                    builder: (context, state) {
                      if (state.getAppraisalQuestionnairesState.isProcessing) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.backgroundColor,
                          ),
                        );
                      }
                      return Column(
                        children: [
                          Text(
                            'Enhancing Excellence: ${state.appraisalDetails?.appraisalUser?.appraisalTitle}',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 14.fontSize,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2B2B2B),
                            ),
                          ),
                          AppSpacing.setVerticalSpace(25),
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              onPageChanged: (value) =>
                                  currentPage.value = value,
                              itemCount: questions.length,
                              itemBuilder: (_, index) => Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.height,
                                      horizontal: 8.width,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.radius),
                                      border: Border.all(
                                        color: const Color(0xFFCCCCCC),
                                      ),
                                    ),
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        Text(
                                          'Peer Appraisal for ${user?.firstName ?? ''}, ${state.appraisalDetails?.appraisalUser?.appraisalTitle}',
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 14.fontSize,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        AppSpacing.verticalSpaceMedium,
                                        Text(
                                          'Question ${currentPage.value + 1} of ${questions.length}',
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 13.fontSize,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF808080),
                                          ),
                                        ),
                                        AppSpacing.verticalSpaceTiny,
                                        Text(
                                          questions[currentPage.value]
                                                  .appraisalQuestion ??
                                              '',
                                          style: context.textTheme.displayLarge
                                              ?.copyWith(
                                            fontSize: 16.fontSize,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        AppSpacing.setVerticalSpace(12),
                                        if (questions[currentPage.value]
                                                .questionType ==
                                            'blank')
                                          CustomInputField(
                                            maxLines: 12,
                                            controller: answerController,
                                          )
                                        else ...[
                                          if (questions[index].optiona !=
                                              null) ...[
                                            QuestionSelectableOption(
                                              onChanged: (index) =>
                                                  selectedRadioIndex.value =
                                                      index,
                                              option: questions[index].optiona!,
                                              index: 0,
                                              isSelected:
                                                  selectedRadioIndex.value == 0,
                                            ),
                                            AppSpacing.setVerticalSpace(
                                              23,
                                            ),
                                          ],
                                          if (questions[index].optionb !=
                                              null) ...[
                                            QuestionSelectableOption(
                                              onChanged: (index) =>
                                                  selectedRadioIndex.value =
                                                      index,
                                              option: questions[index].optionb!,
                                              index: 1,
                                              isSelected:
                                                  selectedRadioIndex.value == 1,
                                            ),
                                            AppSpacing.setVerticalSpace(
                                              23,
                                            ),
                                          ],
                                          if (questions[index].optionc !=
                                              null) ...[
                                            QuestionSelectableOption(
                                              onChanged: (index) =>
                                                  selectedRadioIndex.value =
                                                      index,
                                              option: questions[index].optionc!,
                                              index: 2,
                                              isSelected:
                                                  selectedRadioIndex.value == 2,
                                            ),
                                            AppSpacing.setVerticalSpace(
                                              23,
                                            ),
                                          ],
                                          if (questions[index].optiond !=
                                              null) ...[
                                            QuestionSelectableOption(
                                              onChanged: (index) =>
                                                  selectedRadioIndex.value =
                                                      index,
                                              option: questions[index].optiond!,
                                              index: 3,
                                              isSelected:
                                                  selectedRadioIndex.value == 3,
                                            ),
                                            if (questions[index].optione !=
                                                null)
                                              AppSpacing.setVerticalSpace(
                                                23,
                                              ),
                                          ],
                                          if (questions[index].optione !=
                                              null) ...[
                                            QuestionSelectableOption(
                                              onChanged: (index) =>
                                                  selectedRadioIndex.value =
                                                      index,
                                              option: questions[index].optione!,
                                              index: 4,
                                              isSelected:
                                                  selectedRadioIndex.value == 4,
                                            ),
                                          ],
                                        ],
                                        AppSpacing.setVerticalSpace(24),
                                        Center(
                                          child: Button(
                                            enable: questions[currentPage.value]
                                                        .questionType ==
                                                    'blank'
                                                ? hasText.value
                                                : selectedRadioIndex.value !=
                                                    -1,
                                            width: 297.width,
                                            onPressed: () {
                                              addToQA(
                                                context,
                                                questions,
                                                index,
                                                currentPage,
                                                answerController,
                                                selectedRadioIndex,
                                              );
                                              if (currentPage.value + 1 <
                                                  questions.length) {
                                                selectedRadioIndex.value = -1;
                                                answerController.clear();
                                                pageController.nextPage(
                                                  duration: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                  curve: Curves.linear,
                                                );
                                                setPreviousAnswer(
                                                  questions,
                                                  currentPage,
                                                  answerController,
                                                  state,
                                                  selectedRadioIndex,
                                                  false,
                                                );
                                              } else {
                                                showDialog<dynamic>(
                                                  context: context,
                                                  builder: (ctx) =>
                                                      const _StartAppraisalDialog(),
                                                );
                                              }
                                            },
                                            text: currentPage.value + 1 <
                                                    questions.length
                                                ? 'Next'
                                                : 'Submit Appraisal',
                                          ),
                                        ),
                                        if (currentPage.value > 0) ...[
                                          AppSpacing.setVerticalSpace(24),
                                          Center(
                                            child: Button(
                                              width: 297.width,
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                              textColor: AppColors.successColor,
                                              border: Border.all(
                                                color: AppColors.successColor,
                                              ),
                                              onPressed: () {
                                                setPreviousAnswer(
                                                  questions,
                                                  currentPage,
                                                  answerController,
                                                  state,
                                                  selectedRadioIndex,
                                                  true,
                                                );
                                                pageController.previousPage(
                                                  duration: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                  curve: Curves.linear,
                                                );
                                              },
                                              text: 'Previous',
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void addToQA(
    BuildContext context,
    List<AppraisalQuestion> questions,
    int index,
    ValueNotifier<int> currentPage,
    TextEditingController answerController,
    ValueNotifier<int> selectedRadioIndex,
  ) {
    context.read<AppraisalBloc>().add(
          AppraisalEvent.updateAppraisalQuestionAndAnswer(
            (
              questions[index].appraisalQuestionId?.toString() ?? '',
              questions[currentPage.value].questionType == 'blank'
                  ? answerController.text
                  : (selectedRadioIndex.value == 0
                          ? questions[index].optiona
                          : selectedRadioIndex.value == 1
                              ? questions[index].optionb
                              : selectedRadioIndex.value == 2
                                  ? questions[index].optionc
                                  : selectedRadioIndex.value == 3
                                      ? questions[index].optiond
                                      : questions[index].optione) ??
                      '',
            ),
          ),
        );
  }

  void setPreviousAnswer(
    List<AppraisalQuestion> questions,
    ValueNotifier<int> currentPage,
    TextEditingController answerController,
    AppraisalState state,
    ValueNotifier<int> selectedRadioIndex,
    bool isPrevious,
  ) {
    final index = isPrevious ? currentPage.value - 1 : currentPage.value + 1;
    if (state.appraisalQuestionAndAnswer.length - 1 < index) return;
    if (questions[index].questionType == 'blank') {
      answerController.text = state.appraisalQuestionAndAnswer
          .firstWhere(
            (element) =>
                element.$1 == questions[index].appraisalQuestionId?.toString(),
            orElse: () => ('', ''),
          )
          .$2;
    } else {
      final question = questions[index];
      final selectedOption =
          answerController.text = state.appraisalQuestionAndAnswer
              .firstWhere(
                (element) =>
                    element.$1 == question.appraisalQuestionId?.toString(),
                orElse: () => ('', ''),
              )
              .$2;
      if (question.optiona == selectedOption) {
        selectedRadioIndex.value = 0;
      } else if (question.optionb == selectedOption) {
        selectedRadioIndex.value = 1;
      } else if (question.optionc == selectedOption) {
        selectedRadioIndex.value = 2;
      } else if (question.optiond == selectedOption) {
        selectedRadioIndex.value = 3;
      } else if (question.optione == selectedOption) {
        selectedRadioIndex.value = 4;
      }
    }
  }
}

class QuestionSelectableOption extends StatelessWidget {
  const QuestionSelectableOption({
    super.key,
    required this.index,
    required this.option,
    required this.onChanged,
    required this.isSelected,
  });

  final int index;
  final String option;
  final ValueChanged<int> onChanged;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(index),
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Container(
            height: 20.radius,
            width: 20.radius,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? const Color(
                        0xFF0671E0,
                      )
                    : const Color(
                        0xFF89939E,
                      ),
              ),
            ),
            child: CircleAvatar(
              radius: 6.radius,
              backgroundColor: isSelected
                  ? const Color(
                      0xFF0671E0,
                    )
                  : Colors.transparent,
            ),
          ),
          AppSpacing.horizontalSpaceSmall,
          Text(
            option,
            style: context.textTheme.displayLarge?.copyWith(
              fontSize: 14.fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _StartAppraisalDialog extends StatelessWidget {
  const _StartAppraisalDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 12.width,
      ),
      alignment: Alignment.center,
      backgroundColor: AppColors.whiteColor,
      insetAnimationCurve: Curves.bounceInOut,
      insetAnimationDuration: const Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.width),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.setVerticalSpace(14),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(),
                child: CircleAvatar(
                  radius: 12.radius,
                  backgroundColor: AppColors.blackColor,
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            AppSpacing.setVerticalSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.width),
              child: Text(
                'Appraisal Submitted Successfully',
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 16.fontSize,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            AppSpacing.verticalSpaceMedium,
            Text(
              'Hello ${locator<UserStorageService>().user?.firstName}, You '
              'are about to begin appraisal survey.',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 14.fontSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF555555),
              ),
            ),
            AppSpacing.setVerticalSpace(34),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.width),
              child: Button(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.navigator.pushNamed(AppraisalFeedbackPage.routeName);
                },
                text: 'Continue to feedback',
              ),
            ),
            AppSpacing.setVerticalSpace(47),
          ],
        ),
      ),
    );
  }
}
