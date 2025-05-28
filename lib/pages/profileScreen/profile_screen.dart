import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_auth_demo/config/const.dart';
import 'package:supabase_auth_demo/controllers/auth_controller.dart';
import 'package:supabase_auth_demo/routes/routes.dart';

import '../../config/color_constant.dart';
import '../../elements/CustomButton.dart';
import '../loginScreen/login_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  AuthController authController = Get.find();
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
                    titleName: "Profile",
                    fontSize: 6.w,
                    colorConstants: ColorConstant.honeyYellow,
                    callBack: (bool) {},
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomButtonWidget(
                  sizes: 6.w,
                  height: 4.6.h,
                  width: 46.w,
                  color: ColorConstant.white2,
                  bkg_color: ColorConstant.black18.withOpacity(0.1),
                  border_color: ColorConstant.gray4,
                  text: "LogOut",
                  onPressed: () async {
                    authController.logout(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
