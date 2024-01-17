import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_dot/config/themes/color_theme.dart';

import 'custom_text.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Icon(
            icon,
            size: 24.sp,
            color: ColorThemes.white,
          ),
        ),
        CustomText(
          title: title,
          size: 22.sp,
          weight: FontWeight.normal,
        ),
      ],
    );
  }
}
