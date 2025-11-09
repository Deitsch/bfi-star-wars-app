import 'package:flutter/material.dart';
import 'package:star_wars_app/models/planet.dart';

class PlanetDetailPage extends StatelessWidget {
  final Planet planet;
  const PlanetDetailPage({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(planet.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: PlanetInfoCard(planet: planet),
      ),
    );
  }
}

class PlanetInfoCard extends StatelessWidget {
  final Planet planet;
  const PlanetInfoCard({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surface, // light background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanetInfoRow(
              icon: Icons.public,
              label: 'Climate',
              value: planet.climate,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.terrain,
              label: 'Terrain',
              value: planet.terrain,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.speed,
              label: 'Gravity',
              value: planet.gravity,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.people,
              label: 'Population',
              value: planet.population,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.rotate_right,
              label: 'Rotation Period',
              value: planet.rotationPeriod,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.schedule,
              label: 'Orbital Period',
              value: planet.orbitalPeriod,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.straighten,
              label: 'Diameter',
              value: planet.diameter,
              textColor: colorScheme.onSurface,
            ),
            PlanetInfoRow(
              icon: Icons.water_drop,
              label: 'Surface Water',
              value: planet.surfaceWater,
              textColor: colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}

class PlanetInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? textColor;

  const PlanetInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor = textColor ?? Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green.shade700),
          const SizedBox(width: 10),
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: effectiveTextColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: effectiveTextColor.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }
}
