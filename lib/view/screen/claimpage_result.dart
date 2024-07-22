import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/claimpage_result_controller.dart';
import 'package:suezproduction/core/class/handlingdataview.dart';
import 'package:suezproduction/core/class/statusrequest.dart';
import 'package:suezproduction/core/constant/color.dart';
import 'package:suezproduction/view/screen/claimpage.dart';
import 'package:empty_widget/empty_widget.dart';

class ClaimpageResult extends StatelessWidget {
  ClaimPage_resultControllerImp controller =
      Get.put(ClaimPage_resultControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: GetBuilder<ClaimPage_resultControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.statusRequest == StatusRequest.notfound ?
              Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                EmptyWidget(
                  image: null,
                  packageImage: PackageImage.Image_2 ,
                  title: 'لا توجد بيانات',
                  subTitle: 'لا توجد بيانات تعويض لهذه الوثيقة',
                  titleTextStyle: TextStyle(
                    fontSize: 22,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitleTextStyle: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 21, 226, 199),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => claimpage()));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )
              ],),

        ):Container(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: 0.0,
                          top: 10.0,
                          child: Opacity(
                            opacity: 0.3,
                            child: Image.asset(
                              "assets/images/washing_machine_illustration.png",
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: kToolbarHeight,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => claimpage()));
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 18.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "تفاصيل الملف \n",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            "رقم الحادث ${controller.AccNo_res}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColor.scaffoldBackgroundColor,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 24.0,
                                    horizontal: 16.0,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "التفاصيل",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color:
                                              Colors.redAccent,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),



                                      getTotalRow("إسم المستفيد:-",
                                          controller.Benfishry_res!),

                                      getTotalRow("إسم المؤمن له :-",
                                          controller.INSREQST_res!),


                                      getTotalRow(
                                          "الادارة		", controller.DepID_res!),
                                      getTotalRow("الفرع المصدر	",
                                          controller.branchName_res!),
                                      getTotalRow("رقم الوثيقه			",
                                          controller.policyNo!),
                                      getTotalRow("تاريخ الحادث		",
                                          controller.AccDate_res!),
                                      getTotalRow("تاريخ الإصدار	",
                                          controller.IsuuDate_res!),
                                      getTotalRow("تاريخ بداية سريان	",
                                          controller.IsuuDate_res!),
                                      getTotalRow("تاريخ نهاية سريان	",
                                          controller.EndDate_res!),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "بيانات مالية",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color:
                                                  Colors.redAccent,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      getTotalRow("قسط صافي	",
                                          "\L.E ${controller.NetPrems_res!}"),
                                      getTotalRow("قسط إجمالي",
                                          "\L.E ${controller.TotalPrems_res!}"),
                                      getTotalRow("مبلغ التعويض	",
                                          "\L.E ${controller.ClaimValue_res!}"),
                                      getTotalRow("الإحتياطي ",
                                          "\L.E ${controller.reserve_res!}"),
                                      getTotalRow("المدفوع",
                                          "\L.E ${controller.payval_res!}"),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Divider(),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "موقف الملف  ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color:        Colors.redAccent,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                  RichText(
                                    text:TextSpan(text: controller.file_state_res!,style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    )))
                                   
                                   /*   ListView.separated(
                                        primary: false,
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) => const SizedBox(
                                          width: 25,
                                        ),
                                        itemCount: controller.papers_list.length,
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
                                                  Row( children: [Icon(Icons.send_rounded,color: AppColor.primaryColor,) ,SizedBox(width: 4,),Text(controller.papers_list[index].ser!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: AppColor.black),)]),
                                                  SizedBox(height: 10,),
                                                  Row( children: [Icon(Icons.calendar_month,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.papers_list[index].date!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black),)]),
                                                  SizedBox(height: 10,),
                                                  Row( children: [Icon(Icons.padding,color: AppColor.primaryColor),SizedBox(width: 4,),Text(controller.papers_list[index].papers!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: AppColor.black))]),
                                                ],)),
                                            SizedBox(height: 5,)
                                          ],
                                        ) ,
                                      )*/,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}

Widget getTotalRow(String title, String amount) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [

            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(19, 22, 33, 1),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
        Expanded(

          child: Align(
              alignment: Alignment.topLeft, child:Text(

              amount,
              style: TextStyle(

                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            )))


      ],
    ),
  );
}

Widget getSubtotalRow(String title, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}

Widget getItemRow(String count, String item, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            "   $item",
            style: TextStyle(
              color: Color.fromRGBO(143, 148, 162, 1),
              fontSize: 15.0,
            ),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}
