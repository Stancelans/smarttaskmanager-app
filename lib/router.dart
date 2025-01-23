import 'package:flutter/material.dart';
import 'package:smarttaskmanager/views/onboarding/onboard_view.dart';

import 'constants/app_route_name.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouteName.onBoardViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const OnboardView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow!);
}