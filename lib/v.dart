import 'package:flutter/material.dart';

class V {

  static const String appName = "Vepara Task";

  static const String loginImagePath = "assets/login.png";
  static const String notificationImagePath = "assets/notification.svg";
  static const String anasayfaImagePath = "assets/anasayfa.svg";
  static const String odemealImagePath = "assets/odemeal.svg";
  static const String komisyonImagePath = "assets/komisyon.svg";
  static const String islemlerImagePath = "assets/islemler.svg";
  static const String checkboxImagePath = "assets/checkbox.svg";

  static final BorderRadius mainBorderRadius = BorderRadius.circular(10);

  static RoundedRectangleBorder mainRoundedShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  static const EdgeInsets mainButtonPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 12);

  static Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  
  static final Color mainWhite = _hexToColor("#FAFAFA");
  static final Color mainDarkGrey = _hexToColor("#141414");
  static final Color mainLightGrey = _hexToColor("#545454").withOpacity(0.7);
  static final Color hintGrey = _hexToColor("#757575").withOpacity(0.5);
  static final Color errorRed = _hexToColor("#CE282B");
  static final Color mainDarkBlue = _hexToColor("#002C44");
  static final Color linearBlue = _hexToColor("#015679");
  static final Color backgroundColor = _hexToColor("#F6F6F6");
  static final Color mainGreen = _hexToColor("#016D52");

  static double textSize0 = 12.0;
  static double textSize1 = 14.0;
  static double textSize2 = 16.0;
  static double textSize3 = 18.0;
  static double textSize4 = 24.0;
  static double textSize5 = 32.0;

  static OutlineInputBorder _outlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: mainBorderRadius,
    );
  }

  static final ThemeData themeData = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(color: hintGrey, fontSize: textSize2),
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _outlineInputBorder(hintGrey),
      focusedBorder: _outlineInputBorder(hintGrey),
      errorBorder: _outlineInputBorder(errorRed),
      focusedErrorBorder: _outlineInputBorder(errorRed),
      disabledBorder: _outlineInputBorder(hintGrey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainDarkBlue,
        foregroundColor: mainWhite,
        padding: mainButtonPadding,
        shape: mainRoundedShape,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: textSize3),
        elevation: 0,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: mainDarkBlue,
      unselectedItemColor: mainLightGrey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: textSize0),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(color: mainDarkBlue, width: 1),
      fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
  );

}