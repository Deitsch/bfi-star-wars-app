import 'package:flutter/material.dart';
import 'package:star_wars_app/api.dart';
import '../models/planet.dart';

class PlanetPage extends StatefulWidget {
  const PlanetPage({super.key});

  @override
  State<PlanetPage> createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {
  final StarWarsApi api = StarWarsApi();
  List<Planet> planets = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadPlanets();
  }

  Future<void> loadPlanets() async {
    try {
      final data = await api.fetchPlanets();
      setState(() {
        planets = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error != null) {
      return Center(child: Text(error!));
    }
    return RefreshIndicator(
      onRefresh: loadPlanets,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: planets.length,
        itemBuilder: (context, index) => _buildPlanetCard(planets[index]),
      ),
    );
  }

  Widget _buildPlanetCard(Planet planet) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.pushNamed(context, '/planetDetail', arguments: planet);
          },
          child: ListTile(
            title: Text(
              planet.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _buildPlanetDetails(planet),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanetDetails(Planet planet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🌤️ Climate: ${planet.climate}'),
        Text('🏔️ Terrain: ${planet.terrain}'),
        Text('🪐 Gravity: ${planet.gravity}'),
        Text('👥 Population: ${planet.population}'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Star Wars Planets"),
      ),
      body: _buildBody(),
    );
  }
}
