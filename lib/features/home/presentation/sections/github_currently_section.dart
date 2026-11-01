import 'package:flutter/material.dart';
import 'package:ramajana05/features/home/data/domain/current_project.dart';
import 'package:ramajana05/features/home/data/github_activitiy_service.dart';
import 'package:ramajana05/features/home/presentation/sections/home_currently_section.dart';

class GitHubCurrentlySection extends StatefulWidget {
  final List<CurrentProject> projects;

  const GitHubCurrentlySection({
    super.key,
    required this.projects,
  });

  @override
  State<GitHubCurrentlySection> createState() => _GitHubCurrentlySectionState();
}

class _GitHubCurrentlySectionState extends State<GitHubCurrentlySection> {
  final _service = GitHubActivityService();

  List<CurrentProject> _projects = [];
  int _generation = 0;

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  @override
  void didUpdateWidget(covariant GitHubCurrentlySection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.projects != widget.projects) {
      _loadProjects();
    }
  }

  bool _shouldLoad(CurrentProject project) {
    if (project.activityStatus == ActivityStatus.privateRepository ||
        project.activityStatus == ActivityStatus.notCreated) {
      return false;
    }

    return project.repositoryUrl?.trim().isNotEmpty ?? false;
  }

  void _loadProjects() {
    final generation = ++_generation;

    _projects = [
      for (final project in widget.projects)
        _shouldLoad(project)
            ? project.withStatus(ActivityStatus.loading)
            : project,
    ];

    for (var i = 0; i < widget.projects.length; i++) {
      final project = widget.projects[i];

      if (_shouldLoad(project)) {
        _loadOne(i, project, generation);
      }
    }
  }

  Future<void> _loadOne(
    int index,
    CurrentProject project,
    int generation,
  ) async {
    CurrentProject result;

    try {
      final activity = await _service.load(project.repositoryUrl!);
      result = project.withActivity(activity);
    } on GitHubActivityException catch (error) {
      result = project.withStatus(
        error.status,
        retryAt: error.retryAt,
      );
    } catch (error) {
      debugPrint('GitHub activity failed: $error');
      result = project.withStatus(ActivityStatus.error);
    }

    if (!mounted || generation != _generation) return;

    setState(() {
      _projects[index] = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeCurrentlySection(projects: _projects);
  }
}
