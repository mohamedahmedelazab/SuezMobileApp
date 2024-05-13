import 'package:suezproduction/core/constant/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: (){},child:

        Icon(Icons.shopping_basket_outlined),),
      bottomNavigationBar:  BottomAppBar(
shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child:
      Row(children: [
        Row(children: [
          MaterialButton(onPressed: (){},child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home),Text("الرئيسية")
            ],),)
        ],),
        Row(children: [
          MaterialButton(onPressed: (){},child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Icon(Icons.home),Text("الرئيسية")
          ],),)
        ],),
        Spacer(),
        Row(children: [
          MaterialButton(onPressed: (){},child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home),Text("الرئيسية")
            ],),)
        ],)
        ,  Row(children: [
        MaterialButton(onPressed: (){},child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Icon(Icons.home),Text("الرئيسية")
        ],),)
        ],)
      ],),),
      body:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("screen")),
      ],
    ),);
  }
}
