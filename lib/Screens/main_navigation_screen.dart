import 'package:flutter/material.dart';
import 'character_list_screen.dart';
import 'favorites_screen.dart';
import 'houses_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CharacterListScreen(),
    const FavoritesScreen(),
    const HousesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.grey.shade100,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: 'Houses',
          ),
        ],
      ),
    );
  }
}