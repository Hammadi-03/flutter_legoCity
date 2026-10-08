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
    final seedColor = const Color(0xFF740001); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEGO® Harry Potter™',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          secondary: const Color(0xFFD3A625), 
          surface: Colors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,

          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: GoogleFonts.cinzel(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF740001),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: Colors.black12,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          height: 65,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
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