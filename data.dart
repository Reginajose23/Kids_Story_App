import 'package:flutter/material.dart';

class AnimalInfo {
  final int position;
  final String name;
  final String IconImage;
  final String description;
  final Color color;
  final String paragraph;
  final List<String> images;

  //final int position;

  AnimalInfo(this.position,
      {required this.name,
        required this.IconImage, required this.description, required this.color, required this.paragraph,
        required this.images});
}

  List<AnimalInfo> animallist = [
    AnimalInfo(1,
        name: "Noah Ark",
        color:Colors.redAccent,
        IconImage:'assets/images/noah_ark.jpg',
        description:'God instructed Noah to build an ark',
        paragraph:
        "God instructed Noah to build an ark—a massive vessel made of gopher wood, sealed with pitch inside and out.",
        images:[]  ),
    AnimalInfo(2,
        name: 'Jesus Birth',
        color:Colors.blueAccent,
        IconImage:'assets/images/jesus_car2.jpg',
        description:'Jesus was born in Bethlehem to Joseph and Mary',
        paragraph:
        " The story of Jesus’ birth is known as the Nativity, where angels greet shepherds, watching their flocks, and lead them to the side of the infant King Jesus, resting in a feeding trough. Young Mary (still a virgin) and her betrothed Joseph marvel at the shepherds’ report.",
        images:[]  ),

  ];
