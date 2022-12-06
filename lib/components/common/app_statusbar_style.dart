import 'package:contract_app/components/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBsrStyle {
  static const light = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
  static const lightHome = SystemUiOverlayStyle(
    statusBarColor: AppColors.mainBackground,
    statusBarIconBrightness: Brightness.dark,
  );
}
