import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/splash_controller.dart';
import 'package:suezproduction/core/services/services.dart';
import 'package:suezproduction/view/fingerprint.dart';
import 'package:suezproduction/view/screen/Home.dart';
import 'package:suezproduction/view/screen/auth/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {


  navigateToHome() {
    SplashControllerImp controller= Get.put(SplashControllerImp());
    // ===============================================================================
    // Timer is used so that after 2 seconds the user is navigated to login screen
    // ===============================================================================
    Timer(
      //Duration of timer
      const Duration(seconds: 2),
      // function (what happens after the timer stops)
      () {

        if (controller.isLogin()==true) {
          controller.goToHome();
        }
        else
          {
           controller.goToLogin();
          }

      },
    );
  }

  // ===========================================================================
  // Init State
  // ===========================================================================
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
             Text(
              "suez".tr,
              style: TextStyle(fontSize: 24,color: Colors.blue.shade900),
            ),
          ],
        ),
      ),
    );
  }
}
