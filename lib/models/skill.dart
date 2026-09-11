class Skill {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final String? iconPath;
  final String category;

  const Skill({
    required this.name,
    required this.proficiency,
    this.iconPath,
    required this.category,
  });
}
