import 'package:suezproduction/core/constant/apptheme.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeArabic;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeArabic;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeArabic;
    }
    super.onInit();
  }
}
