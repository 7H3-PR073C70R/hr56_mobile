import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PageWithNestedRouteScaffold extends StatelessWidget {
  const PageWithNestedRouteScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.fab,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? fab;

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
          floatingActionButton: fab,
        ),
      ),
    );
  }
}
