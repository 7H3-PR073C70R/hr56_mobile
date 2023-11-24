import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hr56_staff/src/core/constants/app_spacing.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/validator.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/presentation/blocs/leave_bloc.dart';
import 'package:hr56_staff/src/shared/button.dart';
import 'package:hr56_staff/src/shared/custom_app_bar_with_back_button.dart';
import 'package:hr56_staff/src/shared/custom_dialog.dart';
import 'package:hr56_staff/src/shared/custom_dialog_builder.dart';
import 'package:hr56_staff/src/shared/custom_drop_down_button.dart';
import 'package:hr56_staff/src/shared/custom_input_field.dart';
import 'package:hr56_staff/src/shared/date_picker_form_card.dart';
import 'package:hr56_staff/src/shared/empty_app_bar.dart';

class RequestLeavePage extends HookWidget {
  const RequestLeavePage({super.key});

  static const routeName = 'request-leave';
  @override
  Widget build(BuildContext context) {
    final daysController = useTextEditingController();
    final relived = useTextEditingController();
    final selectedLeaveDate = useState<DateTime?>(null);
    final purpose = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<LeaveBloc, LeaveState>(
          buildWhen: (previous, current) {
            if (previous.viewState.isProcessing &&
                current.viewState.isSuccess) {
              showDialog<Widget>(
                context: context,
                builder: (ctx) => CustomDialogBuilder(
                  buttonText: 'Proceed',
                  child: Text(
                    'You have selected '
                    '${current.selectedLeaveType?.name ?? ''}',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 15.fontSize,
                      color: const Color(0xFF778790),
                    ),
                  ),
                  onPressed: () => showDialog<Widget>(
                    context: context,
                    builder: (ctx) => CustomDialog(
                      title: 'Leave Request Submitted',
                      description: 'Your leave request '
                          'has been submitted  for review.',
                      actionText: 'Back home',
                      onActionPressed: () {
                        Navigator.of(ctx).pop();
                        context.popUntilMain();
                      },
                    ),
                  ),
                ),
              );
            } else if (previous.viewState.isProcessing &&
                current.viewState.isError) {
              context.showErrorSnackBar(
                message: current.errorMessage ?? 'Something went wrong',
              );
            }
            return true;
          },
          builder: (context, state) {
            return Column(
              children: [
                const CustomAppBarWithBackButton(
                  text: 'Request Leave',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppSpacing.setVerticalSpace(13),
                          CustomDropDownButton(
                            texts: state.leaveTypes
                                .map((e) => e.name ?? 'Unknown')
                                .toList(),
                            value: state.selectedLeaveType?.name,
                            label: 'Company type of leave',
                            hintText: 'Select leave type',
                            onChanged: (value) => context.read<LeaveBloc>().add(
                                  LeaveEvent.selectLeaveType(value ?? ''),
                                ),
                          ),
                          AppSpacing.setVerticalSpace(12),
                          CustomInputField(
                            label: 'How long are you going to take (days)',
                            hintText: '9',
                            keyboardType: TextInputType.number,
                            validator: context.validateFieldNotEmpty,
                            controller: daysController,
                          ),
                          AppSpacing.setVerticalSpace(12),
                          CustomInputField(
                            label: 'The relived',
                            hintText: 'Tobi Hassan',
                            validator: context.validateFieldNotEmpty,
                            controller: relived,
                          ),
                          AppSpacing.setVerticalSpace(12),
                          DatePickerFormCard(
                            label: 'Proposed date of leave',
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 200),
                            ),
                            hintText: '12/3/2023',
                            onChanged: (value) =>
                                selectedLeaveDate.value = value,
                          ),
                          AppSpacing.setVerticalSpace(12),
                          CustomInputField(
                            label: 'Purpose for leave request',
                            hintText: 'period leave i have my period and i am'
                                ' taking a mandatory, leave.',
                            maxLines: 10,
                            validator: context.validateFieldNotEmpty,
                            controller: purpose,
                          ),
                          AppSpacing.setVerticalSpace(40),
                          Button(
                            enable: selectedLeaveDate.value != null &&
                                state.selectedLeaveType != null,
                            isBusy: state.viewState.isProcessing,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LeaveBloc>().add(
                                      LeaveEvent.createLeave(
                                        CreateLeaveParam(
                                          startDate: selectedLeaveDate.value!
                                              .toIso8601String(),
                                          endDate: selectedLeaveDate.value!
                                              .add(
                                                Duration(
                                                  days: int.tryParse(
                                                        daysController.text,
                                                      ) ??
                                                      0,
                                                ),
                                              )
                                              .toIso8601String(),
                                          specificDateTime: selectedLeaveDate
                                              .value!
                                              .toIso8601String(),
                                          leaveTypeId:
                                              state.selectedLeaveType!.id ?? 0,
                                          relieverId: 1,
                                          reason: purpose.text,
                                          attachment: 'attachment',
                                        ),
                                      ),
                                    );
                              }
                            },
                            text: 'Submit request',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
