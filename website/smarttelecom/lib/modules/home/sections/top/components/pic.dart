import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Pic extends GetResponsiveView {
  Pic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
        children: [ResponsiveGridCol(child: Image.asset("images/STEHC.png"))]);
  }
}
