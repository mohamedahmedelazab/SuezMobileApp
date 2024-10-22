import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/sendEmailToEdara.dart';

class AccidentReportController extends GetxController {
  var acciedentname = '';
  var acciedentemail = '';

  var acciedenttel = '';
  var acciedentpolNo = '';

  var emailto = '';

  var acciedentsubject = '';
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  // A flag to determine if the form was successfully submitted
  var isSuccess = false.obs;
  SendEmailToedara sendemailtoedara=SendEmailToedara(Get.find());
  // This method will send the data to the API
  Future<void> sendAccidentReport() async {
    var response = await sendemailtoedara.postDataAcciedent(acciedentname,acciedentsubject, acciedentemail,emailto,acciedenttel,acciedentpolNo);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      // On success, set isSuccess to true and hide the form
      isSuccess.value = true;
    //  Get.snackbar('Success', 'Accident report sent successfully');
    } else {
      Get.snackbar('Error', 'Failed to send accident report');
    }
  }


  @override
  void onInit() {
    super.onInit();
    _loadEmailFromSharedPreferences();
  }

  void onEmailChanged(String value) {
    acciedentemail = value;
  }

  void onTelChanged(String value) {
    acciedenttel = value;
  }


  void onNameChanged(String value) {
    acciedentname = value;
  }

  void onPolNoChanged(String value) {
    acciedentpolNo = value;
  }

  bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }
  Future<void> _loadEmailFromSharedPreferences() async {


    if (myServices.sharedPreferences.getString("email")!="") {
      acciedentemail = myServices.sharedPreferences.getString("email")!;
    }

    if (myServices.sharedPreferences.getString("username")!="") {
    //  acciedentname = myServices.sharedPreferences.getString("username")!;
    }

  }

}
