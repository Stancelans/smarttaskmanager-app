import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:smarttaskmanager/service_locator.dart';
import 'package:smarttaskmanager/services/application_config_service.dart';

class AppBaseViewModel extends ChangeNotifier {

  final Logger logger = Logger();
  final ApplicationConfigService applicationConfigService =
  locator<ApplicationConfigService>();

}