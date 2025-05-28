import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_demo/config/string_constant.dart';
import 'package:supabase_auth_demo/elements/progress_bar.dart';
import '../auth/auth_service.dart';
import '../config/Utils.dart';
import '../config/const.dart';
import '../config/error_message.dart';
import '../routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  ProgressBar progressBar = ProgressBar();
  /// get auth service
  final authService = AuthService();

  /// Register with email & password & save username instantly
  registerWithEmailAndPassword(String password, String email, BuildContext context) async {

    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    if (emailController.text.trim().isEmpty) {
      Utils.showSnackBar(ErrorMessage.emailRequired);
      return;
    } else if (!Utils.validateEmail(emailController.text.trim())) {
      Utils.showSnackBar(ErrorMessage.emailFormat);
      return;
    } else if (passwordController.text.trim().isEmpty) {
      Utils.showSnackBar(ErrorMessage.passwordRequired);
      return;
    } else if (confirmPasswordController.text.trim().isEmpty) {
      Utils.showSnackBar(ErrorMessage.confirmPasswordRequired);
      return;
    } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      Utils.showSnackBar(ErrorMessage.bothPasswordUnmatched);
      return;
    }
    try{
      bool isConnected = await Utils.isInternetConnected();
      if(isConnected){
        await authService.signUpWithEmailPassword(email, password);
        Debug.setLog(StringConstant.signupSuccessful);
        Get.offNamed(RoutesName.loginScreen);
        emailController.text = "";
        passwordController.text = "";
        confirmPasswordController.text = "";
      }else{
        Utils.showSnackBar(ErrorMessage.noInternetConnectionMessage);
      }

    }catch(error){
      Utils.showSnackBar("Error: $error");
      Debug.setLog("Error: $error");
    }
  }


  /// Login Button
  void loginWithEmailAndPassword(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
      Get.offNamed(RoutesName.profileScreen);
      emailController.text = "";
      passwordController.text = "";
      Debug.setLog("Login successful.");
    }

    /// catch any error
    catch (error) {
      Utils.showSnackBar("Error: $error");
      Debug.setLog("Error: $error");
    }
  }

  /// Logout Button
  void logout(BuildContext context) async {

    try {
      await authService.signOut();
      Get.offNamed(RoutesName.loginScreen);
      Debug.setLog("Logout successful.");
    }

    /// catch any error
    catch (error) {
      Utils.showSnackBar("Error: $error");
      Debug.setLog("Error: $error");
    }
  }
}
