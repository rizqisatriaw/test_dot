import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_dot/config/themes/color_theme.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.title,
    required this.size,
    this.colorText,
    this.weight,
    this.maxLine,
  }) : super(key: key);

  final String title;
  final double size;
  final FontWeight? weight;
  final Color? colorText;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine ?? 1,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight ?? FontWeight.normal,
          color: colorText ?? ColorThemes.white,
        ),
      ),
    );
  }
}
