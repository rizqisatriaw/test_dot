import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_dot/config/themes/color_theme.dart';

class CustomItemPlace extends StatelessWidget {
  const CustomItemPlace({
    Key? key,
    required this.image,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 24.w, left: 12.h, right: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorThemes.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            child: Image.network(
              fit: BoxFit.cover,
              image,
              height: 80.h,
              width: 100.w,
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: ColorThemes.textColor,
                        fontSize: 18.sp,
                      ),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: ColorThemes.textColor,
                        fontSize: 16.sp,
                      ),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
