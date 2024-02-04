class TarjetaProductos {
  String? title;
  String? description;
  String? image;

  TarjetaProductos({this.title, this.description, this.image});
}

List<TarjetaProductos> tarjetaProductos = [
  TarjetaProductos(
      title: 'LoRaWAN® Sensor',
      description:
          'Es un dispositivo IoT ',
      image:
          'images/products/GS301.png'),
  TarjetaProductos(
      title: 'LoRaWAN® Gateway',
      description:
          'Es un dispositivo que actúa ',
      image:
          'images/products/GS301.png'),
  TarjetaProductos(
      title: 'LoRaWAN® Controller',
      description:
          'Es un componente central ',
      image:
          'images/products/GS301.png'),
  TarjetaProductos(
      title: 'IoT Display',
      description:
          'Es una pantalla que muestra ',
      image:
          'images/products/GS301.png'),
];