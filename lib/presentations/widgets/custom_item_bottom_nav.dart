import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/themes/color_theme.dart';

class CustomItemBottomNav extends StatelessWidget {
  const CustomItemBottomNav({
    Key? key,
    required this.isActive,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h, top: 16.h),
        height: 72.sp,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 24.w,
            ),
            8.verticalSpace,
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color:
                      isActive ? ColorThemes.primaryColor : ColorThemes.black,
                  fontSize: 20.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
