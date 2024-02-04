import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/home/constants.dart';
import 'package:smarttelecom/modules/home/sections/top/components/glass_content.dart';

class TopSection extends GetResponsiveView {
  TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 850 ? true : false;
    double width = context.width;
    //Wrap(spacing: 20, runSpacing: 80, children: [
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [kDefaultShadow],
        image: DecorationImage(
            image: AssetImage('images/bg/backd.png'), fit: BoxFit.fill),
      ),
      child: Container(
          margin: EdgeInsets.fromLTRB(
              isMobile ? 15 : width / 10, 50, isMobile ? 15 : width / 10, 50),
          child: GlassContent()),
    );
    // return SafeArea(
    //   child: Stack(
    //     children: [Image.asset("images/backgroud.jpg")],
    //   ),
    // );
  }
}
