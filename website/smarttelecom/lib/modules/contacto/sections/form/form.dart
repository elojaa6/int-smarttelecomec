import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/contacto/contacto_controller.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/modules/home/constants.dart';

class FormContacto extends StatelessWidget {
  const FormContacto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [kDefaultShadow],
          image: DecorationImage(
              image: AssetImage('images/bg/form.png'), fit: BoxFit.cover),
        ),
        child: const _Panel());
  }
}

class _Panel extends StatelessWidget {
  const _Panel();

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 850 ? true : false;
    double width = context.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : width / 10, 50, isMobile ? 15 : width / 10, 50),
      child: const _Card(),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    double width = context.width;

    return Container(
      width: width < 850 ? width : width / 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: _Info(),
      ),
    );
  }
}

class _Info extends GetResponsiveView<ContactoController> {
  _Info();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SizedBox(
        width: context.width,
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: vollkorn("Contacta con Nosotros",
                            context.width < 850 ? 25 : 52, Colors.black)),
                  ],
                ),
              ),
            ),
            ResponsiveGridCol(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: encodeSans(
                            "¿Tiene alguna pregunta? No dude en comunicarse con nosotros",
                            18,
                            const Color.fromRGBO(66, 73, 87, 1))),
                  ],
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.mailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, ingrese su correo electrónico';
                    }
                    final RegExp emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                    if (!emailRegex.hasMatch(value)) {
                      return 'Por favor, ingrese un correo electrónico válido';
                    }

                    return null;
                  },
                  autofillHints: const [AutofillHints.email],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Correo'),
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.subject,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.messageController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ingrese Mensaje';
                    }

                    return null;
                  },
                  maxLines: 10,
                  decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      label: Text('Mensaje'),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            ResponsiveGridCol(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.sendMail().then((value) => {
                              ElegantNotification.success(
                                      title: Text(value['title']),
                                      description: Text(value['message']))
                                  .show(context)
                            });
                        controller.clean();
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(107, 117, 126, 1)),
                    ),
                    child: const Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
