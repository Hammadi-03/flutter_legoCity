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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_alt_rounded, color: theme.colorScheme.primary),
            label: 'Characters',
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline_rounded),
            selectedIcon: Icon(Icons.favorite_rounded, color: theme.colorScheme.primary),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: const Icon(Icons.shield_outlined),
            selectedIcon: Icon(Icons.shield_rounded, color: theme.colorScheme.primary),
            label: 'Houses',
          ),
        ],
      ),
    );
  }
}