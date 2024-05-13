import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/CheckPolicyData.dart';
import 'package:suezproduction/data/model/policyInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class CheckPolicyController extends GetxController {

}

class CheckPolicyControllerImp extends CheckPolicyController {


  GlobalKey<FormState> formstatCheckLogin = GlobalKey<FormState>();
  late TextEditingController policyNo;
  late TextEditingController stickerNo;
  List data = [];
  CheckPolicyData checkpolicyData = new CheckPolicyData(Get.find());
  StatusRequest? statusRequest;
  late policyInfoModel policyInfo_model;
  String status="";
  String polNo_res="";
  String PaymentStatus_res="";
  String EndDate_res="";
  String CurrName_res="";
  String StartDate_res="";
  String InsuName_res="";
  String PrintedSerials_res="";
  String Activecom_res="";

  @override



  @override
  checkpolicy() async {
    if (formstatCheckLogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkpolicyData.postData(
          policyNo.text, stickerNo.text );
     // print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          status="success";
           data.addAll(response['data']);
           policyInfo_model= policyInfoModel.fromJson(data[0]);
           polNo_res=policyInfo_model.polNo!;
          PaymentStatus_res=policyInfo_model.paymentStatus!;
          EndDate_res=policyInfo_model.endDate!;
          StartDate_res=policyInfo_model.startDate!;
          InsuName_res=policyInfo_model.insuName!;
          PrintedSerials_res=policyInfo_model.printedSerials!;
          Activecom_res=policyInfo_model.activecom!;
          CurrName_res=policyInfo_model.CurrName!;
          // Get.toNamed(AppRoute.CheckPolicy_Result, arguments: {
          //   "data":data
        //   });
        }
        else if (response['status'] == "notfound") {
          statusRequest = StatusRequest.notfound;
          status="faild";
          Get.defaultDialog(
              title: "Warring", middleText: "هذه الوثيقة غير موجودة");
        } else {
          Get.defaultDialog(
              title: "Warring", middleText: "failure");
          statusRequest = StatusRequest.failure;
        }
      }
      update();


    } else {}







  }

  @override
  void onInit() {
    policyNo = TextEditingController();
    stickerNo = TextEditingController();
    status="";
    super.onInit();
  }

  @override
  goToHome() {
    Get.offNamed(AppRoute.home);
  }
  @override
  void dispose() {
    policyNo.dispose();
    stickerNo.dispose();

    super.dispose();
  }

}
