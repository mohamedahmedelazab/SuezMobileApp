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
    if(langcode=="ar")
    {

      appTheme=themeArabic;
    }
    else  if(langcode=="en")
    {

      appTheme=themeEnglish;
    }
    else
      {
        appTheme=themeArabic;
      }
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
      language=const Locale("ar");
      appTheme=themeArabic;
    }
    else  if(sharedrefLang=="en")
    {
      language=const Locale("en");
      appTheme=themeEnglish;
    }
    else
    {
      language=const Locale("ar");
      appTheme=themeArabic;
    }
    super.onInit();
  }

  isLogin()
  {
    if (myServices.sharedPreferences.getBool("islog")==true) {
      return true;
    }
    else
    {
      return false;
    }
  }
}
