import 'package:suezproduction/controller/home_controller.dart';
import 'package:suezproduction/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class appBottomView extends StatelessWidget implements PreferredSizeWidget {
  @override
  final String gotoroot;
  final Map<String, dynamic> myargument;
  const appBottomView({Key? key, required this.gotoroot, required this.myargument}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    HomecontrollerTmp mycontroller=  Get.put(HomecontrollerTmp());

    return AppBar(

      iconTheme: IconThemeData(color: Colors.white),

      backgroundColor: Colors.blue.shade900,
      centerTitle: true,
      title: Text(''),
      /*Text(
        'حصن أمان للملايين',
        style:
        TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
      )*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: new Icon(Icons.subject),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      /*InkWell(

        child: Icon(
          Icons.subject,
          color: Colors.white,
        ),
      )*/
      actions: [
        mycontroller.name != null ?
            Container(padding: EdgeInsets.only(left: 50), child: Text("مرحبا:-  "+mycontroller.name.toString(),style: TextStyle(color: Colors.white),)):
        InkWell(
          onTap: () {
            mycontroller.goToSignIn();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 30),

            
          ),
        )
    ,
      ],
      bottom: PreferredSize(
          child: getAppBottomView(),
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.02)),
    );
  }


  Widget getAppBottomView() {
    return Container(

        padding: EdgeInsets.only(left: 30, bottom: 20),
      child: Row(
        children: [
          getProfileView(),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قناة السويس للتأمين',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  'info@sci-egypt.com',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '16569',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getProfileView() {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:  CircleAvatar(
                radius: 36,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(0), // Border radius
                  child: ClipOval(
                    child: Image.asset(
                      AppImageAsset.logo,
                    ),
                  ),
                )),
          ),
        ),
    /*
    Positioned(
    bottom: 1,
    right: 1,
    child: Container(
    height: 30,
    width: 30,
    child: Icon(
    Icons.edit,
    color: Colors.deepPurple,
    size: 20,
    ),
    decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.all(Radius.circular(20))),
    ))*/
    ],
    );
  }



}