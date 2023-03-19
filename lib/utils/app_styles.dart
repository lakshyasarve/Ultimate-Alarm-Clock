import 'package:flutter/material.dart';

Color primary = const Color(0xFF0c0427);
class Styles{
  static Color primaryColor = primary;
  static Color textColor1 = const Color(0xFF9f82f9);
  static Color cardColor1 = const Color(0xFF693cf9);
  static Color cardColor2 = const Color(0xFFe0705e);
  static Color navigationBar = const Color(0xFF1b0a56);

  //Configure AppStyles Afterwards
  static TextStyle headLineStyle1 = const TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 28,
                       fontWeight: FontWeight.w600,
                       color: Colors.white,
                     );
  static TextStyle textStyle = const TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 20,
                       fontWeight: FontWeight.w400,
                       color: Colors.white,
                     );
  static TextStyle headLineStyle2 = TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 28,
                       fontWeight: FontWeight.w600,
                       color: Styles.textColor1,
                     );
  static TextStyle textStyle2 = TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 20,
                       fontWeight: FontWeight.w400,
                       color: Styles.textColor1,
                     );
  static TextStyle headLineStyle3 = TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 28,
                       fontWeight: FontWeight.w600,
                       color: Styles.primaryColor,
                     );
  static TextStyle textStyle3 = TextStyle(
                       fontFamily: "Poppins",
                       fontSize: 20,
                       fontWeight: FontWeight.w400,
                       color: Styles.primaryColor,
                     );
}