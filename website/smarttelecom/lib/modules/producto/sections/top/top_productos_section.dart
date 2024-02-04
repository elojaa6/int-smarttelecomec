import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/producto/sections/top/widget/slideshow.dart';

class TopProductos extends GetResponsiveView {
  TopProductos({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isMobile = context.width < 850 ? true : false;
    // double width = context.width;
    return const SlidesShowProduct();
  }
}
