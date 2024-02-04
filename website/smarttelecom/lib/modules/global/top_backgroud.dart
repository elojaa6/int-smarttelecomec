import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBackgroud extends StatelessWidget {
  const TopBackgroud({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.context!.width;
    return SizedBox(
      width: width,
      height: width < 780 ? 300 : 450,
      child: Image.asset(
        'images/bg/bg-crud.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
