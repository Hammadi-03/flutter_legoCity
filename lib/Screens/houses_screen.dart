import 'package:flutter/material.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hogwarts Houses'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildHouseCard('Gryffindor', Colors.red.shade900, Icons.pets),
          _buildHouseCard('Slytherin', Colors.green.shade900, Icons.eco),
          _buildHouseCard('Ravenclaw', Colors.blue.shade900, Icons.menu_book),
          _buildHouseCard('Hufflepuff', Colors.orange.shade700, Icons.spa),
        ],
      ),
    );
  }

  Widget _buildHouseCard(String name, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: color),
          const SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}