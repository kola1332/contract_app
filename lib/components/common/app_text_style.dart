import 'package:contract_app/components/common/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyle {
  static const TextStyle standard =
      TextStyle(fontFamily: 'MarkPro', color: AppColors.accentColorOrange);
  static const TextStyle title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'MarkPro',
  );
  static const TextStyle header = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    fontFamily: 'MarkPro',
  );
}
