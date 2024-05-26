import 'package:get/get.dart';
import 'package:suezproduction/view/screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class contactus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _contactus();
  }


}

class  _contactus extends State<contactus>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/logo.png",
                height: 60,
              ),

            ),
            Text(
              'suez canal insurance',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              "cardhometitle".tr,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'SourceSansPro',
                color: Colors.blue.shade100,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150,
              child: Divider(
                color: Colors.blue.shade100,
              ),
            ),
            InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    title: Text(
                      '16569',
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.blue.shade900),
                    ),
                  ),

                ),
                onTap: (){
                  //  _launchURL('tel:16569');
                  FlutterPhoneDirectCaller.callNumber('16596');


                }
            ),
            InkWell(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  title:Text(
                    ' info@sci-egypt.com',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              onTap: (){
                //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');

              },
            ),
            InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                    ),
                    title: Text(
                        "address1".tr,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.blue.shade900),
                    ),
                  ),

                ),
                onTap: (){
                  //  _launchURL('tel:16569');
                }
            ),
            InkWell(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.blue,
                  ),
                  title:Text(
                    "back".tr,
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                //  _launchURL('mailto: info@sci-egypt.com ?subject=from user mobile application&body=Please contact me');
              },
            )
          ],
        ),
      ),
    );
  }



}









