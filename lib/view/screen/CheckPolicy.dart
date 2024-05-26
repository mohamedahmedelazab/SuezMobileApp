import 'package:suezproduction/controller/CheckPolicy_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/constant/routes.dart';
import 'package:suezproduction/core/functions/alertexitapp.dart';
import 'package:suezproduction/core/functions/validinput.dart';

import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextbodyauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';

import 'package:suezproduction/view/widget/home/NavDrawer.dart';

import 'package:suezproduction/view/widget/home/appBottomView.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CheckPolicy extends StatelessWidget {
  const CheckPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckPolicyControllerImp());
    HomecontrollerTmp mycontroller=  Get.put(HomecontrollerTmp());
    final GlobalKey  _scaffoldKeyformstatCheckLogin = new GlobalKey ();

    return    Scaffold(
        drawer: NavDrawer(),
        key: _scaffoldKeyformstatCheckLogin,

        appBar:    appBottomView(gotoroot: AppRoute.home,myargument: {},),

              body:  WillPopScope(
                onWillPop: alertExitApp,
                child: GetBuilder<CheckPolicyControllerImp>(builder:
                    (controller)=>
                controller.statusRequest==StatusRequest.loading?
                Center(child:const Text("loading..."),) :
                controller.statusRequest==StatusRequest.offlinefailure?
                Center(child:const Text("No Internet Connection ..."),)
                    : Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstatCheckLogin,
                    child: ListView(children: [
                        CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(0), // Border radius
                          child: ClipOval(
                            child: Image.asset(
                              AppImageAsset.producers,
                            ),
                          ),
                        )),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "Validate_document".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "checktitle".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 10, 15, "name");
                        },
                        mycontroller: controller.policyNo,
                        hinttext: "polNo".tr,
                        iconData: Icons.padding_outlined,
                        labeltext: "polNo".tr,
                        // mycontroller: ,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 3, 20, "name");
                        },
                        mycontroller: controller.stickerNo,
                        hinttext: "barcode".tr,
                        iconData: Icons.sticky_note_2,
                        labeltext: "barcode".tr,
                        // mycontroller: ,
                      ),


                      CustomButtomAuth(
                          text: "submit".tr,
                          onPressed: () {
                            controller.checkpolicy();
                            print("---------");




                          }),
                      controller.status !="" ?
                      controller.status=="success"?

                      Column(children: [
                        Row( children: [Icon(Icons.safety_check,color:  Colors.green,) ,  Text("الوثيقة صحيحة",style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.bold),)]),
                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.padding_outlined,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text("رقم الوثيقة: "+controller.polNo_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.sticky_note_2,color: AppColor.primaryColor),SizedBox(width: 4,),Text( "رقم الإستيكر : "+controller.PrintedSerials_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.account_circle_sharp,color: AppColor.primaryColor),SizedBox(width: 4,),Text("إسم المؤمن له : "+controller.InsuName_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.date_range_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text( "تاريخ بداية السريان : "+controller.StartDate_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.date_range_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text( "تاريخ نهاية السريان : "+controller.EndDate_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.monetization_on,color: AppColor.primaryColor),SizedBox(width: 4,),Text( "   مبلغ القسط: "+controller.Activecom_res +" "+ controller.CurrName_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),

                        SizedBox(height: 10,),
                        Row( children: [Icon(Icons.ac_unit_rounded,color: AppColor.primaryColor),SizedBox(width: 4,),Text( "حالة السداد:  "+controller.PaymentStatus_res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),

                      ],):Column(
                        children: [
                          Row( children: [Icon(Icons.error,color:  Colors.red,) ,  Text("الوثيقة غير موجودة",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),)]),

                        ],
                      ): Column(),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "",
                        texttwo: "back".tr,
                        onTap: () {
                          controller.goToHome();
                        },
                      ),
                    ]),
                  ),
                ))

                ,) ) ; }


  }

