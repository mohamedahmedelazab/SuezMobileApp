import 'package:suezproduction/controller/AboutUsController.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';

import 'package:suezproduction/core/constant/routes.dart';

import 'package:suezproduction/view/widget/auth/textsignup.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';
import 'package:suezproduction/view/widget/home/appBottomView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AboutUsControllerImp mycontroller=  Get.put(AboutUsControllerImp());

    return    Scaffold(
        drawer: NavDrawer(),

        appBar:    appBottomView(gotoroot: AppRoute.home,myargument: {},),

        body:  ListView(children: [
          CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(0), // Border radius
                child: ClipOval(
                  child: Image.asset(
                    AppImageAsset.logo,
                  ),
                ),
              )),
          const SizedBox(height: 20),

          Image.asset(
            AppImageAsset.locations,
          ),


          const SizedBox(height: 40),
          CustomTextSignUpOrSignIn(
            textone: "",
            texttwo: "رجوع",
            onTap: () {
              mycontroller.goToHome();
            },
          ),
        ]), ) ; }


}

