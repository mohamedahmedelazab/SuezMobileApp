import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/data/model/categories_model.dart';
import 'package:suezproduction/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListCategoriesHome extends GetView<HomecontrollerTmp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomecontrollerTmp>(
        builder:
        (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest,
        widget:

        StaggeredGridView.countBuilder(
          physics: const NeverScrollableScrollPhysics(), //<--here
          shrinkWrap: true,
          crossAxisCount: 6,
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, int index) =>
              DoctorBox(
                  index: index, doctor: controller.categories[index]
              ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 2),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ) ));
  }
}



class DoctorBox extends   GetView<HomecontrollerTmp>{
  DoctorBox({ Key? key, required this.index, required this.doctor}) : super(key: key);
  final int index;
  final doctor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.gotoitems(controller.categories,index!, doctor["categories_id"],doctor["categories_name"],doctor["email"]);

      },
      child:Container(
        margin: const EdgeInsets.only(right: 1, bottom: 10, top: 10),
        width: 60,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center( // Ensure the content is centered in the container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
          Container(
          height: index.isEven ? 40 : 40,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage("${AppLink.imagesCategories}/${doctor["categories_image"]}",),

              ),
            )
          )   ,
              const SizedBox(height: 5), // Add space between image and text
              Text( maxLines: 2,
                "${translateDatabase(doctor["categories_name"],doctor["categories_name_en"])}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0, // Set your desired font size here
                  color: AppColor.SCIsecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}


/*class Categories extends GetView<HomecontrollerTmp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories( {Key? key, required this.categoriesModel,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.gotoitems(controller.categories,i!, categoriesModel.categoriesId!);
      },

      child: Column(

        children: [
          Container(
              decoration: BoxDecoration(


                  borderRadius:
                  BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              height: 60,
              width: 80,
              child: Image.network(
                "${AppLink.imagesCategories}/${categoriesModel.categoriesImage}",
              )),
          Text(
            "${translateDatabase(categoriesModel.categoriesName,categoriesModel.categoriesNameEn)}",
            style: TextStyle(
                fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}*/


