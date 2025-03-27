import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:smarttaskmanager/constants/app_route_name.dart';
import 'package:smarttaskmanager/model/task.dart';
import 'package:smarttaskmanager/service_locator.dart';
import 'package:smarttaskmanager/services/application_config_service.dart';
import 'package:smarttaskmanager/services/navigation_service.dart';

class AppBaseViewModel extends ChangeNotifier {

  final Logger logger = Logger();
  final ApplicationConfigService applicationConfigService = locator<ApplicationConfigService>();

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome({bool clearBackStack = true}) {
    if (!clearBackStack) {
      _navigationService.navigateTo(AppRouteName.homeViewRoute);
    } else {
      _navigationService.navigateToWithNoBack(AppRouteName.homeViewRoute);
    }
  }

  navigateToTaskCreation() {
    _navigationService.navigateTo(AppRouteName.taskCreationView);
  }

  navigateToTaskDetail(Task task) {
    _navigationService.navigateTo(AppRouteName.taskDetailView, arguments: task);
  }
}