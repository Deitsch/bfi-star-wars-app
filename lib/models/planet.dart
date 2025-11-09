class Planet {
  final String name;
  final String climate;
  final String terrain;
  final String gravity;
  final String population;

  Planet({
    required this.name,
    required this.climate,
    required this.terrain,
    required this.gravity,
    required this.population,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'] ?? 'Unknown',
      climate: json['climate'] ?? 'Unknown',
      terrain: json['terrain'] ?? 'Unknown',
      gravity: json['gravity'] ?? 'Unknown',
      population: json['population'] ?? 'Unknown',
    );
  }
}
