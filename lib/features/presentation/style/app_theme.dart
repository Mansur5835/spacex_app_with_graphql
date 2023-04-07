import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.backDark,
      hintColor: AppColors.grey,
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryBlack,
      primaryColor: AppColors.white,
      hintColor: AppColors.blackGrey1,
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    );
  }
}
