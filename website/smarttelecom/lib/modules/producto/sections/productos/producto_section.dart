import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smarttelecom/data/model/producto.dart';
import 'package:smarttelecom/data/model/sub_categoria.dart';
import 'package:smarttelecom/modules/global/re_usable.text.dart';
import 'package:smarttelecom/modules/global/re_usable_button.dart';
import 'package:smarttelecom/modules/producto/producto_controller.dart';

class ProductosSection extends GetResponsiveView {
  ProductosSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 850 ? true : false;
    double width = context.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : width / 10, 10, isMobile ? 15 : width / 10, 10),
      child: _Panel(),
    );
  }
}

class _Panel extends GetResponsiveView<ProductoController> {
  _Panel();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ResponsiveGridRow(
        children: controller.subCategorias.map(
          (subCategorias) {
            return ResponsiveGridCol(
              child: _Subcategoria(
                subcategoria: subCategorias,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _Subcategoria extends GetResponsiveView<ProductoController> {
  final SubCategoria subcategoria;
  _Subcategoria({required this.subcategoria});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: openSans(subcategoria.nombreSubcategoria.toString(),
              context.width < 779 ? 25 : 52, Colors.black),
        ),
        if (subcategoria.subcategoriasHijas!.isNotEmpty)
          Obx(
            () => ResponsiveGridRow(
              children: [
                ...subcategoria.subcategoriasHijas!.map(
                  (hijas) {
                    final isSelected = hijas.subcategoriaId ==
                        controller.subCategoriaSeleccionadaId.value;
                    return ResponsiveGridCol(
                      xs: 12,
                      md: 6,
                      lg: 4,
                      child: GestureDetector(
                        onTap: () {
                          controller.subCategoriaSeleccionadaId =
                              RxInt(hijas.subcategoriaId!);
                          controller.productosSubCategorias();
                        },
                        child: _CardType1(
                          label: hijas.nombreSubcategoria.toString(),
                          elevation: 5.0,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  },
                ).toList(),
                ResponsiveGridCol(
                  child: _SlidesShowProductos(
                    producto: controller.productos.toList(),
                  ),
                ),
              ],
            ),
          )
        else
          _SlidesShowProductos(
            producto: subcategoria.productos!.toList(),
          )
      ],
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

class _SlidesShowProductos extends GetResponsiveView {
  final List<Producto> producto;
  _SlidesShowProductos({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: SizedBox(
        height: 350,
        width: double.infinity,
        child: Swiper(
          viewportFraction: 0.4,
          scale: 0.1,
          autoplay: true,
          pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.grey.shade300, color: Colors.grey.shade500),
          ),
          itemCount: producto.length,
          itemBuilder: (context, index) => _Slide(
            producto: producto[index],
          ),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Producto producto;

  const _Slide({required this.producto});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Imagen

            SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                    onTap: () => {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor:
                                  const Color.fromRGBO(222, 225, 230, 1),
                              title: Center(
                                  child:
                                      Text(producto.nombreProducto.toString())),
                              actions: [
                                ...producto.archivosPdf!.map((e) => TextButton(
                                    onPressed: () {
                                      externo(
                                          Uri.parse(e.archivoPdf.toString()));
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black38,
                                    ),
                                    child: Text(e.name.toString()))),
                              ],
                              content: Column(
                                children: [
                                  Image.asset(
                                    "https://smarttelecomec.com/media/${producto.imagenesProductos!.first.name}",
                                    /*height: 500,
                                    width: 600,*/
                                    fit: BoxFit.cover,
                                  ),
                                  Text(producto.descripcionProducto.toString()),
                                  Text(producto.precioProducto.toString()),
                                ],
                              ),
                            ),
                          )
                        },
                    child: Image.asset(
                      "https://smarttelecomec.com/media/${producto.imagenesProductos!.first.name}",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(height: 5),

            //* Title
            SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  producto.nombreProducto.toString(),
                  maxLines: 2,
                  style: textStyles.titleSmall,
                ),
              ),
            ),

            SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  producto.precioProducto.toString(),
                  maxLines: 2,
                  style: textStyles.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
