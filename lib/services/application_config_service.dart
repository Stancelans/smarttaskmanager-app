import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationConfigService {
  late SharedPreferences _preferences;
  final Logger _logger = Logger();

  bool onBoardedAlready() {
    bool result = _preferences.getBool(_onBoarded) ?? false;
    _logger.i('ApplicationConfig.onBoardedAlready =>$result');
    return result;
  }

  Future<void> getSharedPreferences() async {
    _logger.i('ApplicationDataService.getSharedPreferences');
    _preferences = await SharedPreferences.getInstance();
  }

  void setOnBoarded() async {
    _preferences.setBool(_onBoarded, true);
  }

}

const String _onBoarded = 'onBoarded';