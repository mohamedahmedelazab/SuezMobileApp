import 'package:flutter_touch_ripple/flutter_touch_ripple.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'package:suezproduction/view/screen/Branches.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/NewBranches.dart';
import 'package:suezproduction/view/screen/contactus.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';


class Services2 extends StatelessWidget {
  @override
  ServiceController mycontroller = Get.put(ServiceController());
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: TouchRipple(

                      child: Column(
                        children: [
                          Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CheckPolicy()));
                                  //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 5,
                                  child: AnimatedBuilder(
                                      animation: mycontroller.myanimation,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child:  Image.asset(
                                            'assets/images/producers.png',
                                            width:
                                                mycontroller.myanimation.value,
                                            height:
                                                mycontroller.myanimation.value,
                                          ),
                                        );
                                      }),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CheckPolicy()));
                                    //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                                  },
                                  child: AnimatedBuilder(
                                      animation: mycontroller.myanimation2,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Text(
                                          "Validate_document".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Heavy',
                                              fontSize: mycontroller
                                                  .myanimation2.value,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade900),
                                        );
                                      })),
                            ),
                          )
                        ],
                      ))),
              Expanded(
                  child:
                  TouchRipple(

                      child:Column(
                children: [
                  InkWell(
                      onTap: () {
                        mycontroller.goToBranches();
                      },
                      child: Center(
                        child: Center(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5,
                          child: AnimatedBuilder(
                              animation: mycontroller.myanimation,
                              builder: (BuildContext context, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/branch.png',
                                    width: mycontroller.myanimation.value,
                                    height: mycontroller.myanimation.value,
                                  ),
                                );
                              }),
                        )),
                      )),
                  InkWell(
                      onTap: () {
                        mycontroller.goToBranches();
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedBuilder(
                              animation: mycontroller.myanimation2,
                              builder: (BuildContext context, Widget? child) {
                                return Text(
                                  "branches".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Heavy',
                                      fontSize: mycontroller.myanimation2.value,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900),
                                );
                              }),
                        ),
                      )))
                ],
    )  ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child:  TouchRipple(

                      child:Column(
                children: [
                  Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnLinepay()));
                          //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5,
                          child: AnimatedBuilder(
                              animation: mycontroller.myanimation,
                              builder: (BuildContext context, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/22.png',
                                    width: mycontroller.myanimation.value,
                                    height: mycontroller.myanimation.value,
                                  ),
                                );
                              }),
                        )),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnLinepay()));
                        //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedBuilder(
                              animation: mycontroller.myanimation2,
                              builder: (BuildContext context, Widget? child) {
                                return Text(
                                  "E_Pay".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Heavy',
                                      fontSize: mycontroller.myanimation2.value,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900),
                                );
                              }),
                        ),
                      ))
                ],
              ))),
              Expanded(
                  child:  TouchRipple(

                      child:Column(
                children: [
                  InkWell(

                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => contactus()));
                        //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                      },
                      child: Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5,
                          child: AnimatedBuilder(
                              animation: mycontroller.myanimation,
                              builder: (BuildContext context, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/images/supportIcon.png',
                                    width: mycontroller.myanimation.value,
                                    height: mycontroller.myanimation.value,
                                  ),
                                );
                              }),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => contactus()));
                      //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedBuilder(
                              animation: mycontroller.myanimation2,
                              builder: (BuildContext context, Widget? child) {
                                return Text(
                                  "contact".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Heavy',
                                      fontSize: mycontroller.myanimation2.value,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900),
                                );
                              })),
                    ),
                  )
                ],
              )))
            ],
          )
        ],
      ),
    );
  }
}

/*, Icon(
                               menuList[position].icon,
                               size: 50,
                               color: AppColor.primaryColor,
                             )*/
