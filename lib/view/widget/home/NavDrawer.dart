import 'package:get/get.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/Branches.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:suezproduction/view/widget/home/customButton.dart';

class NavDrawer extends StatelessWidget {
  LocaleController localcontroller = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "menu".tr,
              style: TextStyle(color: Colors.white, fontSize: 25   ,),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
             ListTile(
            leading: Icon(Icons.view_compact),
            title: Text("about".tr,  style: TextStyle(
              fontSize: 14,


               


            )),
            onTap: () => {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUs()))},
          ),
          localcontroller.isLogin()==false? Row():ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Validate_document".tr,  style: TextStyle(
              fontSize: 14,


               


            )),
            onTap: () => {   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckPolicy()))},
          ),
    localcontroller.isLogin()==false? Row(): ListTile(
            leading: Icon(Icons.shopify_rounded),
            title: Text("E_Pay".tr,  style: TextStyle(
              fontSize: 14,

            )),
            onTap: () => {    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnLinepay()))},
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("branches".tr,  style: TextStyle(
              fontSize: 14,


              


            )),
            onTap: () => {  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Branches()))},
          ),
          SizedBox(height: 10,),

          localcontroller.myservices.sharedPreferences.getString("lang")=="ar" ?
          ListTile(
            leading: ClipOval(

              child: Image.asset(

                AppImageAsset.en,width: 20,
              ),
            ),
            title: Text("English (إنجليزي)",  style: TextStyle(
              fontSize: 14,

            )),
            onTap: () =>
            {
              localcontroller.changeLang("en")
            }
          ):
          ListTile(
              leading: ClipOval(

                child: Image.asset(

                  AppImageAsset.ar,width: 20,
                ),
              ),
              title: Text("Arabic  (عربي)",  style: TextStyle(
                fontSize: 14,

              )),
              onTap: () =>
              {
              localcontroller.changeLang("ar")
              }
          ),
/*
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children:  [
                  Icon(
                    Icons.list,
                    size: 16,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text("1".tr,
                      style: TextStyle(
                        fontSize: 14,
                        height: 0.9,

                         

                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: localcontroller.items
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: localcontroller.LangId,
              onChanged: (value){

                localcontroller.LangId = value.toString();
                localcontroller.changeLang(value.toString());

              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey.shade50,
              buttonHeight: 40,
              buttonWidth: 160,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.grey.shade300,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 200,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade100,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(-20, 0),
            ),
          ),
*/

        ],
      ),
    );
  }
}