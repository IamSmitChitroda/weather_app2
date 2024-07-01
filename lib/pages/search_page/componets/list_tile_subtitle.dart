import 'package:flutter/widgets.dart';

Widget listTileSubtitle({required index, required controller}) =>
    Text('${controller.allCities[index].state.replaceFirst(
      controller.allCities[index].state[0].toUpperCase(),
      controller.allCities[index].state[0].toUpperCase(),
    )} ${controller.allCities[index].country.replaceFirst(
      controller.allCities[index].country[0].toUpperCase(),
      controller.allCities[index].country[0].toUpperCase(),
    )}');
