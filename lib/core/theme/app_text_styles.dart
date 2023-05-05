import 'package:flutter/material.dart';
import 'app_dimension.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

///Text Themes
const roboto24PrimaryColor = TextStyle(
  color: primaryColor,
  fontSize: DIMENSION_24,
  fontFamily: FontNames.robotoMono,
);

const roboto14PrimaryColor = TextStyle(
    fontSize: DIMENSION_14,
    fontFamily: FontNames.robotoMono,
    height: 1.4,
    color: primaryColor);

const textFormFieldStyle = TextStyle(
    color: textFormLabelColor,
    fontSize: 16,
    fontFamily: FontNames.robotoMono,
    fontWeight: FontWeight.w400);

const textFormFieldLabelStyle = TextStyle(
    color: textFormLabelColor,
    fontSize: 16,
    fontFamily: FontNames.robotoMono,
    fontWeight: FontWeight.w400);

const textButtonTextStyle = TextStyle(
    fontFamily: FontNames.robotoMono,
    fontWeight: FontWeight.bold,
    fontSize: DIMENSION_16,
    color: buttonTextColor);

const bottomNavSelectedLabel = TextStyle(
  fontFamily: FontNames.robotoMono,
  fontSize: DIMENSION_10,
  fontWeight: FontWeight.w500,
  color: bottomNavigationBarSelectedIconColor,
);

const bottomNavUnSelectedLabel = TextStyle(
  fontFamily: FontNames.robotoMono,
  fontSize: DIMENSION_10,
  fontWeight: FontWeight.w500,
  color: bottomNavigationBarIconColor,
);

const tabLabelStyle = TextStyle(
    fontSize: DIMENSION_16,
    fontFamily: FontNames.robotoMono,
    fontWeight: FontWeight.bold,
    color: tabBarSelectedIndicatorColor);

const tabUnselectedLabelStyle = TextStyle(
    fontSize: DIMENSION_16,
    fontFamily: FontNames.robotoMono,
    fontWeight: FontWeight.w500,
    color: tabBarUnSelectedColor);
