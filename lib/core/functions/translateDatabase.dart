import 'package:suezproduction/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnar,columnen){

  MyServices myservice=Get.find();
  if (myservice.sharedPreferences.getString("lang")=="ar" || myservice.sharedPreferences.getString("lang")==null) {

    return columnar;
  }
  else
    {

     return  columnen;
    }
}