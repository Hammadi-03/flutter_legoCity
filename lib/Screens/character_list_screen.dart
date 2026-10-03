import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/hogwarts_character.dart';
import 'character_detail_screen.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final List<HogwartsCharacter> _allCharacters = [
    HogwartsCharacter(
      name: 'Harry Potter',
      ability: 'Invisibility Cloak / Parselmouth',
      houseColor: const Color(0xFF740001),
      textColor: Colors.white,
      imageUrl: 'assets/Harry Potter.jpg',
      description:
          'The Boy Who Lived, famous for defeating Lord Voldemort as an infant and known for his bravery in Gryffindor house.',
    ),
    HogwartsCharacter(
      name: 'Hermione Granger',
      ability: 'Time-Turner / Crookshanks',
      houseColor: const Color(0xFF740001),
      textColor: Colors.white,
      imageUrl: 'assets/Hermione Granger.jpg',
      description:
          'An exceptionally talented and logical witch, top of her class at Hogwarts and key member of the Golden Trio.',
    ),
    HogwartsCharacter(
      name: 'Ron Weasley',
      ability: 'Wizard Chess / Scabbers',
      houseColor: const Color(0xFF740001),
      textColor: Colors.white,
      imageUrl: 'assets/Ron Weasley.jpg',
      description:
          'A loyal Gryffindor wizard from a large pure-blood family, known for his tactical bravery and skill at Wizard Chess.',
    ),
    HogwartsCharacter(
      name: 'Draco Malfoy',
      ability: 'Broomstick Flying / Slytherin',
      houseColor: const Color(0xFF1A472A),
      textColor: Colors.white,
      imageUrl: 'assets/Draco Malfoy.jpg',
      description:
          'A cunning Slytherin wizard from a wealthy pure-blood family, known for his rivalries and complex destiny at Hogwarts.',
    ),
    HogwartsCharacter(
      name: 'Albus Dumbledore',
      ability: 'Elder Wand / Phoenix Fawkes',
      houseColor: const Color(0xFF740001),
      textColor: Colors.white,
      imageUrl: 'assets/Albus Dumbledore.jpg',
      description:
          'The wise and revered Headmaster of Hogwarts School of Witchcraft and Wizardry, considered one of the greatest wizards of all time.',
    ),
    HogwartsCharacter(
      name: 'Severus Snape',
      ability: 'Potions Master / Occlumency',
      houseColor: const Color(0xFF1A472A),
      textColor: Colors.white,
      imageUrl: 'assets/Severus Snape.jpg',
      description:
          'The enigmatic Potions Master and Defense Against the Dark Arts professor, possessing profound mastery over Occlumency.',
    ),
    HogwartsCharacter(
      name: 'Lord Voldemort',
      ability: 'Dark Arts / Nagini',
      houseColor: const Color(0xFF1A472A),
      textColor: Colors.white,
      imageUrl: 'assets/Lord Voldemort.jpg',
      description:
          'The most dangerous Dark wizard of all time, who sought immortality and supreme dominance over the wizarding world.',
    ),
    HogwartsCharacter(
      name: 'Rubeus Hagrid',
      ability: 'Care of Magical Creatures',
      houseColor: const Color(0xFF740001),
      textColor: Colors.white,
      imageUrl: 'assets/Rubeus Hagrid.jpg',
      description:
          'The beloved Keeper of Keys and Grounds at Hogwarts, known for his deep affection and gentle nature towards magical creatures.',
    ),
  ];

  String _searchQuery = '';
  String _selectedHouse = 'All';
  final Set<String> _favoriteNames = {};

  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _allCharacters.where((c) {
      final matchesSearch = c.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          c.ability.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesHouse = _selectedHouse == 'All' ||
          (_selectedHouse == 'Gryffindor' && c.houseColor == const Color(0xFF740001)) ||
          (_selectedHouse == 'Slytherin' && c.houseColor == const Color(0xFF1A472A));
      return matchesSearch && matchesHouse;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hogwarts Characters'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search & Filter Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Search characters or spells...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Color(0xFF740001), width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: ['All', 'Gryffindor', 'Slytherin'].map((house) {
                final isSelected = _selectedHouse == house;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(house),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedHouse = house;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFF740001).withValues(alpha: 0.15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          // Character List
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Text(
                      'No characters found',
                      style: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final character = filtered[index];
                      final isFav = _favoriteNames.contains(character.name);

                      return Card(
                        color: Colors.white,
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.zero,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetailScreen(character: character),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Hero(
                                  tag: character.name,
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundColor: Colors.grey.shade200,
                                    backgroundImage: _getImageProvider(character.imageUrl),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        character.name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF740001),
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        child: Text(
                                          character.ability,
                                          style: GoogleFonts.poppins(
                                            fontSize: 11,
                                            color: character.textColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                    color: isFav ? const Color(0xFF740001) : Colors.grey.shade400,
                                    size: 26,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (isFav) {
                                        _favoriteNames.remove(character.name);
                                      } else {
                                        _favoriteNames.add(character.name);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}