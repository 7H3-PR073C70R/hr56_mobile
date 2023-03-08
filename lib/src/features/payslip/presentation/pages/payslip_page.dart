import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class PayslipPage extends StatelessWidget {
  const PayslipPage({super.key});

  static const routeName = 'payslip';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Payslip',
          style: context.textTheme.displayLarge,
        ),
      ),
    );
  }
}
