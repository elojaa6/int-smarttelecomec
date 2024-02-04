import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';

class TopNosotros extends StatelessWidget {
  const TopNosotros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('images/bg/12.png'), fit: BoxFit.cover),
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
      child: const _Info(),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveGridCol(
          lg: 6,
          child: const _TextComplete(),
        ),
        ResponsiveGridCol(
          lg: 6,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("images/products/4.jpeg"),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextComplete extends StatelessWidget {
  const _TextComplete();

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          child: openSans(
              "Nuestra Historia!", context.width < 779 ? 32 : 52, Colors.black),
        ),
        ResponsiveGridCol(
            child: manrope(
                "Incididunt cupidatat id elit ullamco adipisicing ut ad. Commodo mollit quis labore nisi voluptate elit. Esse ea dolor aute ea sunt. Id duis ullamco adipisicing ex anim. Cillum ut exercitation veniam do minim laboris pariatur non labore esse occaecat esse. Eiusmod consequat dolore cillum elit ut exercitation aliqua aute quis dolore consequat id deserunt. Proident tempor non eu enim.",
                context.width < 779 ? 15 : 18,
                Colors.black))
      ],
    );
  }
}
