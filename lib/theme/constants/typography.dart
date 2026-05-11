import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'Poppins';

  // Headings
  static const TextStyle heading1 = TextStyle(fontFamily: fontFamily, fontSize: 48, fontWeight: FontWeight.w600);
  static const TextStyle heading2 = TextStyle(fontFamily: fontFamily, fontSize: 40, fontWeight: FontWeight.w600);
  static const TextStyle heading3 = TextStyle(fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.w600);
  static const TextStyle heading4 = TextStyle(fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.w600);
  static const TextStyle heading5 = TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.w600);
  static const TextStyle heading6 = TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w600);

  // Body — XLarge
  static const TextStyle bodyXLargeBold = TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w600);
  static const TextStyle bodyXLargeMedium = TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle bodyXLargeRegular = TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w400);

  // Body — Large
  static const TextStyle bodyLargeBold = TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600);
  static const TextStyle bodyLargeMedium = TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle bodyLargeRegular = TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w400);

  // Body — Medium
  static const TextStyle bodyMediumBold = TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w600);
  static const TextStyle bodyMediumMedium = TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle bodyMediumRegular = TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400);

  // Body — Small
  static const TextStyle bodySmallExtraBold = TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w800);
  static const TextStyle bodySmallMediumBold = TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w600);
  static const TextStyle bodySmallMedium = TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w500);
  static const TextStyle bodySmallRegular = TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400);

  // Body — XSmall
  static const TextStyle bodyXSmallExtraBold = TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w800);
  static const TextStyle bodyXSmallMedium = TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w500);
  static const TextStyle bodyXSmallRegular = TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w400);

  static TextStyle subtitleRegular(BuildContext context) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onTertiary,
    );
  }
}
