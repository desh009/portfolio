class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> features;
  final List<String>? screenshots; // Multiple screenshots

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.features = const [],
    this.screenshots,
  });
}
