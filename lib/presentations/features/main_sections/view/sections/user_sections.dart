import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_dot/config/themes/color_theme.dart';
import 'package:test_dot/presentations/widgets/custom_circle_avatar.dart';
import 'package:test_dot/presentations/widgets/custom_text.dart';
import 'package:test_dot/presentations/widgets/custom_text_icon.dart';

import '../../controller/main_section_controller.dart';

class UserSections extends StatelessWidget {
  UserSections({Key? key}) : super(key: key);
  final controller = MainSectionController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// avatar
          CustomCirclerAvatar(
            avatar: controller.user?.value.avatar ?? '',
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(24.h),
              margin: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: ColorThemes.primaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// username
                  CustomText(
                    title: controller.user?.value.username ?? '',
                    size: 28.sp,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 8.h),

                  /// full name
                  CustomTextIcon(
                    icon: Icons.person,
                    title: controller.user?.value.fullname ?? '',
                  ),

                  /// email
                  CustomTextIcon(
                    icon: Icons.email,
                    title: controller.user?.value.email ?? '',
                  ),

                  /// phone
                  CustomTextIcon(
                    icon: Icons.phone,
                    title: controller.user?.value.phone ?? '',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
