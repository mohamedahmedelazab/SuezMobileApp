import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';

import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/localization/changelocal.dart';

import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/Profile.dart';
import 'package:suezproduction/view/widget/customeappbar.dart';

import 'package:suezproduction/view/widget/home/NavDrawer.dart';

import 'package:suezproduction/view/widget/home/Services2.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';

import 'package:suezproduction/view/widget/home/listcategorieshome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:suezproduction/view/widget/progressbar.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomecontrollerTmp());
    LocaleController localcontroller=  Get.put(LocaleController());
    HomecontrollerTmp mycontroller=  Get.put(HomecontrollerTmp());

    return    Scaffold(
        drawer: NavDrawer(),

        appBar:    appBottomView(gotoroot: AppRoute.home,myargument: {},),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(


                onPressed: (){
                  FlutterPhoneDirectCaller.callNumber('16569');


                },child:Icon(Icons.phone,color: AppColor.primaryColor)
/*
              Image.network(
                "${AppLink.imagestatic}/whatsicons.png",
              )*/
                ,), bottomNavigationBar:  BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 10,
                child:
                Row(children: [
                  Row(children: [
                    MaterialButton(onPressed: (){},child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.home),Text("home".tr,  style: TextStyle( fontFamily: 'Heavy',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900))
                      ],),)
                  ],),
                  Row(children: [
                    MaterialButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.view_compact),Text("about".tr,  style: TextStyle( fontFamily: 'Heavy',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900))
                      ],),)
                  ],),
                  Spacer(),
                  Row(children: [
                    MaterialButton(onPressed: (){
                      mycontroller.name != null?
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile())):
                      mycontroller.goToSignIn();
                    },child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.perm_contact_calendar_rounded),Text("profile".tr,  style: TextStyle( fontFamily: 'Heavy',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900))
                      ],),)
                  ],)
                  ,  Row(children: [
                    mycontroller.name != null?
                         MaterialButton(onPressed: (){
                           mycontroller.sharedrefrense_clear();
                    },child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.output_sharp),Text("خروج" , style: TextStyle( fontFamily: 'Heavy',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900))
                      ],),)

                        :MaterialButton(onPressed: (){
                      mycontroller.goToSignIn();
                    },child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_circle_sharp),Text("exit".tr,  style: TextStyle( fontFamily: 'Heavy',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900))
                      ],),)
                  ],)
                ],),),
              body: SingleChildScrollView(

                child:GetBuilder<HomecontrollerTmp>(builder: (controller) {
// print(AppLink.imagesItems+"/"+controller.items[0]["items_image"]);
        return  HandlingDataView(
        statusRequest: controller.statusRequest,
        widget:SingleChildScrollView(
            child: Column(
            children: <Widget>[
              customappbar(  titleapp: "findproducts".tr,onPressedicon: (){},onPressedsearch: (){
                print("search");
              },),

          const SizedBox(
          height: 10,
        ),
              Services2(),
             ProgramsBar(title: "منتجاتنا",) ,
              const SizedBox(
                height: 10,
              ),
              ListCategoriesHome(),
              const SizedBox(
                height: 10,
              )

                  ])) /*Column(
            children: <Widget>[
              Services2(),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
              ListCategoriesHome(),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),

            ],
          )*/,


        
        /*ListView(
          physics: PageScrollPhysics(),

          children: [
                 /*   CustomCardHome( title: "cardhometitle".tr, body: "exit".tr,onPressedsearch: (){
                      mycontroller.goToSignIn();
                    }),*/
                    customappbar(  titleapp: "findproducts".tr,onPressedicon: (){},onPressedsearch: (){
                      print("search");
                    },),
            const SizedBox(
              height: 10,
            )
            /*,
            ProgramsBar(
                title: 'خدماتنا'
            ),*/
            ,
            Services2(),
            const SizedBox(
              height: 10,
            ),
            ProgramsBar(title: "منتجاتنا",) ,
            const SizedBox(
              height: 10,
            ),
                     ListCategoriesHome(),
            const SizedBox(
              height: 10,
            ),
                     /*CustomTitleHome(title: "ourproduct".tr,) ,
/*
                     ListItemsHome(type: "",),*/
            ProgramsBar(title: "news".tr,) ,
                    const SizedBox(
                      height: 10,
                    ),
                    EventsAndExperiences(),
            ProgramsBar(title: "offers".tr,) ,
                    const SizedBox(
                      height: 5,
                    ),
                     ListItemsHome(type: "discount"),*/
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
        
        */
        );}) )  ) ; }


  }

