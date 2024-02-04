import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/home/sections/top/components/pic.dart';

class GlassContent extends GetResponsiveView {
  GlassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: ResponsiveGridRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveGridCol(
              lg: 6,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: _TextComplete(),
              ),
            ),
            ResponsiveGridCol(lg: 6, child: Pic())
          ],
        ),
      ),
    );
  }
}

class _TextComplete extends StatelessWidget {
  const _TextComplete();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //ResponsiveGridCol(child: const _TextSmall(text: "Bienvenido A!")),
          ResponsiveGridCol(
            child: const _TextBold(text: "Bienvenido A!"),
          ),
          ResponsiveGridCol(
            child: const _TextSmall(text: "LoRaWAN@"),
          ),
        ]);
  }
}

class _TextBold extends StatelessWidget {
  const _TextBold({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.width < 779 ? 50 : 100,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.5,
      ),
    );
  }
}

class _TextSmall extends StatelessWidget {
  final String text;
  const _TextSmall({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.white),
    );
  }
}
