import 'package:get/get.dart';
import 'package:smarttelecom/data/services/remote/mail_service.dart';
import 'package:smarttelecom/modules/contacto/contacto_controller.dart';

class MailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactoController>(() => ContactoController());

    Get.lazyPut<MailService>(() => MailService());
  }
}
