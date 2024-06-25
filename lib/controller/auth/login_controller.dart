import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/auth/logindata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate_asd = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  String? welcomeusername;
  SigninData signindata=new SigninData(Get.find());
  bool isshowpassword = true;
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices=Get.find();
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {

    var formdata = formstate_asd.currentState;


    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await  signindata.postData(email.text, password.text);

      statusRequest= handlingData(response);

      if (statusRequest== StatusRequest.success) {
        if (response['status'] == "success") {

          myServices.sharedPreferences.setString("id", response['data']['UID']);
          myServices.sharedPreferences.setString("username", response['data']['username']);
          myServices.sharedPreferences.setString("phone", response['data']['MobileNo']);
          myServices.sharedPreferences.setString("email",response['data']['Email']);
          myServices.sharedPreferences.setBool("islog",true);
          myServices.sharedPreferences.setString("step", "3") ;
          Get.offNamed(AppRoute.home,arguments: {
            "email":email.text
          });
          statusRequest=StatusRequest.success;
          update();
        }
        else {
          Get.defaultDialog(
              title: "Warring", middleText: response['status']);
          statusRequest = StatusRequest.failure;
         update();
          if (response['status']=="المستخدم صحيح ولكنه غير مفعل") {
            Get.offNamed(AppRoute.ReActivation,arguments: {
              "email":email.text
            });
          }
        }

      }
      else {
        Get.defaultDialog(
            title: "Warring", middleText: "there is problem");
        statusRequest = StatusRequest.failure;
      }
    }

    else {


    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }


  gotohome() {
    Get.toNamed(AppRoute.home);
  }
}
