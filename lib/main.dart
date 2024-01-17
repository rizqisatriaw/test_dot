import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'config/routes/main_page.dart';
import 'config/routes/main_route.dart';
import 'config/themes/main_theme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('dot');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Pokemon App',
          debugShowCheckedModeBanner: false,
          theme: mainTheme,
          defaultTransition: Transition.fadeIn,
          getPages: MainPage.main,
          initialRoute: MainRoute.splash,
        );
      },
    );
  }
}
