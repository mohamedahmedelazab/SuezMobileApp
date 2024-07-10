import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
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
    GlobalKey<FormState> formstate_login = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  SigninData signindata = new SigninData(Get.find());
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String StoredEmail="";
  String StoredPassword="";
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  getStoredData() async{
    SecureStorage storage = SecureStorage();
    StoredEmail = (await storage.getEmail())!;
    StoredPassword = (await storage.getPassword())!;

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
          myServices.sharedPreferences.setString("id", response['data']['UID']);
          myServices.sharedPreferences
              .setString("username", response['data']['username']);
          myServices.sharedPreferences
              .setString("password", response['data']['password']);
          myServices.sharedPreferences
              .setString("phone", response['data']['MobileNo']);
          myServices.sharedPreferences
              .setString("email", response['data']['Email']);
          myServices.sharedPreferences.setBool("islog", true);
          myServices.sharedPreferences.setString("step", "3");
          Get.offNamed(AppRoute.home, arguments: {"email": email.text});
          statusRequest = StatusRequest.success;
          update();
        } else {
          Get.defaultDialog(title: "Warring", middleText: response['status']);
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

  Future<void> authenticateUserWithTouchID() async {
    final localAuthenticationauth = LocalAuthentication();
    bool isAuthorizedauth = false;
    try {
      isAuthorizedauth = await localAuthenticationauth.authenticate(
        localizedReason: "Please authenticate to continue",
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (exception) {}
    if (isAuthorizedauth) {
      SecureStorage storageauth = SecureStorage();
      String? email = await storageauth.getEmail();
      String? password = await storageauth.getPassword();

      if (email != null &&
          password != null &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        //_saveUser here
        await _loginUserByFinger(email, password);
      } else {

      }
    } else {
      //////البصمة غير مفعلة علي جهازك


    }
  }

  Future<void> activeauthenticateUserWithTouchID() async {
    final localAuthentication = LocalAuthentication();
    bool isAuthorized = false;
    try {
      isAuthorized = await localAuthentication.authenticate(
        localizedReason: "Please authenticate to continue",
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (exception) {}
    if (isAuthorized) {
      print("sucess");

      SecureStorage storage = SecureStorage();
      storage.setEmail(myServices.sharedPreferences.getString("email").toString());
      storage.setPassword(myServices.sharedPreferences.getString("password").toString());

      Get.dialog(AlertDialog(
        title: Text(' العملية ناجحة '),
        content: Text('تم تفعيل الدخول بالبصمة علي جهازك بنجاح'),
        actions: <Widget>[
          TextButton(
            child: Text('إغلاق'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ));

    } else {

    }
  }



  _loginUserByFinger(String email, String password) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signindata.postData(email, password);

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.setString("id", response['data']['UID']);
        myServices.sharedPreferences
            .setString("username", response['data']['username']);
        myServices.sharedPreferences
            .setString("password", response['data']['password']);
        myServices.sharedPreferences
            .setString("phone", response['data']['MobileNo']);
        myServices.sharedPreferences
            .setString("email", response['data']['Email']);
        myServices.sharedPreferences.setBool("islog", true);
        myServices.sharedPreferences.setString("step", "3");
        Get.offNamed(AppRoute.home, arguments: {"email": email});
        statusRequest = StatusRequest.success;
        update();
      }
    }
  }
}
