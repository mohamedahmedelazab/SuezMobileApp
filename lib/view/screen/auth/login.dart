import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/core/functions/validinput.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/logoauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('تسجيل الدخول',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtomWithIcon(
        text: "39".tr,
        onPressed: () {
          controller.gotohome();
        },
        color: AppColor.kGreenColor,
        myicon: Icon(Icons.account_circle),
      ),
      body: WillPopScope(
          onWillPop:ExitApp,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate_asd,
              child: GetBuilder<LoginControllerImp>(
                  builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: ListView(children: [
                        const LogoAuth(),
                        const SizedBox(height: 20),
                        CustomTextTitleAuth(text: "10".tr),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(text: "11".tr),
                        const SizedBox(height: 15),
                        CustomTextFormAuth(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "18".tr,
                          // mycontroller: ,
                        ),
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => CustomTextFormAuth(
                            obscureText: controller.isshowpassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            mycontroller: controller.password,
                            hinttext: "13".tr,
                            iconData: Icons.lock_outline,
                            labeltext: "19".tr,
                            // mycontroller: ,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "14".tr,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        CustomButtomAuth(
                            text: "15".tr,
                            onPressed: () {
                              controller.login();
                            },
                            color: AppColor.primaryColor),
                        const SizedBox(height: 40),
                        CustomTextSignUpOrSignIn(
                          textone: "16".tr,
                          texttwo: "17".tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                        /*   const SizedBox(height: 40),
                        CustomTextSignUpOrSignIn(
                          textone: "",
                          texttwo: "رجوع",
                          onTap: () {
                            controller.gotohome();
                          },
                        )*/
                      ]))),
            ),
          )),
    );
  }
}
