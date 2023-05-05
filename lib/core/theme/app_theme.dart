import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppThemes {
  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static ThemeData themeData(bool isDarkTheme) {
    return isDarkTheme ? darkTheme : lightTheme;
  }

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryDarkColor,
      primarySwatch: const MaterialColor(0xb2610c0c, <int, Color>{
        50: Color(0x1a610c0c),
        100: Color(0x33610c0c),
        200: Color(0x4d610c0c),
        300: Color(0x66610c0c),
        400: Color(0x80610c0c),
        500: Color(0x99610c0c),
        600: Color(0xb3610c0c),
        700: Color(0xcc610c0c),
        800: Color(0xe6610c0c),
        900: Color(0xff610c0c),
      }),
      backgroundColor: backgroundDarkColor,
      scaffoldBackgroundColor: scaffoldBackgroundDarkColor,
      canvasColor: canvasDarkColor,
      hintColor: hintDarkColor,
      highlightColor: highlightDarkColor,
      hoverColor: hoverColorDarkColor,
      focusColor: focusColor,
      disabledColor: disabledTextDarkColor,
      cardColor: cardDarkBgColor,
      errorColor: errorColor,
      textTheme: _customTextTheme(
          ThemeData.dark().textTheme, textDarkColor, "darkTheme"),
      primaryTextTheme: _customTextTheme(
          ThemeData.dark().primaryTextTheme, textDarkColor, "darkTheme"),
      indicatorColor: indicatorDarkColor,
      iconTheme: const IconThemeData(color: primaryDarkColor, opacity: 0.8),
      colorScheme: const ColorScheme.dark(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavigationBarBackgroundDarkColor,
        selectedItemColor: bottomNavigationBarSelectedIconDarkColor,
        unselectedItemColor: bottomNavigationBarIconDarkColor,
        selectedIconTheme:
            IconThemeData(color: bottomNavigationBarSelectedIconDarkColor),
        unselectedIconTheme:
            IconThemeData(color: bottomNavigationBarIconDarkColor),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                  color: buttonTextColor, fontWeight: FontWeight.bold),
              onPrimary:
                  MaterialStateColor.resolveWith((states) => disabledDarkColor),
              primary:
                  MaterialStateColor.resolveWith((states) => buttonDarkBgColor))),
      buttonTheme: ThemeData.dark().buttonTheme.copyWith(
          buttonColor: buttonDarkBgColor,
          disabledColor: disabledColor,
          colorScheme: ThemeData.dark()
              .colorScheme
              .copyWith(secondary: buttonDarkBgColor)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: hintDarkColor),
        labelStyle: TextStyle(color: labelDarkColor),
        filled: true,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarStatusBackgroundDarkColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: appBarBackgroundDarkColor,
        actionsIconTheme: IconThemeData(color: iconDarkColor),
        centerTitle: false,
        toolbarTextStyle: TextStyle(
            fontSize: 16,
            color: appBarTextDarkColor,
            fontWeight: FontWeight.bold),
      ),
      tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          labelColor: tabBarSelectedIconDarkColor,
          unselectedLabelColor: tabBarUnSelectedDarkColor,
          indicator: BoxDecoration(color: tabBarSelectedIndicatorDarkColor)));
  static ThemeData lightTheme = ThemeData(
      backgroundColor: backgroundColor,
      primarySwatch: const MaterialColor(0xb2610c0c, <int, Color>{
        50: Color(0x1a610c0c),
        100: Color(0x33610c0c),
        200: Color(0x4d610c0c),
        300: Color(0x66610c0c),
        400: Color(0x80610c0c),
        500: Color(0x99610c0c),
        600: Color(0xb3610c0c),
        700: Color(0xcc610c0c),
        800: Color(0xe6610c0c),
        900: Color(0xff610c0c),
      }),
      brightness: Brightness.light,
      canvasColor: canvasColor,
      errorColor: errorColor,
      iconTheme: const IconThemeData(color: primaryColor, opacity: 0.8),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      focusColor: focusColorDarkColor,
      hintColor: hintColor,
      indicatorColor: indicatorColor,
      disabledColor: disabledTextColor,
      cardColor: cardBgColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavigationBarBackgroundColor,
        selectedItemColor: bottomNavigationBarSelectedIconColor,
        unselectedItemColor: bottomNavigationBarIconColor,
        selectedIconTheme:
            IconThemeData(color: bottomNavigationBarSelectedIconColor),
        unselectedIconTheme:
            IconThemeData(color: bottomNavigationBarIconColor),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                  color: buttonTextColor, fontWeight: FontWeight.bold),
              onPrimary:
                  MaterialStateColor.resolveWith((states) => disabledColor),
              primary:
                  MaterialStateColor.resolveWith((states) => buttonBgColor))),
      buttonTheme: ThemeData.light().buttonTheme.copyWith(
          buttonColor: buttonBgColor,
          colorScheme:
              ThemeData.light().colorScheme.copyWith(secondary: buttonBgColor)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: labelColor),
        filled: true,
      ),
      primaryIconTheme: ThemeData.light()
          .primaryIconTheme
          .copyWith(color: const Color(0xFF442B2D)),
      textTheme: _customTextTheme(
          ThemeData.light().textTheme, textColor, "lightTheme"),
      primaryTextTheme: _customTextTheme(
          ThemeData.light().primaryTextTheme, textColor, "lightTheme"),
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarStatusBackgroundColor,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        backgroundColor: appBarBackgroundColor,
        actionsIconTheme: IconThemeData(color: iconColor),
        centerTitle: false,
        toolbarTextStyle: TextStyle(
            fontSize: 16, color: appBarTextColor, fontWeight: FontWeight.bold),
      ),
      tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          labelColor: tabBarSelectedIconDarkColor,
          unselectedLabelColor: tabBarUnSelectedColor,
          indicator: BoxDecoration(color: tabBarSelectedIndicatorColor)));

  static TextTheme _customTextTheme(TextTheme base, Color color, String theme) {
    return base
        .copyWith(
          headline6: base.headline6!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.15,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline5: base.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 0.0,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline4: base.headline4!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              letterSpacing: 0.25,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline3: base.headline3!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 0.0,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline2: base.headline2!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              letterSpacing: -0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline1: base.headline1!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 34.0,
              letterSpacing: -1.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          subtitle2: base.subtitle2!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              letterSpacing: 0.10,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          subtitle1: base.subtitle1!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.15,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          bodyText2: base.bodyText2!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 0.25,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          bodyText1: base.bodyText1!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          button: base.button!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 0.75,
              color: theme.contains("darkTheme")
                  ? buttonDarkTextColor
                  : buttonTextColor),
          caption: base.caption!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 0.4,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          overline: base.overline!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.0,
              letterSpacing: 1.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
        )
        .apply(fontFamily: FontNames.robotoMono);
  }
}
