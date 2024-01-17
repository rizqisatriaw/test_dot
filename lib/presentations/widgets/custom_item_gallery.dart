import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_dot/presentations/widgets/custom_text.dart';

import '../../config/themes/color_theme.dart';

class CustomItemGallery extends StatelessWidget {
  const CustomItemGallery({
    Key? key,
    required this.caption,
    required this.thumbnail,
  }) : super(key: key);

  final String caption;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: ColorThemes.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Card(
                    color: ColorThemes.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Image.network(thumbnail),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: CustomText(
                      title: caption.capitalize ?? '',
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
