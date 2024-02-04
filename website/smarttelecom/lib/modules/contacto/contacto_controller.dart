// ignore_for_file: use_build_context_synchronously

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/data/model/mail.dart';
import 'package:smarttelecom/data/services/remote/mail_service.dart';

class ContactoController extends GetxController {
  MailService mailService = Get.find<MailService>();

  TextEditingController asuntoController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Rx<Mail> mail = Mail().obs;

  final formKey = GlobalKey<FormState>();

  void clean() {
    asuntoController.text = "";
    mailController.text = "";
    messageController.text = "";
  }

  Future<Map<String, dynamic>> sendMail() async {
    Map<String, dynamic> result = {};
    try {
      mail.value.asunto = asuntoController.text;
      mail.value.emailUser = mailController.text;
      mail.value.mensaje = messageController.text;

      final String? response = await mailService.sendMail(mail.value);
      result.addAll({"title": "Send", "message": response});
    } catch (e) {
      result.addAll({"title": "Error", "message": e.toString()});
    }
    return result;
  }
}
