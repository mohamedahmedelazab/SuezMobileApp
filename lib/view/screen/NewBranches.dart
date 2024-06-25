import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:suezproduction/controller/Branches_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/view/screen/GoogleMap.dart';

import 'package:suezproduction/view/screen/Home.dart';


class NewBranches extends StatelessWidget {
  BranchControllerTmp controller= Get.put(BranchControllerTmp());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("branches".tr),  leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () =>   Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage())),
      )),
      body: const FutureBuilderExample(),
    );
  }
}



class Step {
  Step(
      this.BranchName,
      this.address,
      this.tel,
      this.email,
      this.ismain ,
      this.ishasdata ,
      [this.subSteps = const <Step>[]]
      );

  String BranchName;
  String address;
  String tel;
  String email;
  String ismain;
  String ishasdata;
  List<Step> subSteps;
}

List<Step> getSteps() {
  return [

    Step("BranchName1".tr, "address1".tr, "tel1".tr,"email1".tr,"1","1"),

    Step("BranchName2".tr, "address2".tr, "tel2".tr,"email2".tr,"1","1",[
      Step("edary1name".tr, '',"edary1tel".tr,"edary1fax".tr,"0","1"),
      Step("edary2name".tr, '',"edary2tel".tr,"edary2fax".tr,"0","1"),
      Step("edary3name".tr, '',"edary3tel".tr,"edary3fax".tr,"0","1"),
      Step("edary4name".tr, '',"edary4tel".tr,"edary4fax".tr,"0","1"),
      Step("edary5name".tr, '',"edary5tel".tr,"edary5fax".tr,"0","1"),
      Step("edary6name".tr, '',"edary6tel".tr,"edary6fax".tr,"0","1"),
    ]),


    Step("BranchName3".tr, "address3".tr, "tel3".tr,"email3".tr,"1","1",[
      Step("cario1name".tr, "cario1address".tr,"cario1tel".tr,"cario1fax".tr,"0","1"),
      Step("cario2name".tr, "cario2address".tr,"cario2tel".tr,"cario2fax".tr,"0","1"),
      Step("cario3name".tr, "cario3address".tr,"cario3tel".tr,"cario3fax".tr,"0","1"),
      Step("cario4name".tr, "cario4address".tr,"cario4tel".tr,"cario4fax".tr,"0","1"),
      Step("cario5name".tr, "cario5address".tr,"cario5tel".tr,"cario5fax".tr,"0","1"),
      Step("cario6name".tr, "cario6address".tr,"cario6tel".tr,"cario6fax".tr,"0","1"),
      Step("cario7name".tr, "cario7address".tr,"cario7tel".tr,"cario7fax".tr,"0","1"),
      Step("cario8name".tr, "cario8address".tr,"cario8tel".tr,"cario8fax".tr,"0","1"),
      Step("cario9name".tr, "cario9address".tr,"cario9tel".tr,"cario9fax".tr,"0","1"),
    ]),

    Step("BranchName4".tr, "", "" ,"","1","0",[
      Step("bahary1name".tr, "bahary1address".tr,"bahary1tel".tr,"bahary1fax".tr,"0","1"),
      Step("bahary2name".tr, "bahary2address".tr,"bahary2tel".tr,"bahary2fax".tr,"0","1"),
      Step("bahary3name".tr, "bahary3address".tr,"bahary3tel".tr,"bahary3fax".tr,"0","1"),
      Step("bahary4name".tr, "bahary4address".tr,"bahary4tel".tr,"bahary4fax".tr,"0","1"),
      Step("bahary5name".tr, "bahary5address".tr,"bahary5tel".tr,"bahary5fax".tr,"0","1"),

    ]),

    Step("BranchName5".tr, "address5".tr,"tel5".tr ,"email5".tr,"1","1",[
      Step("alex1name".tr, "alex1address".tr,"alex1tel".tr,"alex1fax".tr,"0","1"),
      Step("alex2name".tr, "alex2address".tr,"alex2tel".tr,"alex2fax".tr,"0","1"),
      Step("alex3name".tr, "alex3address".tr,"alex3tel".tr,"alex3fax".tr,"0","1"),
      Step("alex4name".tr, "alex4address".tr,"alex4tel".tr,"alex4fax".tr,"0","1"),
      Step("alex5name".tr, "alex5address".tr,"alex5tel".tr,"alex5fax".tr,"0","1"),

    ])

    ,

    Step("BranchName6".tr, "","" ,"","1","0",[
      Step("canal1name".tr, "canal1address".tr,"canal1tel".tr,"canal1fax".tr,"0","1"),
      Step("canal2name".tr, "canal2address".tr,"canal2tel".tr,"canal2fax".tr,"0","1"),
      Step("canal3name".tr, "canal3address".tr,"canal3tel".tr,"canal3fax".tr,"0","1"),
      Step("canal4name".tr, "canal4address".tr,"canal4tel".tr,"canal4fax".tr,"0","1"),
      Step("canal5name".tr, "canal5address".tr,"canal5tel".tr,"canal5fax".tr,"0","1"),
      Step("canal6name".tr, "canal6address".tr,"canal6tel".tr,"canal6fax".tr,"0","1"),
      Step("canal7name".tr, "canal7address".tr,"canal7tel".tr,"canal7fax".tr,"0","1"),
      Step("canal8name".tr, "canal8address".tr,"canal8tel".tr,"canal8fax".tr,"0","1"),
    ]),


    Step("BranchName7".tr, "", "" ,"","1","0",[
      Step("qbly1name".tr, "qbly1address".tr,"qbly1tel".tr,"qbly1fax".tr,"0","1"),
      Step("qbly2name".tr, "qbly2address".tr,"qbly2tel".tr,"qbly2fax".tr,"0","1"),
      Step("qbly3name".tr, "qbly3address".tr,"qbly3tel".tr,"qbly3fax".tr,"0","1"),
      Step("qbly4name".tr, "qbly4address".tr,"qbly4tel".tr,"qbly4fax".tr,"0","1"),
      Step("qbly5name".tr, "qbly5address".tr,"qbly5tel".tr,"qbly5fax".tr,"0","1"),
      Step("qbly6name".tr, "qbly6address".tr,"qbly6tel".tr,"qbly6fax".tr,"0","1"),
      Step("qbly7name".tr, "qbly7address".tr,"qbly7tel".tr,"qbly7fax".tr,"0","1")
    ]),
  ];
}


class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    final List<Step> _steps = getSteps();
    return SingleChildScrollView(

      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Column(children: [

                PinchZoom(
                  child: Image.asset('assets/images/map.png'),
                  maxScale: 6.5,
                  onZoomStart: (){

                  },
                  onZoomEnd: (){

                  },
                )
                ,
                Container(
                    child: _renderSteps(_steps)
                ),
                InkWell(
                  child: Card(
                    color: Colors.white,
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
              ],)

            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children =  <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("wait".tr),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Widget _renderSteps(List<Step> steps) {

    return ExpansionPanelList.radio(
      children: steps.map<ExpansionPanelRadio>((Step step) {
        return ExpansionPanelRadio(

            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(step.BranchName,style: TextStyle(
                    fontSize: step.ismain=="1"? 18:16,
                    color:step.ismain=="1"? Colors.blue.shade900:Colors.blue)),
              );
            },
            body: ListTile(
                title:       Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(20)),

                    height: step.ishasdata=="0"? 0:160,
                    width: 360,
                    child:Column(children: [

                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MapSample()));

                        },
                        child: step.address==''?Row():
                        Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(step.address,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                      ),
                      SizedBox(height: 10,),
                      step.tel==''?Row(): Row( children: [Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),Text(step.tel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                      SizedBox(height: 10,),
                      step.email==''?Row(): Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(step.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                    ],)),
                subtitle: _renderSteps(step.subSteps)
            ),
            value: step.BranchName
        );
      }).toList(),
    );
  }
}


/**/
/*
class _StepsState extends State<Steps> {
  final List<Step> _steps = getSteps();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [

        PinchZoom(
          child: Image.asset('assets/images/map.png'),
          maxScale: 6.5,
          onZoomStart: (){

          },
          onZoomEnd: (){

          },
        )
        ,
        Container(
            child: _renderSteps(_steps)
        ),
        InkWell(
          child: Card(
           color: Colors.white,
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
      ],),
    );
  }

  Widget _renderSteps(List<Step> steps) {

    return ExpansionPanelList.radio(
      children: steps.map<ExpansionPanelRadio>((Step step) {
        return ExpansionPanelRadio(

            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(step.BranchName,style: TextStyle(
                    fontSize: step.ismain=="1"? 18:16,
                    color:step.ismain=="1"? Colors.blue.shade900:Colors.blue)),
              );
            },
            body: ListTile(
                title:       Container(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(20)),

                    height: step.ishasdata=="0"? 0:160,
                    width: 360,
                    child:Column(children: [

                      step.address==''?Row():   Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(step.address,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                      SizedBox(height: 10,),
                      step.tel==''?Row(): Row( children: [Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),Text(step.tel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                      SizedBox(height: 10,),
                      step.email==''?Row(): Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(step.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                    ],)),
                subtitle: _renderSteps(step.subSteps)
            ),
            value: step.BranchName
        );
      }).toList(),
    );
  }
}*/
  //final List<BranchModel> _data =  branchmodel_list_main;


/*ScrollableListTabView(

        tabHeight: 52,
        bodyAnimationDuration: const Duration(milliseconds: 150),
        tabAnimationCurve: Curves.easeOut,
        tabAnimationDuration: const Duration(milliseconds: 200),
        tabs: [
          ScrollableListTab(
              tab: ListTab(
                  label: Text('المركز الرئيسي',style: TextStyle(fontSize: 14,color: AppColor.kBlueColor,fontWeight: FontWeight.bold),),

                  showIconOnList: false),
              body:  ListView.separated(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                itemCount: controller.branchmodel_list_main.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(20)),

                        height: 210,
                        width: 350,
                        child:Column(children: [
                          Text(controller.branchmodel_list_main[index].BranchName!,style: TextStyle(fontSize: 14,color: AppColor.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(controller.branchmodel_list_main[index].address!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list_main[index].tel!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                          SizedBox(height: 10,),
                          controller.branchmodel_list_main[index].email! ==""? Row() : Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list_main[index].email!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                        ],)),
                    SizedBox(height: 5,)
                  ],
                ) ,
              )),
          ScrollableListTab(
              tab: ListTab(label: Text('الملحق الاداري',style: TextStyle(fontSize: 14,color: AppColor.kBlueColor,fontWeight: FontWeight.bold),)),
              body: ListView.separated(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                itemCount: controller.branchmodel_list_edary.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(20)),

                        height: 210,
                        width: 350,
                        child:Column(children: [
                          Text(controller.branchmodel_list_edary[index].BranchName!,style: TextStyle(fontSize: 14,color: AppColor.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(controller.branchmodel_list_edary[index].address!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list_edary[index].tel!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list_edary[index].email!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                        ],)),
                    SizedBox(height: 5,)
                  ],
                ) ,
              )),
          ScrollableListTab(
                 tab: ListTab(label: Text('فروع القاهرة',style: TextStyle(fontSize: 14,color: AppColor.kBlueColor,fontWeight: FontWeight.bold),)),

              body:   ListView.separated(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                itemCount: controller.branchmodel_list_edary.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(20)),

                        height: 210,
                        width: 350,
                        child:Column(children: [
                          Text(controller.branchmodel_list_edary[index].BranchName!,style: TextStyle(fontSize: 14,color: AppColor.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(controller.branchmodel_list_edary[index].address!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list_edary[index].tel!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                          SizedBox(height: 10,),
                          Row( children: [Icon(Icons.fax,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.branchmodel_list_edary[index].email!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                        ],)),
                    SizedBox(height: 5,)
                  ],
                ) ,
              )),

        ],
      ),*/
