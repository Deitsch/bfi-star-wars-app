class Planet {
  final String name;
  final String climate;
  final String terrain;
  final String gravity;
  final String population;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String surfaceWater;

  Planet({
    required this.name,
    required this.climate,
    required this.terrain,
    required this.gravity,
    required this.population,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.surfaceWater,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'] ?? 'Unknown',
      climate: json['climate'] ?? 'Unknown',
      terrain: json['terrain'] ?? 'Unknown',
      gravity: json['gravity'] ?? 'Unknown',
      population: json['population'] ?? 'Unknown',
      rotationPeriod: json['rotation_period'] ?? 'Unknown',
      orbitalPeriod: json['orbital_period'] ?? 'Unknown',
      diameter: json['diameter'] ?? 'Unknown',
      surfaceWater: json['surface_water'] ?? 'Unknown',
    );
  }
}
