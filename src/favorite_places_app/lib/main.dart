import 'package:favorite_places_app/screens/add_place.dart';
import 'package:favorite_places_app/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

//Native Device Features

final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    background: const Color.fromARGB(255, 56, 49, 66),
    seedColor: const Color.fromARGB(255, 102, 6, 247));

final theme = ThemeData().copyWith(
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
      titleSmall: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold,
      ),
    ));

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Places App',
        theme: theme,
        home: const PlacesScreen(),
        routes: {
          '/add-place': (ctx) => const AddPlaceScreen(),
        });
  }
}
