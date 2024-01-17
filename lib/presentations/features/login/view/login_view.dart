import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_dot/config/routes/main_route.dart';
import 'package:test_dot/config/themes/color_theme.dart';
import 'package:test_dot/presentations/widgets/custom_button.dart';
import 'package:test_dot/presentations/widgets/custom_text_field.dart';
import 'package:test_dot/utils/validator_helper.dart';

import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = LoginController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                validator: (email) {
                  final error = Validator.emailAddress(value: email);
                  controller.debounce.run(() {
                    controller.isLoginButtonEnabled(error == null);
                  });
                  return error;
                },
                controller: controller.usernameController,
                label: 'Username',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                validator: (password) {
                  final error = Validator.password(length: 6, value: password);
                  controller.debounce.run(() {
                    controller.isLoginButtonEnabled(error == null);
                  });
                  return error;
                },
                controller: controller.passwordController,
                label: 'Password',
              ),
              SizedBox(height: 16.h),
              Obx(
                () => CustomButton(
                  isEnable: controller.isLoginButtonEnabled.value,
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.setLogin();
                    }
                  },
                  title: 'Login',
                  color: ColorThemes.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
