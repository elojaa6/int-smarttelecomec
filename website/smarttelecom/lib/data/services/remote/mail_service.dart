import 'package:get/get.dart';
import 'package:smarttelecom/data/model/mail.dart';
import 'package:smarttelecom/data/services/remote/api/api.dart';

class MailService extends GetxService {
  Future<String?> sendMail(Mail mail) async {
    try {
      var result =
          await TelecomApi.post('/auth/formulario', data: mail.toJson());
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
