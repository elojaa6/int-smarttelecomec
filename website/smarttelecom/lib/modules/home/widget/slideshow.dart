import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/data/model/valores_model.dart';

class SlidesShow extends StatelessWidget {
  const SlidesShow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary, color: colors.secondary),
        ),
        itemCount: valores.length,
        itemBuilder: (context, index) => _Slide(valores: valores[index]),
        controller: SwiperController(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Valores valores;
  const _Slide({required this.valores});
  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 10),
          )
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Image.asset(
                valores.image!,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Title(
                          color: Colors.white,
                          child: encodeSans(valores.title!, 32, Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: encodeSans(valores.description!, 16, Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
