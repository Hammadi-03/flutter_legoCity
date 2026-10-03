import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/main_navigation_screen.dart';

void main() {
  runApp(const LegoHarryPotterApp());
}

class LegoHarryPotterApp extends StatelessWidget {
  const LegoHarryPotterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final seedColor = const Color(0xFF740001); // Gryffindor Crimson
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEGO® Harry Potter™',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          secondary: const Color(0xFFD3A625), // Hogwarts Gold
          surface: const Color(0xFFFBF8F5),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 2,
          backgroundColor: const Color(0xFFFBF8F5),
          titleTextStyle: GoogleFonts.cinzel(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF740001),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 3,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          height: 65,
          indicatorColor: const Color(0xFF740001).withValues(alpha: 0.15),
          labelTextStyle: WidgetStateProperty.all(
            GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}