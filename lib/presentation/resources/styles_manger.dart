import 'package:flutter/material.dart';
import 'package:new_movie_app/presentation/resources/fonts_manger.dart';
import 'package:new_movie_app/presentation/resources/values_manger.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color);
}

/// Light style
getLightStyle(
    {double fontSize = AppSizeManger.s12,
    required Color color,
    required FontWeight fontWeight}) {
  return _getTextStyle(fontSize, FontWeightManger.light, color);
}

/// Regular style
getRegularStyle({double fontSize = AppSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color);
}

/// Medium style
getMediumStyle({double fontSize = AppSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.medium, color);
}

/// SemiBold style
getSemiBoldStyle({double fontSize = AppSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.semiBold, color);
}

/// Bold style
getBoldStyle({double fontSize = AppSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.bold, color);
}
