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
      appBar: AppBar(
        title: Text(character.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sharing ${character.name}...')),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Hero Avatar with Glowing Shadow
            Center(
              child: Hero(
                tag: character.name,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: character.houseColor.withValues(alpha: 0.4),
                        blurRadius: 24,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _getImageProvider(character.imageUrl),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Character Title
            Text(
              character.name,
              style: GoogleFonts.cinzel(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: character.houseColor,
              ),
            ),

            const SizedBox(height: 12),

            // Unique Ability Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: character.houseColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: character.houseColor.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    character.ability,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: character.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Description Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.auto_stories_rounded, color: character.houseColor),
                          const SizedBox(width: 8),
                          Text(
                            'Biography & Lore',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
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

            // Cast Spell Interactive Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: character.houseColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                    elevation: 4,
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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