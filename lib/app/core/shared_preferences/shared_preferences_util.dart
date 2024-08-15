import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:olimpiadas_paris/app/models/country_model.dart';

class SharedPreferencesUtil {

SharedPreferencesUtil._();

  static const String _favoriteCountryKey = 'favoriteCountry';

  static Future<void> saveFavoriteCountry(CountryModel country) async {
    final prefs = await SharedPreferences.getInstance();
    final countryJson = jsonEncode(country.toMap());
    prefs.setString(_favoriteCountryKey, countryJson);
  }

  static Future<CountryModel?> getFavoriteCountry() async {
    final prefs = await SharedPreferences.getInstance();
    final countryJson = prefs.getString(_favoriteCountryKey);

    if (countryJson != null) {
      final Map<String, dynamic> countryMap = jsonDecode(countryJson);
      final country = CountryModel.fromMap(countryMap);
      return country;
    }
    return null;
  }

  static void clearFavoriteCountry()async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_favoriteCountryKey);
  }


}
