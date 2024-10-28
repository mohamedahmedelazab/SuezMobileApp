import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/PriceOfferController.dart';
import 'package:suezproduction/controller/ServiceController.dart';
import 'package:suezproduction/controller/auth/login_controller.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'package:suezproduction/view/screen/homescreen.dart';
import 'package:suezproduction/view/widget/AppBar.dart';
import 'package:suezproduction/view/widget/CustomBottomAppBar.dart';
import 'package:suezproduction/view/widget/auth/custombuttonauth.dart';
import 'package:suezproduction/view/widget/auth/customtexttitleauth.dart';
import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/header.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';


class PriceOffer extends StatelessWidget {
  final PriceOfferController controller = Get.put(PriceOfferController());
  MyServices myServices = Get.find();
  HomecontrollerTmp mycontroller = Get.put(HomecontrollerTmp());
  ServiceController servicecontroller = Get.put(ServiceController());
  LocaleController localcontroller = Get.put(LocaleController());
  LoginControllerImp  logincontroller= Get.put(LoginControllerImp());

  @override

  Widget build(BuildContext context) {
    bool isLoggedIn = servicecontroller.isLogin();

    return   Scaffold(
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
        child:  GetBuilder<PriceOfferController>(
          builder: (controller) =>SafeArea(
          child: HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget:SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    child: Column(

                children: [

                  Header(
                    isLoggedIn: isLoggedIn,
                    mycontroller: mycontroller,
                    servicecontroller: myServices,
                  ),
                  CustomTextTitleAuth(text: "offer".tr),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white.withOpacity(0.50),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(() {
                        if (controller.isSuccess.value) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
                                SizedBox(height: 20),
                                Text(
                                  'offersuccess'.tr,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.isSuccess.value = false;
                                    controller.offername = '';
                                    controller.offeremail = '';
                                    controller.offertel = '';
                                    controller.offeraddress = '';
                                    controller.offeramount = '';
                                    controller.offersubject = '';

                                  },
                                  child: Text('anotheroffer'.tr),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: [
                            DropdownButtonFormField<Map<String, String>>(
                              decoration: InputDecoration(labelText: 'insurance'.tr),
                              items: InsList.map((item) {
                                return DropdownMenuItem<Map<String, String>>(
                                  value: item,
                                  child: Text('${translateDatabase(item['InsName'],item['InsName'])}'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.offerInsKind = value['InsKind'] ?? '';
                                  controller.offerInsName = value['InsName'] ?? '';
                                }
                              },
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "name".tr),
                              controller: TextEditingController(text: controller.offername),
                              onChanged: controller.onOfferNameChanged,
                            ),
                              TextField(

                                decoration: InputDecoration(labelText: "card".tr),
                                keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly, // يسمح فقط بالأرقام
                                ],
                                controller: TextEditingController(text: controller.offercardId),
                                onChanged: controller.onoffercardIdChanged,
                              ),
                            TextField(
                              decoration: InputDecoration(labelText: "18".tr),
                              controller: TextEditingController(text: controller.offeremail),
                              onChanged: controller.onOfferEmailChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "21".tr),
                              keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // يسمح فقط بالأرقام
                              ],
                              controller: TextEditingController(text: controller.offertel),
                              onChanged: controller.onOfferTelChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "address".tr),
                              controller: TextEditingController(text: controller.offeraddress),
                              onChanged: controller.onOfferAddressChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: "amount".tr),
                              keyboardType: TextInputType.number, // يظهر لوحة المفاتيح الرقمية
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // يسمح فقط بالأرقام
                              ],
                              controller: TextEditingController(text: controller.offeraddress),
                              onChanged: controller.onOfferAmountChanged,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "offersubject".tr,
                                alignLabelWithHint: true,
                              ),
                              onChanged: (value) => controller.offersubject = value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              minLines: 5,
                            ),
                            SizedBox(height: 20),
                            CustomButtomAuth(
                              text: "send".tr,
                              onPressed: () {
                                if (controller.offerInsName.isEmpty ) {
                                  Get.snackbar('Error', 'Please fill in   (Insurance Name )', backgroundColor: Colors.red, colorText: Colors.white);
                                }

                                else if (controller.offername.isEmpty ) {
                                  Get.snackbar('Error', 'Please fill   (Name)', backgroundColor: Colors.red, colorText: Colors.white);
                                }

                                else if (isEgyptianIDValid(controller.offercardId)==false) {
                                  Get.snackbar('Error', 'Please enter a valid Card Id', backgroundColor: Colors.red, colorText: Colors.white);
                                }
                                else if ( controller.offeremail.isEmpty ) {
                                  Get.snackbar('Error', 'Please fill in   (Email )', backgroundColor: Colors.red, colorText: Colors.white);
                                }
                                else  if ( controller.offertel.isEmpty) {
                                  Get.snackbar('Error', 'Please fill in   ( phone)', backgroundColor: Colors.red, colorText: Colors.white);
                                }


                                else if (isEmailValid(controller.offeremail)==false) {
                                  Get.snackbar('Error', 'Please enter a valid email', backgroundColor: Colors.red, colorText: Colors.white);
                                } else {
                                  controller.sendOfferPrice();
                                }
                              },
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(height: 20,),
                            CustomTextSignUpOrSignIn(
                              textone: "",
                              texttwo: "back".tr,
                              onTap: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()
                                    ));
                              },
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
    ) ),
          ),
        ),
              ),
      bottomNavigationBar: CustomBottomAppBar(
        mycontroller: mycontroller,
        servicecontroller: servicecontroller,
      ),
    );

  }
  bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  bool isEgyptianIDValid(String id) {
    // Check if the ID is exactly 14 digits long and contains only digits
    if (id.length != 14) {
      return false;
    }

    // Check if all characters are digits
    return RegExp(r'^\d+$').hasMatch(id);
  }
}
