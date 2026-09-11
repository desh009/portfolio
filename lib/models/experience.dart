class Experience {
  final String title;
  final String company;
  final String period;
  final String? location;
  final List<String> responsibilities;
  final bool isEducation;

  const Experience({
    required this.title,
    required this.company,
    required this.period,
    this.location,
    this.responsibilities = const [],
    this.isEducation = false,
  });
}
