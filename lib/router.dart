import 'package:flutter/material.dart';
import 'package:smarttaskmanager/views/home/home_view.dart';
import 'package:smarttaskmanager/views/home/task/task_creation_view.dart';
import 'package:smarttaskmanager/views/home/task/task_detail_view.dart';
import 'package:smarttaskmanager/views/onboarding/onboard_view.dart';

import 'constants/app_route_name.dart';
import 'model/task.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouteName.onBoardViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const OnboardView());

    case AppRouteName.homeViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const HomeView());

    case AppRouteName.taskCreationView:
      return _getPageRoute(
          routeName: settings.name, viewToShow: const TaskCreationView());

    case AppRouteName.taskDetailView:
      final task = settings.arguments as Task;
      return _getPageRoute(
          routeName: settings.name, viewToShow: TaskDetailView(task: task));

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