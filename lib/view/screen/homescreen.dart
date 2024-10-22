import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/SlideshowController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';

import 'package:suezproduction/core/localization/changelocal.dart';

import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/screen/Slideshow2.dart';

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
  final OpacityController slideshowController = Get.put(OpacityController());


  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();
    final double imageSize = 230.0; // يمكنك تعديل هذا الحجم حسب الحاجة
    final double imageSizeW = 350.0;
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
          /*    Container(
                width: imageSizeW,
                height: imageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // حواف دائرية
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // ظل بلون برتقالي
                      spreadRadius: 2, // انتشار الظل
                      blurRadius: 5, // ضبابية الظل
                      offset: Offset(0, 3), // اتجاه الظل
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // حواف دائرية للصورة
                  child: Image.asset(
                    AppImageAsset.slidshow5,
                    fit: BoxFit.cover, // ملء الحاوية بالكامل
                  ),
                ),
              ),*/
              SizedBox(height: 20),

              Flexible(
                child: Column(
                  children: [
                    sci_service(),
                    sci_service2(),
                  /*  sci_service3()*/
                  ],
                ),
              ),

/*        Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // العمود الأول
                  Flexible(
                    fit: FlexFit.tight,
                    child: Opacity(
                      opacity: 0.5,  // القيمة بين 0.0 (شفافية كاملة) و 1.0 (بدون شفافية)
                      child: Image.asset(
                        'assets/images/aa.EG_EGYPT_NSR_GOLD-01.png',
                        fit: BoxFit.contain,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),  // إضافة مسافة بين العمودين
                  // العمود الثاني
                  Flexible(
                    fit: FlexFit.tight,
                    child: Opacity(
                      opacity: 0.5,  // القيمة بين 0.0 (شفافية كاملة) و 1.0 (بدون شفافية)
                      child: Image.asset(
                        'assets/images/B-_FAIR_GOLD_WEB.png',
                        fit: BoxFit.contain,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              )
              ,
            ),  Center(
              child: GetBuilder<OpacityController>(
                builder: (controller) {
                  return Row(
                    children: [
                      // العمود الأول
                      Flexible(
                        fit: FlexFit.tight,
                        child: AnimatedOpacity(
                          opacity: controller.opacity,  // قيمة الشفافية من OpacityController
                          duration: Duration(seconds: 1),  // مدة التحريك
                          child: Image.asset(
                            'assets/images/aa.EG_EGYPT_NSR_GOLD-01.png',
                            fit: BoxFit.contain,
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),  // إضافة مسافة بين العمودين
                      // العمود الثاني
                      Flexible(
                        fit: FlexFit.tight,
                        child: AnimatedOpacity(
                          opacity: controller.opacity,  // قيمة الشفافية من OpacityController
                          duration: Duration(seconds: 1),  // مدة التحريك
                          child: Image.asset(
                            'assets/images/B-_FAIR_GOLD_WEB.png',
                            fit: BoxFit.contain,
                            height: 100,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),*/


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
