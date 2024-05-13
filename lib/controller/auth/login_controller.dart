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
    statusRequest = StatusRequest.loading;
    if (formdata!.validate()) {
      var response = await  signindata.postData(email.text, password.text);

      statusRequest= handlingData(response);

      if (statusRequest== StatusRequest.success) {
        if (response['status'] == "success") {

          myServices.sharedPreferences.setString("id", response['data']['users_id']);
          myServices.sharedPreferences.setString("username", response['data']['user_name']);
          myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("email",response['data']['users_email']);
          myServices.sharedPreferences.setBool("islog",true);
          Get.offNamed(AppRoute.home,arguments: {
            "email":email.text
          });

        }
        else {
          Get.defaultDialog(
              title: "Warring", middleText: response['status']);
          statusRequest = StatusRequest.failure;
        }

      }
      else {
        Get.defaultDialog(
            title: "Warring", middleText: "there is problem");
        statusRequest = StatusRequest.failure;
      }
    }

    else {
      print("Not Valid");
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
