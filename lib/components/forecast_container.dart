import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weathe_self/network/remote/dio%20helper.dart';

import '../utils/constants.dart';

class ForecastContainer extends StatelessWidget {
  ForecastContainer({this.date, this.pathImage, required this.txt, this.grade});
  var date;
  String? pathImage="";
  String txt="";
  double? grade;
  // List? timeline;
  // final int index;

  @override
  Widget build(BuildContext context) {
    // int weatherCode = timeline![1].intervals[index].values.weatherCode;
    // String weatherCodeName = DioHelper.handleWeatherCode(weatherCode);
    // String weatherCodeIcon = DioHelper.handleWeatherIcon(weatherCodeName);
    return Container(
      color: AppColors.blueContainerColor,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                .format(date)
                .toString(),
            style: const TextStyle(fontSize: 16, color: AppColors.greyShade1),
          ),
          const SizedBox(height: 10),
          Image(
            image: AssetImage(pathImage!),
            width: 55,
            height: 60,
          ),
          const SizedBox(height: 30),
          Text(
            txt,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: AppColors.greyShade1,

            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$grade°F',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.greyShade1,
            ),
          ),
        ],
      ),
    );
  }
}
/*import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weathe_self/network/remote/dio%20helper.dart';

import '../utils/constants.dart';

class ForecastContainer extends StatelessWidget {
  ForecastContainer(
      {Key? key, required this.timeline,  this.index})
      : super(key: key);

  List? timeline;
   int? index;

  @override
  Widget build(BuildContext context) {
    // int weatherCode = timeline![1].intervals[index].values.weatherCode;
    // String weatherCodeName = DioHelper.handleWeatherCode(weatherCode);
    // String weatherCodeIcon = DioHelper.handleWeatherIcon(weatherCodeName);
    return Container(
      color: AppColors.blueContainerColor,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                .format(timeline?[1].intervals[index].startTime.toLocal())
                .toString(),
            style: const TextStyle(fontSize: 16, color: AppColors.greyShade1),
          ),
          const SizedBox(height: 10),
          Image(
            image: AssetImage(weatherCodeIcon),
            width: 55,
            height: 60,
          ),
          const SizedBox(height: 30),
          Text(
            weatherCodeName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: AppColors.greyShade1,

            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${timeline?[1].intervals[index].values.temperature}°F',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.greyShade1,
            ),
          ),
        ],
      ),
    );
  }
}
*/