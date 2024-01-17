import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_dot/presentations/widgets/custom_text.dart';

import '../../config/themes/color_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title = 'Refresh',
    required this.onTap,
    this.color,
    required this.isEnable,
  });

  final VoidCallback onTap;
  final String? title;
  final Color? color;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isEnable ? ColorThemes.primaryColor : ColorThemes.lightColor,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
          child: CustomText(
            title: title ?? '',
            size: 22.sp,
            weight: FontWeight.w600,
          )),
    );
  }
}
