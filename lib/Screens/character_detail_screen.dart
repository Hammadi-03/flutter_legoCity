import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Section 1


            Center(
              child: Hero(
                tag: character.name,
                child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: _getImageProvider(character.imageUrl),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              character.name,
              style: GoogleFonts.cinzel(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: character.houseColor,
              ),
            ),

            const SizedBox(height: 12),

            // Section 2

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: character.houseColor,
                borderRadius: BorderRadius.zero,
              ),
              child: Text(
                character.ability,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: character.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Section 3
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                color: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.auto_stories_rounded, color: character.houseColor),
                          const SizedBox(width: 8),
                          Text(
                            "Biography | Tentang",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        character.description,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Section 4
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SizedBox(
                width: 200,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: character.houseColor,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    elevation: 1,
                  ),
                  icon: const Icon(Icons.bolt_rounded),
                  label: Text(
                    'Cast Signature Spell',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✨ Wand activated for ${character.name}!'),
                        backgroundColor: character.houseColor,
                        behavior: SnackBarBehavior.floating,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}