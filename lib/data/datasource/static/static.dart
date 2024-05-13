import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:suezproduction/data/model/onboardingmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:suezproduction/data/model/SeveiceModel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "2".tr, body: "3".tr, image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "4".tr, body: "5".tr, image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "6".tr, body: "7".tr, image: AppImageAsset.onBoardingImageThree),

];

List menuList = [
  MenuItemModel(Image.asset('assets/images/producers.png', width: 50,    height: 50,), 'التأكد من صحة الوثيقة'),

  MenuItemModel(Image.asset('assets/images/request.png', width: 50,    height: 50,), 'طلب تأمين'),
  MenuItemModel(Image.asset('assets/images/22.png', width: 50,    height: 50,),'سداد الوثيقة اون لاين'),

  MenuItemModel(Image.asset('assets/images/supportIcon.png', width: 50,    height: 50,), 'إتصل بنا'),
];

