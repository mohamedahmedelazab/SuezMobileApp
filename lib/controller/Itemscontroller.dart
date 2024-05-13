
import 'package:flutter/widgets.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/handingdatacontroller.dart';
import 'package:suezproduction/data/datasource/remote/item_data.dart';
import 'package:get/get.dart';

abstract class Itemscontroller extends GetxController {
initialData();
changeCat(int val, String catval);
productDetail(String productId);
}

class ItemcontrollerTmp extends Itemscontroller
{

  ScrollController scrollController = ScrollController();
  List categories = [];
  List data = [];
  ItemData itemData=ItemData(Get.find());
  late StatusRequest statusRequest;
  int? selectedCat;
  String? catid;
  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }
  final double _height = 1.0;

  void animateToIndex(int index) {
    scrollController.animateTo(
      index  * 200,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
  @override
  initialData() {

    // TODO: implement initialData
    categories=Get.arguments["categories"];
    selectedCat=Get.arguments["selectedcat"];
    catid=Get.arguments["catid"];
    update();

    getitems(catid!);
    animateToIndex(int.parse(catid!));
    update();
  }



  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getitems(catid!);
    update();
  }


  getitems(String cat)  async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemData.getData(cat);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);

      }   if (response['status'] == "nodata") {
        statusRequest = StatusRequest.noData ;
      }else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();


  }

  productDetail(productId){
    // TODO: implement gotoitems
    Get.toNamed(AppRoute.productdetail, arguments: {
      "productId":productId
    });
  }
}
