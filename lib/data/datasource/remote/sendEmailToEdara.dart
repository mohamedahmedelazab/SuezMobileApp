import 'package:suezproduction/core/class/crud.dart';
import 'package:suezproduction/linkapi.dart';

class SendEmailToedara {
  Crud crud;

  SendEmailToedara(this.crud);

  postData( String name,String subject,String from,String to) async {
    var response = await crud.postData(AppLink.send_email_to_edara, {
      "name":name,
      "subject":subject,
      "from":from,
      "to":to,

    });
    return response.fold((l) => l, (r) => r);
  }
}
