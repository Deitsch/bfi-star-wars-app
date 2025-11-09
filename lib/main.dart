import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:star_wars_app/planet_detail_page.dart';
import 'package:star_wars_app/logger.dart';
import 'package:star_wars_app/models/planet.dart';
import 'package:star_wars_app/planet_page.dart';

final log = Logger('MyApp');

void main() {
  LoggingService().setupLogging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routes: {
        '/': (context) => const PlanetPage(),
        '/planetDetail': (context) {
          final planet = ModalRoute.of(context)!.settings.arguments as Planet;
          return PlanetDetailPage(planet: planet);
        },
      },
    );
  }
}
