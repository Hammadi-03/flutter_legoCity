import 'package:flutter/material.dart';
import '../Models/hogwarts_character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final HogwartsCharacter character;

  const CharacterDetailScreen({super.key, required this.character});

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
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: _getImageProvider(character.imageUrl),
            ),
            const SizedBox(height: 24),
            Text(
              character.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: character.houseColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Unique Ability: ${character.ability}',
                style: TextStyle(fontSize: 18, color: character.textColor, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'This screen displays the character\'s larger portrait. You can add more stats and historical data here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}