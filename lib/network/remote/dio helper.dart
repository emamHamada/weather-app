import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/weather_model.dart';

class DioHelper {
  //create instance of dio package to be used
  static Dio? dio;
  static BaseOptions options = BaseOptions(
    baseUrl: 'https://api.tomorrow.io/',
    receiveDataWhenStatusError: true,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

//curl --request GET --url \
  //https://api.tomorrow.io/v4/timelines?location=40.758,-73.9855&fields=windSpeed&windDirection&temperature&temperatureApparent&weatherCode&humidity&visibility&dewPoint&cloudCover&precipitationType&temperature&timesteps=1d&units=imperial&apikey=idX2ZVn5gnqWIVUyi9av31Q55vhGbipj
// https://api.tomorrow.io/
// v4/timelines
// location=-73.98529171943665,40.75872069597532&fields=temperature&
// timesteps=1h&startTime= DateTime.now().toUtc().add(const Duration(minutes: 0)).toIso8601String()&
// units=metric
// apikey=idX2ZVn5gnqWIVUyi9av31Q55vhGbipj
  static init() {
    dio = Dio(options);
    debugPrint("$dio initialized");
  }

//replace with your ApiKEY
  //get your key from app.tomorrow.io/development/keys
  static const String apiKey = 'idX2ZVn5gnqWIVUyi9av31Q55vhGbipj';

  //pick a location to get the weather
  static const location = [40.758, -73.9855]; //New york

  //// list the fields you want to get from the api
  static const fields = [
    "windSpeed",
    "windDirection",
    "temperature",
    "temperatureApparent",
    "weatherCode",
    "humidity",
    "visibility",
    "dewPoint",
    "cloudCover",
    "precipitationType"
  ];

  // choose the unit system, either metric or imperial
  static const units = "imperial";

  // set the timesteps, like "current", "1h" and "1d"
  static const timesteps = ["current", "1d"];

  // configure the time frame up to 6 hours back and 15 days out
  static String startTime =
      DateTime.now().toUtc().add(const Duration(minutes: 0)).toIso8601String();
  static String endTime =
      DateTime.now().toUtc().add(const Duration(days: 4)).toIso8601String();
  static Response? res;

  static Future<Weather> getData() async {
    try {
      res = await dio?.get('v4/timelines', queryParameters: {
        'location': location.join(','),
        'apikey': apiKey,
        'fields': fields,
        'units': units,
        'timesteps': timesteps,
        'startTime': startTime,
        'endTime': endTime
      });
      debugPrint("the res ${res?.data.toString()}");
      return Weather.fromJson(res!.data);
    } on DioError catch (e) {
      debugPrint(e.response!.data);
      return e.response!.data;
    }
  }
  static String handleWeatherCode(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return "Unknown";
      case 1000:
        return 'Clear, Sunny';
      case 1100:
        return 'Mostly Clear';
      case 1101:
        return 'Partly Cloudy';
      case 1102:
        return 'Mostly Cloudy';
      case 1001:
        return 'Cloudy';
      case 2000:
        return 'Fog';
      case 4200:
        return 'Light Rain';
      case 6200:
        return 'Light Freezing Rain';
      default:
        return 'Unknown';
    }
  }

  static String handleWeatherIcon(String weatherCodeName) {
    switch (weatherCodeName) {
      case 'Clear, Sunny':
        return "assets/images/clear.png";
      case 'Mostly Clear':
        return 'assets/images/mostly_clear.png';
      case 'Partly Cloudy':
        return 'assets/images/partly_cloudy.png';
      case 'Mostly Cloudy':
        return 'assets/images/mostly_cloudy.png';
      case 'Cloudy':
        return 'assets/images/cloudy.png';
      case 'Fog':
        return 'assets/images/fog.png';
      case 'Light Rain':
        return 'assets/images/light_rain.png';
      case 'Light Freezing Rain':
        return 'assets/images/light_freezing_rain.png';
      default:
        return '';
    }
  }
}
