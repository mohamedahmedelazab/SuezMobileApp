import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';

import 'package:suezproduction/core/localization/changelocal.dart';

import 'package:suezproduction/core/services/services.dart';

import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';

import 'package:suezproduction/view/widget/customeappbar.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:suezproduction/view/widget/home/events_and_experiences.dart';

class HomePage extends StatelessWidget {
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
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(
                isLoggedIn: isLoggedIn,
                mycontroller: mycontroller,
                servicecontroller: myServices,
              ),
              customappbar(
                titleapp: "findproducts".tr,
                onPressedicon: () {},
                onPressedsearch: () {
                  print("search");
                },
              ),
              SizedBox(height: 20),

              Flexible(
                child: Column(
                  children: [
                    sci_service(),
                    sci_service2(),
                  ],
                ),
              ),

              SizedBox(),
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
