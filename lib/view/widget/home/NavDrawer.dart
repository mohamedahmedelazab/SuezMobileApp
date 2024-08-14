import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/core/localization/changelocal.dart';
import 'package:suezproduction/view/screen/AboutUs.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/NewBranches.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';

class NavDrawer extends StatelessWidget {
  final LocaleController localcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "menu".tr,
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.06),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/cover.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.view_compact),
            title: Text(
              "about".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            ),
          ),
          if (localcontroller.isLogin()) ...[
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text(
                "Validate_document".tr,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckPolicy()),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopify_rounded),
              title: Text(
                "E_Pay".tr,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnLinepay()),
              ),
            ),
          ],
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text(
              "branches".tr,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewBranches()),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: ClipOval(
              child: Image.asset(
                localcontroller.myservices.sharedPreferences.getString("lang") == "ar"
                    ? AppImageAsset.en
                    : AppImageAsset.ar,
                width: 20,
              ),
            ),
            title: Text(
              localcontroller.myservices.sharedPreferences.getString("lang") == "ar"
                  ? "English (إنجليزي)"
                  : "Arabic (عربي)",
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            onTap: () {
              final newLang = localcontroller.myservices.sharedPreferences.getString("lang") == "ar" ? "en" : "ar";
              localcontroller.changeLang(newLang);
            },
          ),
        ],
      ),
    );
  }
}
