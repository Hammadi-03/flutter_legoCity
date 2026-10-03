import 'package:flutter/material.dart';
import '../Models/hogwarts_character.dart';
import 'character_detail_screen.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final List<HogwartsCharacter> characters = [
    HogwartsCharacter(
      name: 'Harry Potter',
      ability: 'Invisibility Cloak / Parselmouth',
      houseColor: Colors.red.shade100,
      textColor: Colors.red.shade900,
      imageUrl: 'assets/Harry Potter.jpg',
    ),
    HogwartsCharacter(
      name: 'Hermione Granger',
      ability: 'Time-Turner / Crookshanks',
      houseColor: Colors.red.shade100,
      textColor: Colors.red.shade900,
      imageUrl: 'assets/Hermione Granger.jpg',
    ),
    HogwartsCharacter(
      name: 'Ron Weasley',
      ability: 'Wizard Chess / Scabbers',
      houseColor: Colors.red.shade100,
      textColor: Colors.red.shade900,
      imageUrl: 'assets/Ron Weasley.jpg',
    ),
    HogwartsCharacter(
      name: 'Draco Malfoy',
      ability: 'Broomstick Flying / Slytherin',
      houseColor: Colors.green.shade100,
      textColor: Colors.green.shade900,
      imageUrl: 'assets/Draco Malfoy.jpg',
    ),
    HogwartsCharacter(
      name: 'Albus Dumbledore',
      ability: 'Elder Wand / Phoenix Fawkes',
      houseColor: Colors.red.shade100,
      textColor: Colors.red.shade900,
      imageUrl: 'assets/Albus Dumbledore.jpg',
    ),
    HogwartsCharacter(
      name: 'Severus Snape',
      ability: 'Potions Master / Occlumency',
      houseColor: Colors.green.shade100,
      textColor: Colors.green.shade900,
      imageUrl: 'assets/Severus Snape.jpg',
    ),
    HogwartsCharacter(
      name: 'Lord Voldemort',
      ability: 'Dark Arts / Nagini',
      houseColor: Colors.green.shade100,
      textColor: Colors.green.shade900,
      imageUrl: 'assets/Lord Voldemort.jpg',
    ),
    HogwartsCharacter(
      name: 'Rubeus Hagrid',
      ability: 'Care of Magical Creatures',
      houseColor: Colors.red.shade100,
      textColor: Colors.red.shade900,
      imageUrl: 'assets/Rubeus Hagrid.jpg',
    ),
  ];

  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hogwarts Characters'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetailScreen(character: character),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _getImageProvider(character.imageUrl),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: character.houseColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: character.textColor.withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            character.ability,
                            style: TextStyle(fontSize: 12, color: character.textColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}