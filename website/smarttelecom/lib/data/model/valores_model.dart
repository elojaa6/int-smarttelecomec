class Valores {
  String? image, description, title;
  int? id;

  Valores({this.id, this.image, this.description, this.title});
}

// Demo List of my works
List<Valores> valores = [
  Valores(
    id: 1,
    title: "Innovación",
    description:
        "Exploramos continuamente nuevas ideas y tecnologías para impulsar el progreso y la excelencia.",
    image: "images/valores/8.gif",
  ),
  Valores(
    id: 2,
    title: "Integridad",
    description:
        "Operamos con transparencia, honestidad y ética en todas nuestras interacciones.",
    image: "images/valores/9.gif",
  ),
  Valores(
    id: 3,
    title: "Empoderamiento",
    description:
        "Proporcionamos herramientas y soluciones tecnológicas que permiten a las personas tomar decisiones informadas y mejorar sus vidas. ",
    image: "images/valores/10.gif",
  ),
  Valores(
    id: 4,
    title: "Colaboración",
    description:
        "Fomentamos la colaboración interna y externa para lograr un impacto duradero.",
    image: "images/valores/14.gif",
  ),
  Valores(
    id: 5,
    title: "Sostenibilidad",
    description:
        "Desarrollamos soluciones eficientes y respetuosas con el medio ambiente para contribuir a una sociedad sostenible. ",
    image: "images/valores/13.gif",
  ),
];
