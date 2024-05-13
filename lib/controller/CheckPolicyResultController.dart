import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/CheckPolicyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class CheckPolicyResultController extends GetxController {

}

class CheckPolicyResultControllerImp extends CheckPolicyResultController {
  List data = [];
  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }
  @override
  initialData() {

    // TODO: implement initialData
      data=Get.arguments["su"];
      update();
print(data);
  }
}