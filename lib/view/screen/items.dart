import 'package:suezproduction/controller/Itemscontroller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/data/model/items_model.dart';
import 'package:suezproduction/view/widget/customeappbar.dart';
import 'package:suezproduction/view/widget/customescaffoldAppbar.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';
import 'package:suezproduction/view/widget/items/customlistitem.dart';
import 'package:suezproduction/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    ItemcontrollerTmp controller = Get.put(ItemcontrollerTmp());
    List categories = [];

    return Scaffold(
      appBar: appBottomView(
        gotoroot: AppRoute.items,
        myargument: {
          "categories": controller.categories,
          "selectedcat": controller.selectedCat,
          "catid": controller.catid,

        },
      ),  resizeToAvoidBottomInset: false, // set it to false

      body:  ListView(
          children: [

            ListCategoriesItems(),
            
            GetBuilder<ItemcontrollerTmp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:1, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, int index) {
                          return   CustomListItem(item_model: itemsmodel.fromJson(controller.data[index]),);
                        }) ))
          ]),
    );
  }
}