import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/AboutUsController.dart';
import 'package:suezproduction/view/widget/home/NavDrawer.dart';

class AboutUs extends StatelessWidget {


  AboutUsControllerImp controller= Get.put(AboutUsControllerImp());

  @override
  Widget build(BuildContext context) {

    
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://www.sci-egypt.net/frontdesign/wp-content/uploads/2023/03/about-strateg-768x768.png';

    return Stack(children: <Widget>[
      new Container(color: Colors.blue,),
      new Image.network(imgUrl, fit: BoxFit.fill,),
      new BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: new Container(
            decoration: BoxDecoration(
              color:  Colors.blue.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),)),
      new Scaffold(

          appBar: new AppBar(
            title: new Text("about".tr),
            centerTitle: false,
            elevation: 0.0,

          ),

          drawer: NavDrawer(),
          backgroundColor: Colors.transparent,
          body:
          SingleChildScrollView(

              child:
          new Center(

            child: new Column(

              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height/25.0,),
                new Center(child: Text('aboutustitle'.tr, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/20, right: _width/20),
                  child:new Text("aboutussub".tr,
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 14,color: Colors.white)) ,),
                new Divider(height: _height/30,color: Colors.white,),
                new Row(
                  children: <Widget>[
                    rowCell("220,000+", 'Clients'.tr),
                    rowCell("40+", 'Branches'.tr),

                  ],),
                new Divider(height: _height/30,color: Colors.white),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new MaterialButton(onPressed: (){
                  controller.getofacbook();
                },
                  child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(FontAwesomeIcons.facebook),
                    new SizedBox(width: _width/30,),
                    new Text('FOLLOW'.tr)
                  ],)),color: Colors.blue[50],),),
              ],
            ),
          ))
      )
    ],);
  }

  Widget rowCell(String count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));


}

