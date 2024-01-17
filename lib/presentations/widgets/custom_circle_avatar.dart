import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_dot/config/themes/color_theme.dart';

class CustomCirclerAvatar extends StatelessWidget {
  const CustomCirclerAvatar({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorThemes.primaryColor,
      backgroundImage: NetworkImage(avatar),
      radius: 72.r,
    );
  }
}
