import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttelecom/modules/home/sections/top/components/glass_content.dart';

class BlurBox extends GetResponsiveView {
  BlurBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        GlassContent(),
        const Spacer(),
      ],
    );
  }
}
