import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/data/services/remote/api/api.dart';
import 'package:smarttelecom/modules/home/constants.dart';
import 'package:smarttelecom/routes/routes.dart';

void main() async {
  await TelecomApi().configureDio();
  //await TelecomApi.loginServicio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SmarTelecom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorSchemeSeed: const Color.fromARGB(255, 167, 197, 243),
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.INICIO,
    );
  }
}
