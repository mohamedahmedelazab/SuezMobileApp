import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:suezproduction/controller/Branches_controller.dart';
import 'package:suezproduction/core/constant/color.dart';
 import 'package:suezproduction/view/screen/Home.dart';
import 'package:suezproduction/view/screen/homescreen.dart';


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
      this.call,
      this.tel,

      this.email,
      this.lat,
      this.lnd,
      this.ismain ,
  
      this.ishasdata ,
      [this.subSteps = const <Step>[]]
      );

  String BranchName;
  String address;
  String call;
  String tel;

  String email;
  String lat;
  String lnd;
  String ismain;

  String ishasdata;
  List<Step> subSteps;
}
 
List<Step> getSteps() {
  return [

    Step("BranchName1".tr, "address1".tr,"01005385718", "tel1".tr,"email1".tr,"30.051333361189382","31.208407896642054","1","1",[
      Step("BranchNamesub1".tr, '',"0237614396","0237614396-0237602946","","","","0","1"),
      Step("BranchNamesub2".tr, '',"0237485525","0233356860-237485525","","","","0","1"),
      Step("BranchNamesub3".tr, '',"0233356840","0233356840-237492469","","","","0","1"),
      Step("BranchNamesub4".tr, '',"0233355219","0233355219-0233361251-0237609509","","","","0","1"),
      Step("BranchNamesub5".tr, '',"0237492406","0237492406","","","","0","1"),
      Step("BranchNamesub6".tr, '',"0233387982","0233387982-0237602344-0233355258-0237602304","","","","0","1"),
      Step("BranchNamesub7".tr, '',"0233386582","0233386582","","","","0","1"),
     // Step("   اجسام سفن", '',"0237499315","0237499315","","","","0","1"),
      Step("BranchNamesub8".tr, '',"0237600621","0237600621-0233363241","","","","0","1"),
      Step("BranchNamesub9".tr, '',"0237612863","0237612863","","","","0","1"),
      Step("BranchNamesub10".tr, '',"0237625877","0237625877-0237617133-0237617135","","","","0","1"),
      Step("BranchNamesub11".tr, '',"0237628939","0237628939-0233365164","","","","0","1"),
      Step("BranchNamesub12".tr, '',"0233380990","0233380990-0233355190","","","","0","1"),
      Step("BranchNamesub13".tr, '',"0233366571","0233366571-0233366596-0233361146","","","","0","1"),

    ]),

    Step("BranchName2".tr, "address2".tr,"", "tel2".tr,"email2".tr,"30.04793119575894","31.207289957671193","1","1",[
      Step("edary1name".tr, '',"0237492732","edary1tel".tr,"edary1fax".tr,"","","0","1"),
      Step("edary2name".tr, '',"0237491359","edary2tel".tr,"edary2fax".tr,"","","0","1"),
      Step("edary3name".tr, '',"0237491396","edary3tel".tr,"edary3fax".tr,"","","0","1"),
      Step("edary4name".tr, '',"0237617135","edary4tel".tr,"edary4fax".tr,"","","0","1"),
      Step("edary5name".tr, '',"01002153898","edary5tel".tr,"edary5fax".tr,"","","0","1"),
      //Step("edary6name".tr, '',"01001798901","edary6tel".tr,"edary6fax".tr,"","","0","1"),
    ]),


    Step("BranchName3".tr, "address3".tr,"01001798905", "tel3".tr,"email3".tr,"30.037860","31.205080","1","1",[
      Step("cario1name".tr, "cario1address".tr,"01001639325","cario1tel".tr,"cario1fax".tr,"30.042310","31.201500","0","1"),
      Step("cario2name".tr, "cario2address".tr,"01004380817","cario2tel".tr,"cario2fax".tr,"30.032010","31.200900","0","1"),
      Step("cario3name".tr, "cario3address".tr,"01093334928","cario3tel".tr,"cario3fax".tr,"30.074050","31.251020","0","1"),
      Step("cario4name".tr, "cario4address".tr,"01098889674","cario4tel".tr,"cario4fax".tr,"30.044000","31.242080","0","1"),
      Step("cario5name".tr, "cario5address".tr,"01000630820","cario5tel".tr,"cario5fax".tr,"29.977980","31.275110","0","1"),
      Step("cario6name".tr, "cario6address".tr,"01001798906","cario6tel".tr,"cario6fax".tr,"30.035080","31.486790","0","1"),
      Step("cario7name".tr, "cario7address".tr,"01001639326","cario7tel".tr,"cario7fax".tr,"30.100860","31.327080","0","1"),
      Step("cario8name".tr, "cario8address".tr,"01001639327","cario8tel".tr,"cario8fax".tr,"29.961413004075723","30.923146482600558","0","1"),
      Step("cario9name".tr, "cario9address".tr,"01001639328","cario9tel".tr,"cario9fax".tr,"30.291200","31.740620","0","1"),
    ]),

    Step("BranchName4".tr, "", "","" ,"","","","1","0",[
      Step("bahary1name".tr, "bahary1address".tr,"01001639329","bahary1tel".tr,"bahary1fax".tr,"30.466090","31.178630","0","1"),
      Step("bahary2name".tr, "bahary2address".tr,"01001639059","bahary2tel".tr,"bahary2fax".tr,"31.531230","34.960640","0","1"),
      Step("bahary3name".tr, "bahary3address".tr,"01001639392","bahary3tel".tr,"bahary3fax".tr,"30.804500","30.992430","0","1"),
      Step("bahary4name".tr, "bahary4address".tr,"01001639161","bahary4tel".tr,"bahary4fax".tr,"30.139590","31.071830","0","1"),
      Step("bahary5name".tr, "bahary5address".tr,"0473144493","bahary5tel".tr,"bahary5fax".tr,"31.109760","30.940300","0","1"),
      Step("bahary6name".tr, "bahary6address".tr,"01001639157","bahary6tel".tr,"bahary6fax".tr,"30.583420","31.488470","0","1"),
    ]),

    Step("BranchName5".tr, "address5".tr,"01001639396","tel5".tr ,"email5".tr,"31.238500","29.962660","1","1",[
      Step("alex1name".tr, "alex1address".tr,"0100075207","alex1tel".tr,"alex1fax".tr,"31.226140","29.967330","0","1"),
      Step("alex2name".tr, "alex2address".tr,"01001639395","alex2tel".tr,"alex2fax".tr,"31.094200","29.741450","0","1"),
      Step("alex3name".tr, "alex3address".tr," 01000709459","alex3tel".tr,"alex3fax".tr,"31.211811","29.986643","0","1"),
      Step("alex4name".tr, "alex4address".tr,"01001639397","alex4tel".tr,"alex4fax".tr,"31.039980","30.458980","0","1"),
      Step("alex5name".tr, "alex5address".tr,"0453319258","alex5tel".tr,"alex5fax".tr,"31.035690","30.463870","0","1"),

    ])

    ,

    Step("BranchName6".tr, "","","" ,"","","","1","0",[
      Step("canal1name".tr, "canal1address".tr,"01001639298","canal1tel".tr,"canal1fax".tr,"30.592830","32.272530","0","1"),
      Step("canal2name".tr, "canal2address".tr,"01019007377","canal2tel".tr,"canal2fax".tr,"30.585630","32.172000","0","1"),
      Step("canal3name".tr, "canal3address".tr,"0643488629","canal3tel".tr,"canal3fax".tr,"30.597538529418763","32.198663737013824","0","1"),
      Step("canal4name".tr, "canal4address".tr,"01001639269","canal4tel".tr,"canal4fax".tr,"29.971045115422","32.555195223003665","0","1"),
      Step("canal5name".tr, "canal5address".tr,"01000423556","canal5tel".tr,"canal5fax".tr,"29.942530","32.565490","0","1"),
      Step("canal6name".tr, "canal6address".tr,"01001639257","canal6tel".tr,"canal6fax".tr,"31.265750","32.311820","0","1"),
      Step("canal7name".tr, "canal7address".tr,"01001639267","canal7tel".tr,"canal7fax".tr,"31.417910","31.697070","0","1"),
      Step("canal8name".tr, "canal8address".tr,"01001639266","canal8tel".tr,"canal8fax".tr,"27.252588610385022","33.81459789841684","0","1"),
    ]),


    Step("BranchName7".tr, "","", "" ,"","","","1","0",[
      Step("qbly1name".tr, "qbly1address".tr,"010097055111","qbly1tel".tr,"qbly1fax".tr,"29.322700","30.854280","0","1"),
      Step("qbly2name".tr, "qbly2address".tr,"0822215328","qbly2tel".tr,"qbly2fax".tr,"29.073730","31.112970","0","1"),
      Step("qbly3name".tr, "qbly3address".tr,"01001639264","qbly3tel".tr,"qbly3fax".tr,"28.115860","30.729730","0","1"),
      Step("qbly4name".tr, "qbly4address".tr,"01001639258","qbly4tel".tr,"qbly4fax".tr,"27.187158","31.175422","0","1"),
      Step("qbly5name".tr, "qbly5address".tr,"01001639257","qbly5tel".tr,"qbly5fax".tr,"26.909830","31.442740","0","1"),
      Step("qbly6name".tr, "qbly6address".tr,"01001798902","qbly6tel".tr,"qbly6fax".tr,"25.679230","32.634300","0","1"),
      Step("qbly7name".tr, "qbly7address".tr,"01001639265","qbly7tel".tr,"qbly7fax".tr,"24.093430","32.907040","0","1")
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
    BranchControllerTmp controller= Get.put(BranchControllerTmp());
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
                          if (step.lat=="") {
                            const snackBar = SnackBar(
                              content: Text("لا توجد خريطة متاحه "),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          else {
                            controller.goToMap(
                                step.BranchName, step.lat, step.lnd);
                          }
                        },
                        child: step.address==''?Row():
                        Row( children: [Icon(Icons.fmd_good_sharp,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(step.address,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                      ),
                      SizedBox(height: 10,),
                      step.tel==''?Row():
                      InkWell(
                        onTap: (){
                          FlutterPhoneDirectCaller.callNumber(step.call);
                        },
                        child: Row( children: [
                          Icon(Icons.phone,color: AppColor.primaryColor),SizedBox(width: 4,),
                          Text(step.tel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                      )
                      
                      ,
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


