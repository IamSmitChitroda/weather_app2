import 'package:weather_app/headers.dart';

class ApiController extends GetxController {
  ApiController() {
    getAllCities();
  }
  RxList<City> allCities = <City>[].obs;
  RxList<CityWeather> cityWeather = <CityWeather>[].obs;
  RxList<CityWeather> favCityWeather = <CityWeather>[].obs;
  // final  RxCityWeather favCityW;

  Future<void> getAllCities({String city = 'Surat'}) async {
    allCities(await ApiHelper.apiHelper.allCitiesApi(city: city));
    if (city == 'Surat') {
      getCityWeather(
        city: (City.fromJson(
          {
            "name": "Surat",
            "lat": 21.2094892,
            "lon": 72.8317058,
            "country": "IN",
            "state": "Gujarat",
          },
        )),
      );
    }
  }

  Future<void> getCityWeather({required City city}) async {
    cityWeather[0] = await ApiHelper.apiHelper.cityWeatherApi(city: city);
  }

  void addFavCity({required CityWeather cityWeather}) {
    favCityWeather.add(cityWeather);
  }

  void removeFavCity({required CityWeather cityWeather}) {
    favCityWeather.remove(cityWeather);
  }
}
