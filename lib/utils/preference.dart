import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Future<void> saveBestScore(int bestScore) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('bestScore', bestScore);
  }

  static Future<int> readBestScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('bestScore') ?? 0;
  }
}
