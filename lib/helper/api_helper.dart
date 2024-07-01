import 'package:weather_app/headers.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  final String _url = 'https://api.openweathermap.org';
  final String _appId = '985df43ce8e64751ae4eb20c7d0593ef';

  Future<List<City>> allCitiesApi({required String city}) async {
    List<City> allCities = [];
    String allCitiesApi = '$_url/geo/1.0/direct?q=$city&limit=5&appid=$_appId';
    http.Response cityResponse = await http.get(Uri.parse(allCitiesApi));

    if (cityResponse.statusCode == 200) {
      List data = jsonDecode(cityResponse.body);
      allCities = data.map((e) => City.fromJson(e)).toList();
    }
    return allCities;
  }

  Future<CityWeather> cityWeatherApi({required City city}) async {
    CityWeather cityWeather = CityWeather.fromJson({});
    String searchCityApi =
        '$_url/data/2.5/weather?lat=${city.lat.toString()}&lon=${city.lon.toString()}&appid=$_appId';
    http.Response cityWeatherResponse =
        await http.get(Uri.parse(searchCityApi));

    if (cityWeatherResponse.statusCode == 200) {
      Map cityWeatherMap = jsonDecode(cityWeatherResponse.body);
      cityWeather =
          CityWeather.fromJson(cityWeatherMap as Map<String, dynamic>);
    }
    return cityWeather;
  }
}
