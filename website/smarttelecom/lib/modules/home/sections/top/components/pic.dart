import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Pic extends GetResponsiveView {
  Pic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isMobile = MediaQuery.of(context).size.width < 850 ? true : false;
    // double width = MediaQuery.of(context).size.width;
    // return Container(
    //   margin: EdgeInsets.fromLTRB(isMobile ? 15 : width / 10, isMobile ? 0 : 50,
    //       isMobile ? 15 : width / 10, 50),
    //   child: Image.asset("images/STEHC.png"),
    // );
    return ResponsiveGridRow(
        children: [ResponsiveGridCol(child: Image.asset("images/STEHC.png"))]);
  }
}
