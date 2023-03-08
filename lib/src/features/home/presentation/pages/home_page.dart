import 'package:flutter/material.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: context.textTheme.displayLarge,
        ),
      ),
    );
  }
}
