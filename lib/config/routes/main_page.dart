import 'package:get/get.dart';
import 'package:test_dot/presentations/features/login/view/login_view.dart';

import '../../presentations/features/login/login_binding.dart';
import '../../presentations/features/main_sections/main_section_binding.dart';
import '../../presentations/features/main_sections/view/main_section_view.dart';
import '../../presentations/features/splash/splash_binding.dart';
import '../../presentations/features/splash/view/splash_view.dart';
import 'main_route.dart';

abstract class MainPage {
  static final main = [
    GetPage(
      name: MainRoute.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: MainRoute.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: MainRoute.mainSection,
      page: () => MainSectionView(),
      binding: MainSectionBinding(),
    ),
  ];
}
