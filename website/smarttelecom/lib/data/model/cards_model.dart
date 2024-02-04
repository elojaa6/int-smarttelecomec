class Tarjeta {
  String? title;
  String? description;
  String? image;

  Tarjeta({this.title, this.description, this.image});
}

List<Tarjeta> tarjetas = [
  Tarjeta(
      title: 'LoRaWAN® Sensor',
      description:
          'Es un dispositivo IoT que recopila datos ambientales y los transmite de forma inalámbrica a través de la tecnología LoRaWAN, siendo útil en aplicaciones de monitorización y control en tiempo real.',
      image:
          'images/products/2.jpeg'),
  Tarjeta(
      title: 'LoRaWAN® Gateway',
      description:
          'Es un dispositivo que actúa como punto de acceso en redes IoT LoRaWAN, permitiendo la comunicación de dispositivos finales con la infraestructura de red LoRaWAN.',
      image:
          'images/products/1.jpeg'),
  Tarjeta(
      title: 'LoRaWAN® Controller',
      description:
          'Es un componente central que gestiona y coordina la comunicación en una red LoRaWAN, facilitando la administración y control de dispositivos IoT en la red.',
      image:
          'images/products/3.jpeg'),
  Tarjeta(
      title: 'IoT Display',
      description:
          'Es una pantalla que muestra datos en tiempo real de dispositivos conectados a una red IoT, brindando información visual y facilitando la supervisión y el control de sistemas inteligentes.',
      image:
          'images/products/4.jpeg'),
];