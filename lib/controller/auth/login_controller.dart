import 'package:flutter/material.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/secure_storage.dart';
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
  final  GlobalKey<FormState> formstate_login = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  SigninData signindata = new SigninData(Get.find());
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
    String? StoredEmail;
    String? StoredPassword;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  showfinger() {
   if (this.StoredEmail ==null  && this.StoredPassword ==null )
     return false ;

   else
     return true;
   update();
  }
    Future<void> getStoredData() async {
      try {
        SecureStorage storage = SecureStorage();

        // Retrieve email and password
        StoredEmail = await storage.getEmail();
        StoredPassword = await storage.getPassword();


        // Handle cases where data might be null
        if (StoredEmail == null || StoredPassword == null) {
          // Handle the case where email or password is not available
          // For example, you can log a message or set default values
          print('Stored email or password is not available.');
          // Optionally, set default values or notify the user
        }

      } catch (e) {
        // Handle any errors that occur during secure storage access
        print('Error retrieving stored data: $e');
      }
    }

  @override
  login() async {
    var formdata = formstate_login.currentState;

    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await signindata.postData(email.text, password.text);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {


        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['user_name']);
          myServices.sharedPreferences
              .setString("password", response['data']['users_password']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences.setBool("islog", true);
          myServices.sharedPreferences.setString("step", "3");
          Get.offNamed(AppRoute.home, arguments: {"email": email.text});
          statusRequest = StatusRequest.success;
          update();
        } else {
          Get.defaultDialog(title: "رسالة خطأ", middleText: "البريد الألكترونى أو كلمة المرور غير صحيحة");
          statusRequest = StatusRequest.failure;
          update();
          if (response['status'] == "المستخدم صحيح ولكنه غير مفعل") {
            Get.offNamed(AppRoute.ReActivation,
                arguments: {"email": email.text});
          }
        }
      } else {
        Get.defaultDialog(title: "Warring", middleText: "there is problem");
        statusRequest = StatusRequest.failure;
      }
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    getStoredData();
    showfinger();
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
