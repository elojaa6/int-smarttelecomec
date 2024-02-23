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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width / 10, vertical: isMobile ? 30 : 10),
      child: Obx(
        () => ResponsiveGridRow(
          children: controller.categorias.map(
            (categorias) {
              final isSelected = categorias.categoriaId ==
                  controller.categoriaSeleccionadaId.value;

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
                    isSelected: isSelected,
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
  final bool isSelected;

  const _CardType1(
      {required this.label, required this.elevation, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: isSelected
          ? Colors.blue
          : null, // Color diferente si está seleccionado
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors
                          .black, // Color de texto diferente si está seleccionado
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
