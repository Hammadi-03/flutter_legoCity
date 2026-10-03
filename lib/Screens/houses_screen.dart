import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  final List<Map<String, dynamic>> houseData = const [
    {
      'name': 'Gryffindor',
      'color': Color(0xFF740001),
      'accent': Color(0xFFD3A625),
      'icon': Icons.pets_rounded,
      'motto': 'Bravery, Chivalry & Daring',
      'ghost': 'Nearly Headless Nick',
    },
    {
      'name': 'Slytherin',
      'color': Color(0xFF1A472A),
      'accent': Color(0xFFA5A5A5),
      'icon': Icons.eco_rounded,
      'motto': 'Ambition, Cunning & Resourcefulness',
      'ghost': 'The Bloody Baron',
    },
    {
      'name': 'Ravenclaw',
      'color': Color(0xFF0E1A40),
      'accent': Color(0xFF946B2D),
      'icon': Icons.menu_book_rounded,
      'motto': 'Intelligence, Wit & Wisdom',
      'ghost': 'The Grey Lady',
    },
    {
      'name': 'Hufflepuff',
      'color': Color(0xFFECB939),
      'accent': Color(0xFF372E29),
      'icon': Icons.spa_rounded,
      'motto': 'Loyalty, Patience & Hard Work',
      'ghost': 'The Fat Friar',
    },
  ];

  void _showHouseDetails(BuildContext context, Map<String, dynamic> house) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),
              Icon(house['icon'] as IconData, size: 56, color: house['color'] as Color),
              const SizedBox(height: 12),
              Text(
                house['name'] as String,
                style: GoogleFonts.cinzel(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: house['color'] as Color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Motto: ${house['motto']}',
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Chip(
                avatar: const Icon(Icons.blur_on_rounded, size: 18),
                label: Text('House Ghost: ${house['ghost']}'),
                backgroundColor: (house['color'] as Color).withValues(alpha: 0.1),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hogwarts Houses'),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: houseData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final house = houseData[index];
          final houseColor = house['color'] as Color;
          final iconData = house['icon'] as IconData;

          return Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => _showHouseDetails(context, house),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      houseColor.withValues(alpha: 0.1),
                      Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: houseColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(iconData, size: 44, color: houseColor),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      house['name'] as String,
                      style: GoogleFonts.cinzel(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: houseColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      house['motto'] as String,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}