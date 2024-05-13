import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/data/datasource/static/static.dart';
import 'package:suezproduction/view/screen/Branches.dart';
import 'package:suezproduction/view/screen/CheckPolicy.dart';
import 'package:suezproduction/view/screen/contactus.dart';
import 'package:suezproduction/view/screen/onlinepay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Services2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.all(10.0),
      child:  Column(children: [
        Row(            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Column(
            children: [
              Center(
                child:   InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckPolicy()));
                      //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                    },child:Card(
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(100.0)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Image.asset('assets/images/producers.png', width: 50,    height: 50,),
                  ),
                     )   ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child:   InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CheckPolicy()));
                        //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                      },child:Text(
                    'التأكد من صحة الوثيقة',
                    textAlign: TextAlign.center,
                    style: TextStyle( fontFamily: 'Heavy',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                      ) ),
                ),
              )
            ],
            )), Expanded(child:Column(
            children: [
    InkWell(
    onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Branches()));
    //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
    },child: Center(
    child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(100.0)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Image.asset('assets/images/branch.png', width: 50,    height: 50,),
                  ),
                ) ),
              ) ),
              InkWell(
              onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Branches()));
    //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
    },child: Center(
    child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    ' فــروع الشــركة',
                    textAlign: TextAlign.center,
                    style: TextStyle( fontFamily: 'Heavy',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                  ),
                ),
              )  ))
            ],
            ) )
        ],),
        Row(children: [
          Expanded(child:  Column(
            children: [
              Center(
                child:  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnLinepay()));
                      //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                    },child:Card(
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(100.0)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Image.asset('assets/images/22.png', width: 50,    height: 50,),
                  ),
    )   ),
              ),
              InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnLinepay()));
                    //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                  },child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'سداد الوثيقة اون لاين',
                    textAlign: TextAlign.center,
                    style: TextStyle( fontFamily: 'Heavy',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                  ),
                ),
                  ) )
            ],
          )), Expanded(child:Column(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => contactus()));
                    //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                  },child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(100.0)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Image.asset('assets/images/supportIcon.png', width: 50,    height: 50,),
                  ),
                ),
              )),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => contactus()));
                  //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'إتصــل بنــا',
                      textAlign: TextAlign.center,
                      style: TextStyle( fontFamily: 'Heavy',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900),
                    ),
                  ),
                ),
              )
            ],
    ) )
        ],)
      ],),

    );
  }

}

/*, Icon(
                               menuList[position].icon,
                               size: 50,
                               color: AppColor.primaryColor,
                             )*/