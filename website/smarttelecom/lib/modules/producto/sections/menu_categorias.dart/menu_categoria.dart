import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/modules/producto/producto_controller.dart';

class MenuCategoria extends GetResponsiveView<ProductoController> {
  MenuCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.width < 850 ? true : false;
    double width = context.width;
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
            horizontal: width / 10, vertical: isMobile ? 30 : 10),
        child: ResponsiveGridRow(
          children: controller.categorias.map(
            (categorias) {
              return ResponsiveGridCol(
                xs: 12,
                md: 6,
                lg: 4,
                child: GestureDetector(
                  onTap: () {
                    controller.categoriaSeleccionadaId =
                        RxInt(categorias.categoriaId!);
                    controller.categoriasChange();
                  },
                  child: _CardType1(
                    label: categorias.nombreCategoria.toString(),
                    elevation: 5.0,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            /*Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
              ),
            ),*/
            Align(
              alignment: Alignment.center,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}
