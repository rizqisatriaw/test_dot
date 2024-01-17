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
  }) : super(key: key);

  final String title;
  final double size;
  final FontWeight? weight;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
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
