import 'package:flutter/material.dart';

class Fleure {
  Fleure(
      {required this.name,
      required this.desc,
      required this.size,
      required this.height,
      required this.humidity,
      required this.imageUrl,
      required this.plant,
      required this.price,
      required this.review
      });
  late String name;
  late String desc;
  late String size;
  late double price;
  late String plant;
  late double height;
  late String humidity;
  late String imageUrl;
  late String review;

  static List<Fleure> listFleures = [
    Fleure(
        name: "Monstera",
        desc:
            "Ce sont des herbes ou des vignes à feuilles persistantes , atteignant des hauteurs de 20 mètres (66 pieds) dans les arbres, grimpant au moyen de racines aériennes qui agissent comme des crochets sur les branches; ces racines pousseront également dans le sol pour aider à soutenir la plante. Comme la plante s'enracine à la fois dans le sol et sur les arbres, elle est considérée comme une hémiépiphyte .",
        size: "Medium",
        height: 20.5,
        humidity: "80%",
        imageUrl: "assets/fonts/imagesF/monstera0.png",
        plant: "Orchid",
        price: 40.15, review: "(26reviews)"),
    Fleure(
        name: "Ageratum",
        desc:
            "En tant que plante médicinale , Ageratum conyzoides est largement utilisé par de nombreuses cultures traditionnelles, contre la dysenterie et la diarrhée .C'est aussi un insecticide et un nématicide .L'ingestion d' A. conyzoides peut provoquer des lésions hépatiques et des tumeurs .Il y avait un incident d'empoisonnement de masse en Ethiopie à la suite de la contamination de grain avec A. conyzoides.La plante contient les alcaloïdes pyrrolizidine lycopsamine et échinatine .",
        size: "Medium",
        height: 15.4,
        humidity: "90%",
        imageUrl: "assets/fonts/imagesF/ageratum4.png",
        plant: "Orchid",
        price: 25.08,review: "(26reviews)"),
    Fleure(
        name: "Aloès",
        desc:
            "Aloe est un genre de plantes succulentes, les aloès, originaires d'Afrique, de Madagascar et les îles Mascareines, de la péninsule arabique et Socotra1.Les aloès, originaires d'Afrique, de Madagascar et les îles Mascareines, de la péninsule arabique et Socotra1.",
        size: "Medium",
        height: 30.0,
        humidity: "95%",
        imageUrl: "assets/fonts/imagesF/aloes1.png",
        plant: "Orchid",
        price: 28.12,review: "(26reviews)"),
    Fleure(
        name: "Royal palm",
        desc:
            "Roystonea regia, le palmier royal, est une espèce de grand palmier tropical appartenant à la famille des Arécacées. Originaire des Caraïbes et de Cuba, du Mexique et de la Floride, ce palmier atteignant parfois 30 m de hauteur s’est vu cultivé comme plante ornementale dans de nombreuses régions tropicales ou subtropicales. Roystonea elata est de nos jours, considéré de la même espèce que Roystonea regia.",
        size: "Medium",
        height: 20.0,
        humidity: "70%",
        imageUrl: "assets/fonts/imagesF/palmier0.png",
        plant: "Orchid",
        price: 30.5,review: "(26reviews)")
  ];

  static List<String> Imgaes = [
    "assets/fonts/imagesF/aloes3.png",
    "assets/fonts/imagesF/ageratum1.png",
    "assets/fonts/imagesF/begonia.png"
  ];
}
