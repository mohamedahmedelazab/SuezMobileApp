import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class customappbar extends StatelessWidget {
 final String titleapp;
 final void Function()  onPressedicon;
 final void Function()  onPressedsearch;
  const customappbar({Key? key,required this.titleapp,required this.onPressedicon, required this.onPressedsearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 15),
      child: ImageSlideshow(

        /// Width of the [ImageSlideshow].
        width: double.infinity,

        /// Height of the [ImageSlideshow].
        height: 200,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Colors.blue,

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Colors.grey,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        children: [
          Container(
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
                   child:  Image.asset(
                AppImageAsset.slidshow2,
                fit: BoxFit.fill,
              ),

          )
         ,

          Image.asset(
            AppImageAsset.slidshow1,
            fit: BoxFit.fill,
          ),

          Image.asset(
            AppImageAsset.slidshow3,
            fit: BoxFit.fill,
          ),

        ],

        /// Called whenever the page in the center of the viewport changes.
        onPageChanged: (value) {
          print('Page changed: $value');
        },

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 3000,

        /// Loops back to first slide.
        isLoop: true,
      ),

    );
  }
}
