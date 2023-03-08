import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  static const routeName = 'wallet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Wallet',
          style: context.textTheme.displayLarge,
        ),
      ),
    );
  }
}
