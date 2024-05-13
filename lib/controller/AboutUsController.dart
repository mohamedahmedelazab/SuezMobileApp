import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class AboutUsController extends GetxController {

}

class AboutUsControllerImp extends AboutUsController {


  int currentPage = 0;

  MyServices myServices = Get.find() ;

  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }

}
