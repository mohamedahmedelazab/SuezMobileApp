import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/claimpagecontroller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/validinput.dart';
 import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtextformauth.dart';


class claimpage extends StatelessWidget {

  ClaimPageControllerImp controller=Get.put(ClaimPageControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body:GetBuilder<ClaimPageControllerImp>(builder: (controller)=>Form(child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/illustration.png",
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "claimtitle".tr,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(19, 22, 33, 1),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                 /*   Text(
                      "يمكنك عن طريق كتابة رقم الوثيقة ورقم الشاسية متابعة ملف التعويض الخاص بك وبيانات الصرف والمستندات المطلوبة",
                      style: TextStyle(
                        color: Color.fromRGBO(74, 77, 84, 1),
                        fontSize: 14.0,
                      ),
                    )*/

                    SizedBox(
                      height: 40.0,
                    ),
                    CustomTextFormAuth(

                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 9, 15, "name");
                      },
                      mycontroller: controller.policyNo,
                      hinttext: "polNo".tr,
                      iconData: Icons.padding_outlined,
                      labeltext: "polNo".tr,
                      // mycontroller: ,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, "name");
                      },
                      mycontroller: controller.chassisNo,
                      hinttext: "chassNo".tr,
                      iconData: Icons.sticky_note_2,
                      labeltext: "chassNo".tr,
                      // mycontroller: ,
                    ),


                    Center(child: CustomButtomAuth(
                      text: "submit".tr,
                      onPressed: () {

                        controller.getpolicy();

                      },
                      color: AppColor.primaryColor,),),

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
          ),
        ],
      ),key: controller.formstatClaimPage,),)

     ,
    );
  }
}
