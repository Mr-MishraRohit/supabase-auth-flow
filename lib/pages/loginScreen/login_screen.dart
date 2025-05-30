import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_demo/config/const.dart';
import 'package:supabase_auth_demo/controllers/auth_controller.dart';
import '../../config/Utils.dart';
import '../../config/color_constant.dart';
import '../../config/string_constant.dart';
import '../../elements/ContentText.dart';
import '../../elements/CustomButton.dart';
import '../../routes/routes.dart';
import 'login_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: ColorConstant.black45,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: headerContent(
                      titleName: StringConstant.login,
                      fontSize: 6.w,
                      colorConstants: ColorConstant.honeyYellow,
                      callBack: (val) {}),
                ),
                SizedBox(
                  height: 8.h,
                ),
                centerContent(
                    titleName: StringConstant.welcome,
                    description: StringConstant.welcomeDescription,
                    colorConstants: ColorConstant.white2,
                    descriptionColor: ColorConstant.gray4,
                    fontSize: 6.w),
                SizedBox(
                  height: 8.h,
                ),
                loginUIComponent(
                  columnContent(
                    authController.emailController,
                    authController.passwordController,
                    context,
                    (p0) {
                      // Get.toNamed(RoutesName.forgotPasswordScreen);
                    },
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                CustomButtonWidget(
                  sizes: 6.w,
                  height: 4.6.h,
                  width: 40.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: StringConstant.login,
                  onPressed: () async {
                    if (authController.emailController.text.trim().isEmpty) {
                      Utils.showSnackBar("Email field is empty.");
                    } else if (!Utils.validateEmail(
                        authController.emailController.text.trim())) {
                      Utils.showSnackBar("Invalid email format");
                    } else if (authController.passwordController.text
                        .trim()
                        .isEmpty) {
                      Utils.showSnackBar("Password field is empty.");
                    } else {
                      authController.loginWithEmailAndPassword(
                        context,
                      );
                    }
                  },
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.6.h),
                  child: GestureDetector(
                    onTap: () => Get.offNamed(RoutesName.signUpScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContentText(
                            color: ColorConstant.white2,
                            text: StringConstant.donHaveAnAccount,
                            alignment: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            textSize: 3.6.w),
                        ContentText(
                            color: ColorConstant.yellow,
                            text: StringConstant.signUp,
                            alignment: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            textSize: 3.6.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
