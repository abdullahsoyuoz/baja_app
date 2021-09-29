import 'package:baja_app/Utility/Colors.dart';
import 'package:flutter/material.dart';

class BajaTextStyles{
  static final contentTopLeftTitleStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: BajaAppColors.textGray);

  static final contentTopRightTitleStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: BajaAppColors.textGray.withOpacity(0.8));

  static final moodTextStyle = TextStyle(
    color: BajaAppColors.navyBlue,
    fontWeight: FontWeight.w500,
    fontSize: 11);

  static final productItemTitleTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: BajaAppColors.textGrayDark);

  static final productItemPriceTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: BajaAppColors.textGray,
  );

  static final categoryItemTitleTextStyle = TextStyle(
      color: BajaAppColors.orange,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 2);
}