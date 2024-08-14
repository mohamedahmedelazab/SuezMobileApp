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
import 'package:suezproduction/view/widget/auth/touch_id_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    LoginControllerImp logincontroller = Get.put(LoginControllerImp());
    return GetBuilder<LoginControllerImp>(
      builder: (controller) => Scaffold(
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
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Action to be taken when the button is pressed
              controller.gotohome();

            },
            icon: Icon(Icons.account_circle),
            label: Text( "39".tr,style: TextStyle(color: Colors.white,fontSize:12)),
            backgroundColor:  AppColor.kGreenColor, // Background color of the button
          )

    ,
      body: WillPopScope(
          onWillPop:ExitApp,
          child:  HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget:Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate_login,
              child:  ListView(children: [
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
                        CustomTextFormAuth(
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
                        const SizedBox(height: 10),

                controller.showfinger()==true? LoginTouchIDButton():Row(),




                        const SizedBox(height: 40),
                        CustomTextSignUpOrSignIn(
                          textone: "16".tr,
                          texttwo: "17".tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                           const SizedBox(height: 40),
                /*        CustomTextSignUpOrSignIn(
                          textone: "",
                          texttwo: "رجوع",
                          onTap: () {
                            controller.gotohome();
                          },
                        )*/
                      ])),
          ) ),
          )),
    );
  }
}
