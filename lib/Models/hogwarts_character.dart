import 'package:flutter/material.dart';

class HogwartsCharacter {
  final String name;
  final String ability;
  final Color houseColor;
  final Color textColor;
  final String imageUrl;
  final String description;

  HogwartsCharacter({
    required this.name,
    required this.ability,
    required this.houseColor,
    required this.textColor,
    required this.imageUrl,
    required this.description,
  });
}