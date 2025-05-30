import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_demo/config/color_constant.dart';
import 'package:supabase_auth_demo/config/const.dart';
import 'package:supabase_auth_demo/config/error_message.dart';
import 'package:supabase_auth_demo/config/string_constant.dart';
import 'package:supabase_auth_demo/controllers/auth_controller.dart';
import 'package:supabase_auth_demo/elements/CustomButton.dart';
import 'package:supabase_auth_demo/pages/signUpScreen/widget/signup_helper.dart';
import '../../config/Utils.dart';
import '../../elements/ContentText.dart';
import '../../routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      titleName: StringConstant.createAccount,
                      fontSize: 6.w,
                      colorConstants: ColorConstant.honeyYellow),
                ),
                SizedBox(
                  height: 4.h,
                ),
                centerContent(
                    titleName: StringConstant.letStart,
                    description: "",
                    colorConstants: ColorConstant.white2,
                    descriptionColor: ColorConstant.gray4,
                    fontSize: 6.w),
                SizedBox(
                  height: 1.h,
                ),
                loginUIComponent(
                  columnContent(
                      authController.emailController,
                      authController.passwordController,
                      authController.confirmPasswordController,
                      context),
                ),
                SizedBox(
                  height: 3.h,
                ),
                richTextWidget(),
                SizedBox(
                  height: 3.h,
                ),
                CustomButtonWidget(
                  sizes: 6.w,
                  height: 4.6.h,
                  width: 46.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: StringConstant.signUp,
                  onPressed: () async {


                     await authController.registerWithEmailAndPassword(
                        authController.passwordController.text,
                        authController.emailController.text,
                        context,
                      );
                  },
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.6.h),
                  child: GestureDetector(
                    onTap: () => Get.offNamed(RoutesName.loginScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContentText(
                            color: ColorConstant.white2,
                            text: StringConstant.alreadyHaveAnAccount,
                            alignment: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            textSize: 3.6.w),
                        ContentText(
                            color: ColorConstant.yellow,
                            text: StringConstant.login,
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
