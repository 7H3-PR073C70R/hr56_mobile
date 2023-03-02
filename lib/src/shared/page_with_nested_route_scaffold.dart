import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PageWithNestedRouteScaffold extends StatelessWidget {
  const PageWithNestedRouteScaffold({
    super.key,
    required this.body,
    this.appBar,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: AutoRouter(
        inheritNavigatorObservers: false,
        placeholder: (context) => Scaffold(
          appBar: appBar,
          body: body,
        ),
      ),
    );
  }
}
