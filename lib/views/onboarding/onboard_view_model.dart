import 'package:smarttaskmanager/views/app_base_view_model.dart';

class OnboardViewModel extends AppBaseViewModel {
  Future<void> initialize() async {
    await applicationConfigService.getSharedPreferences();
    if (applicationConfigService.onBoardedAlready()) {
      // navigate to login
      navigateToHome(clearBackStack: false);
    }
  }

  void onIntroEnd() async {
    applicationConfigService.setOnBoarded();
    // navigate to login
    navigateToHome(clearBackStack: false);
  }
}