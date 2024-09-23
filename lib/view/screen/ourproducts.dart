import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:suezproduction/view/widget/home/listcategorieshome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ourproduct extends StatelessWidget {

  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp  logincontroller= Get.put(LoginControllerImp());


  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();
    return  Scaffold(
        appBar: MainAppBar(
          title: 'MY SCI',
          localcontroller: localcontroller,
        ),
        drawer: NavDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: ListView(

              children: [
                SizedBox(height: 20), // Space at the top
                Header(
                  isLoggedIn: isLoggedIn,
                  mycontroller: mycontroller,
                  servicecontroller: myServices,
                ),

                ListCategoriesHome(),

                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()
                        ));},
                  child: Center(child:
                  Row(children: [
                    Icon(Icons.arrow_back, color: Colors.black),

                    Text("back".tr)],),),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(
          mycontroller: mycontroller,
          servicecontroller: servicecontroller,
        )

    );
  }
}