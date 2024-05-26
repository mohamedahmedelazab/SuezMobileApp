import 'package:suezproduction/controller/home_controller.dart';
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
    return

      StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(), //<--here
        shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: controller.categories.length,
      itemBuilder: (BuildContext context, int index) =>
          DoctorBox(
                  index: index, doctor: controller.categories[index]
          ),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 2),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
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
        controller.gotoitems(controller.categories,index!, doctor["categories_id"]);

      },
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    height: index.isEven ? 100 : 100,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage("${AppLink.imagesCategories}/${doctor["categories_image"]}",),

                      ),
                    )
                ),
              ),

              Text("${translateDatabase(doctor["categories_name"],doctor["categories_name_en"])}", maxLines: 2,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 3),
    /* Text("${translateDatabase(doctor["categories_name"],doctor["categories_name_en"])}", style: TextStyle(color: Colors.grey, fontSize: 13),),
              SizedBox(height: 3),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 14,),
                  SizedBox(width: 2,),
                  Text("${doctor["categoriesImage"]} ", style: TextStyle(fontSize: 12),)
                ],
              )*/
              SizedBox(height: 3),
            ],
          )
      ),
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


