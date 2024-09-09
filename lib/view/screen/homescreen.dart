import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:get/get.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/localization/changelocal.dart';

import 'package:suezproduction/core/services/services.dart';

import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/Profile.dart';

import 'package:suezproduction/view/widget/customeappbar.dart';
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
    return  Scaffold(
        appBar: AppBar(
          title: Text('MY SCI'),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber('16569');
              },
            ),
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                final double screenWidth = MediaQuery.of(context).size.width;

                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(

                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            ListTile(
                                leading: ClipOval(

                                  child: Image.asset(

                                    AppImageAsset.en,width: 20,
                                  ),
                                ),
                                title: Text("English (إنجليزي)",  style: TextStyle(
                                  fontSize: screenWidth * 0.05,

                                )),
                                onTap: () =>
                                {
                                  localcontroller.changeLang("en")
                                }
                            ),
                            ListTile(
                                leading: ClipOval(

                                  child: Image.asset(

                                    AppImageAsset.ar,width: 20,
                                  ),
                                ),
                                title: Text("Arabic  (عربي)",  style: TextStyle(
                                  fontSize: screenWidth * 0.05,

                                )),
                                onTap: () =>
                                {
                                  localcontroller.changeLang("ar")
                                }
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(width: 10),
          ],
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
                SizedBox(height: 20), // Space at the top
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    servicecontroller.isLogin()==true ?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        width: 120,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your login action here, or navigate with GetX
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff1696EE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                             SizedBox(
                                width: 110,
                                child:  Text(
                                  "hello".tr+mycontroller.name.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ): Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        width: 110,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your login action here, or navigate with GetX
                            mycontroller.goToSignIn();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff1696EE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.lock, color: Colors.white),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 110,
                                child: const Text(
                                  'تسجيل الدخول',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 50),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        'assets/images/newlogo.png', // Replace with your asset path
                        height: 100,
                      ),
                    ),

                  ],
                ),
                // Section 2: Horizontal buttons

                // Section 3: Custom AppBar
                customappbar(
                  titleapp: "findproducts".tr,
                  onPressedicon: () {},
                  onPressedsearch: () {
                    print("search");
                  },
                ),
                SizedBox(height: 20),
                sci_service(),
                sci_service2(),

                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
    ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.home, color: Color(0xff1696EE)),
                        Text("home".tr,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.view_compact, color: Color(0xff1696EE)),
                        Text("about".tr,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      servicecontroller.isLogin() == true
                          ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile()))
                          : mycontroller.goToSignIn();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.perm_contact_calendar_rounded,
                            color: Color(0xff1696EE)),
                        Text("profile".tr,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                  servicecontroller.isLogin() == true
                      ? MaterialButton(
                    onPressed: () {
                      mycontroller.sharedrefrense_clear();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.output_sharp),
                        Text("exit".tr,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  )
                      : MaterialButton(
                    onPressed: () {
                      mycontroller.goToSignIn();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_circle_sharp,
                            color: Color(0xff1696EE)),
                        Text("login".tr,
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        );  ;
  }
}
