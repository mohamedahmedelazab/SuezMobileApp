import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class Homecontroller extends GetxController{
  initialData();
  getData();
gotoitems(List categories,int selectedcat, String categoryid);
}

class HomecontrollerTmp extends Homecontroller
{
  MyServices myServices=Get.find();
  String? id;
  String? name;
  String? lang;
  HomeData homeData = HomeData(Get.find());
bool? islog;
 // List data = [];
  List categories = [];
  List items = [];
  List items_discount = [];
  sharedrefrense_clear()
  {
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setBool("islog",false);
    Get.offNamed(AppRoute.login);
  }
  late StatusRequest statusRequest;
  initialData()
  {
    id=myServices.sharedPreferences.getString("id");
    name=myServices.sharedPreferences.getString("username");
    lang = myServices.sharedPreferences.getString("lang");
    islog = myServices.sharedPreferences.getBool("islog");
    myServices.sharedPreferences.setString("step","2");
  }
  void onInit()
  {
    initialData();
    getData();
    super.onInit();
  }


  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['data']['categories']);
        items.addAll(response['data']['items']);
        items_discount.addAll(response['data']['items_discount']);
      }  else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  gotoitems(categories, selectedcat, categoryid) {
    // TODO: implement gotoitems
  Get.toNamed(AppRoute.items, arguments: {
"categories":categories,
    "selectedcat":selectedcat,
    "catid": categoryid
  });
  }
}
