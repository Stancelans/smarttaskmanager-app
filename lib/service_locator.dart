import 'dart:developer' as developer;
import 'package:get_it/get_it.dart';
import 'package:smarttaskmanager/services/api_service.dart';
import 'package:smarttaskmanager/services/application_config_service.dart';
import 'package:smarttaskmanager/services/navigation_service.dart';
import 'package:smarttaskmanager/views/app_base_view_model.dart';


final GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  developer.log("Setting Up Locator Service");

  locator.registerLazySingleton(() => ApplicationConfigService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());

  locator.registerFactory(() => AppBaseViewModel());
}
