import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:smarttelecom/data/model/cards_model.dart';

class SlidesShowProduct extends StatelessWidget {
  const SlidesShowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Swiper(
        scale: 1,
        autoplay: true,
        pagination: const SwiperPagination(
            // margin: const EdgeInsets.only(top: 0),
            builder: RectSwiperPaginationBuilder(
                activeColor: Colors.white, color: Colors.white)),
        itemCount: tarjetas.length,
        //itemBuilder: (context, index) => const _Slide(),
        itemBuilder: (context, index) => _Slide(tarjetas: tarjetas[index]),
        controller: SwiperController(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Tarjeta tarjetas;
  const _Slide({required this.tarjetas});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Image.asset(
          tarjetas.image!,
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
                      child: Text(
                        tarjetas.title!,
                        style: const TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tarjetas.description!,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
