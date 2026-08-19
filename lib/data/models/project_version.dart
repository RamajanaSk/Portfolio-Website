class ProjectVersion {
  final String version;
  final String title;
  final String date;
  final String description;
  final List<String> features;
  final List<String> screenshots;
  final String type;

  const ProjectVersion({
    required this.version,
    required this.title,
    required this.date,
    required this.description,
    required this.features,
    required this.screenshots,
    this.type = 'Feature',
  });
}
