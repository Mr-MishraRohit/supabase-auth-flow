import 'package:get/get.dart';
import 'package:supabase_auth_demo/pages/loginScreen/login_screen.dart';

import '../pages/profileScreen/profile_screen.dart';
import '../pages/signUpScreen/signup_screen.dart';

class RoutesName {
  static const String signUpScreen = "/sign-up-screen";
  static const String loginScreen = "/login-screen";
  static const String profileScreen = "/profile-screen";
}

final getPages = [
  GetPage(
    name: RoutesName.signUpScreen,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: RoutesName.loginScreen,
    page: () {
      return const LoginScreen();
    },
  ),
  GetPage(
    name: RoutesName.profileScreen,
    page: () {
      return const ProfileScreen();
    },
  ),
];
