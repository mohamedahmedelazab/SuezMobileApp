import 'package:suezproduction/core/constant/apptheme.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeArabic;
  List<String>  items = ["ar",  "en" ];
  String? LangId;


  MyServices myservices=Get.find();

  changeLang(String langcode)
  {
    Locale local=Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(local);
  }
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  @override

  void onInit() {
    // TODO: implement onInit
    String? sharedrefLang=myServices.sharedPreferences.getString("lang");
    if(sharedrefLang=="ar")
    {
      language=Locale("ar");
      appTheme=themeArabic;
    }
    else  if(sharedrefLang=="en")
    {
      language=Locale("en");
      appTheme=themeEnglish;
    }
    else
    {
      language=Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
