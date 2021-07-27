import 'package:flutter/material.dart';

class Project {
  List<String> images = [];
  String tilte;
  String subTitle;
  List<String> labels = [];
  String link;
  Project({
    this.link,
    this.images,
    this.labels,
    this.subTitle,
    this.tilte,
  });
}

class AllProjects extends ChangeNotifier {
  List<Project> _allProjects = [
    Project(
        link: "https://play.google.com/store/apps/details?id=com.Mr.MyPet",
        tilte: "MyPet",
        labels: [
          'Flutter',
          'Dart',
          'Firebase',
        ],
        images: ['assets/images/P1-0.jpg', 'assets/images/P1-1.jpg'],
        subTitle:
            'MyPet is A single solution for all your needs. Management of animals, adoptions, volunteers, communication with the adopters and Sellers. Collaborate with all the members using  MyPet app chat.'),
    Project(
        tilte: "MR PortoFolio",
        labels: [
          'Flutter',
          'Dart',
          'Firebase',
        ],
        images: ['assets/images/P2-0.jpg', 'assets/images/P2-1.jpg'],
        subTitle:
            'it\'s my Own Portfolio, I totally build it using flutter and dart'),
  ];

  List<Project> get allProjects {
    return [..._allProjects];
  }
}
