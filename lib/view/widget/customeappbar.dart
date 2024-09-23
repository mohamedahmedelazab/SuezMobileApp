import 'package:get/get.dart';
import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:suezproduction/core/functions/translateDatabase.dart';

class customappbar extends StatelessWidget {
 final String titleapp;
 final void Function()  onPressedicon;
 final void Function()  onPressedsearch;
  const customappbar({Key? key,required this.titleapp,required this.onPressedicon, required this.onPressedsearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomecontrollerTmp mycontroller=  Get.put(HomecontrollerTmp());

    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

// Calculate the aspect ratio of the image
    final imageAspectRatio = 1727 / 660;

// Set container width and height based on screen size and aspect ratio
    final containerWidth = screenSize.width * .9; // 80% of screen width
    final containerHeight = containerWidth / imageAspectRatio;

    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: containerWidth, // Adjust the width of the outer container
      child: ImageSlideshow(
        /// Width of the [ImageSlideshow].
        width: containerWidth, // Set width to the calculated containerWidth

        /// Height of the [ImageSlideshow].
        height: containerHeight, // Set height to the calculated containerHeight

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Colors.white,

        /// The color to paint behind the indicator.
        indicatorBackgroundColor: Colors.grey,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                translateDatabase(AppImageAsset.slidshow1, AppImageAsset.slidshow_en1),
                fit: BoxFit.contain, // Maintain image quality
              ),
            ),
          ),
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                translateDatabase(AppImageAsset.slidshow2, AppImageAsset.slidshow_en2),
                fit: BoxFit.contain, // Maintain image quality
              ),
            ),
          ),
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                translateDatabase(AppImageAsset.slidshow3, AppImageAsset.slidshow_en3),
                fit: BoxFit.contain, // Maintain image quality
              ),
            ),
          ),      Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                translateDatabase(AppImageAsset.slidshow4, AppImageAsset.slidshow_en4),
                fit: BoxFit.contain, // Maintain image quality
              ),
            ),
          ),
        ],

        /// Called whenever the page in the center of the viewport changes.
        onPageChanged: (value) {},

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 3000,

        /// Loops back to first slide.
        isLoop: true,
      ),
    );

  }
}
