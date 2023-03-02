import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Collection of colors for OjaNow
class AppColors {
  const AppColors._(); // this basically makes it so you can't instantiate this class

  static const Color none = Color(0x00000000);

  //-----------------------------------------------
  static const Color _backgroundDark = Color(0xFF333333);
  static const Color _backgroundLight = Color(0xFFCDCFD0);

  static Color background(BuildContext c) =>
      c.isDarkMode ? _backgroundDark : _backgroundLight;

  // -----------------------------------------------------

  static const Color _secondaryDark = Color(0xFFF9971E);
  static const Color _secondaryLight = Color(0xFFF9971E);

  static Color secondary(BuildContext context) =>
      context.isDarkMode ? _secondaryDark : _secondaryLight;

  // -----------------------------------------------------
  static const Color _tertiaryDark = Color(0xFFF2F7F2);
  static const Color _tertiaryLight = Color(0xFFF2F7F2);

  static Color tertiary(BuildContext context) =>
      context.isDarkMode ? _tertiaryDark : _tertiaryLight;

  // -----------------------------------------------------

  static const Color _secondaryShadeDark = Color(0xFFF8931F);
  static const Color _secondaryShadeLight = Color(0xFFF8931F);

  static Color secondaryShade(BuildContext context) =>
      context.isDarkMode ? _secondaryShadeDark : _secondaryShadeLight;

  // -----------------------------------------------------

  static const Color _brandPrimaryDark = Color(0xFF6E449B);
  static const Color _brandPrimaryLight = Color(0xFF6E449B);

  static const Color primaryLight = _brandPrimaryLight;
  static const Color primaryDark = _brandPrimaryDark;

  static Color brandPrimary(BuildContext context) =>
      context.isDarkMode ? _brandPrimaryDark : _brandPrimaryLight;

  // -----------------------------------------------------

  static const Color _brandPrimaryShadeDark = Color(0xFF8655BB);
  static const Color _brandPrimaryShadeLight = Color(0xFF8655BB);

  static Color brandPrimaryShade(BuildContext context) =>
      context.isDarkMode ? _brandPrimaryShadeDark : _brandPrimaryShadeLight;

  static const Color brandPrimary1 = Color(0xFF853C95);
  static const Color brandPrimary2 = Color(0xFF904E9F);
  static const Color brandPrimary3 = Color(0xFF9C61A9);
  static const Color brandPrimary4 = Color(0xFFA773B3);
  static const Color brandPrimary5 = Color(0xFFB386BD);
  static const Color brandPrimary6 = Color(0xFFBE98C7);
  static const Color brandPrimary7 = Color(0xFFCAABD1);
  static const Color brandPrimary8 = Color(0xFFD6BDDB);
  static const Color brandPrimary9 = Color(0xFFE1D0E5);
  static const Color brandPrimary10 = Color(0xFFEDE2EF);
  static const Color brandPrimaryLight = Color(0xFFF8F4F9);

  // -----------------------------------------------------

  static const Color _brandSecondaryDark = Color(0xFFFFDE17);
  static const Color _brandSecondaryLight = Color(0xFFFFDE17);

  static Color brandSecondary(BuildContext context) =>
      context.isDarkMode ? _brandSecondaryDark : _brandSecondaryLight;

  static const Color brandSecondary1 = Color(0xFFFAE03F);
  static const Color brandSecondary2 = Color(0xFFFAE351);
  static const Color brandSecondary3 = Color(0xFFFBE663);
  static const Color brandSecondary4 = Color(0xFFFBE975);
  static const Color brandSecondary5 = Color(0xFFFCEC87);
  static const Color brandSecondary6 = Color(0xFFFCEF9A);
  static const Color brandSecondary7 = Color(0xFFFDF2AC);
  static const Color brandSecondary8 = Color(0xFFFDF4BE);
  static const Color brandSecondary9 = Color(0xFFFDF7D0);
  static const Color brandSecondary10 = Color(0xFFFEFAE2);
  static const Color brandSecondaryLight = Color(0xFFFEFDF5);

  // NEUTRALS COLORS
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF231F20);
  static const Color dark = Color(0xFF303437);
  static const Color grey = Color(0xFFEBF1F9);
  static const Color grey1 = Color(0xFFF9F8F9);
  static const Color grey2 = Color(0xFFF4F4F4);
  static const Color grey3 = Color(0xFFE5E5E5);
  static const Color grey4 = Color(0xFFB6B6B6);
  static const Color grey5 = Color(0xFF8B8C8C);
  static const Color grey6 = Color(0xFF757575);
  static const Color grey7 = Color(0xFF2D2F30);

  // DARKEST COLORS
  static const Color error = Color(0xFFBF0F04);
  static const Color warning = Color(0xFFA05E03);
  static const Color success = Color(0xFF46B655);
  static const Color good = Color(0xFF198155);
  static const Color log = Color(0xFF2B2C2C);

  // COMPANY BG COLORS

  static const Color facebookBG = Color(0xFFF4F6FB);
  static const Color googleBG = Color(0xFFFEF2F1);
  static const Color twitterBG = Color(0xFFE7F5FE);

  // TRACKERS COLORS
  static const Color slider = Color(0xFFF4F4F4);
  static const Color activePoint = Color(0xFF46B655);
  static const Color disabledPoint = Color(0xFFCFCED0);
}
