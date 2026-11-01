import 'package:flutter/material.dart';

enum ActivityStatus {
  loading,
  loaded,
  privateRepository,
  notCreated,
  notConnected,
  rateLimited,
  error,
}

class CurrentProject {
  final String title;
  final String category;
  final String description;
  final IconData icon;
  final Color accent;

  final String? repositoryUrl;
  final String? previewAsset;
  final DateTime? startedAt;
  final DateTime? lastUpdatedAt;

  final List<int>? dailyCommits;
  final List<GitHubCommit> latestCommits;
  final List<String> completedMilestones;

  final String? nextStep;
  final VoidCallback? onOpen;

  final ActivityStatus activityStatus;
  final DateTime? retryAt;

  const CurrentProject({
    required this.title,
    required this.category,
    required this.description,
    required this.icon,
    required this.accent,
    this.repositoryUrl,
    this.previewAsset,
    this.startedAt,
    this.lastUpdatedAt,
    this.dailyCommits,
    this.latestCommits = const [],
    this.completedMilestones = const [],
    this.nextStep,
    this.onOpen,
    this.activityStatus = ActivityStatus.notConnected,
    this.retryAt,
  }) : assert(
          dailyCommits == null || dailyCommits.length == 84,
        );

  CurrentProject withStatus(
    ActivityStatus status, {
    DateTime? retryAt,
  }) {
    return _copy(
      status: status,
      retryAt: retryAt,
    );
  }

  CurrentProject withActivity(GitHubActivity activity) {
    return _copy(
      status: ActivityStatus.loaded,
      activity: activity,
    );
  }

  CurrentProject _copy({
    required ActivityStatus status,
    GitHubActivity? activity,
    DateTime? retryAt,
  }) {
    return CurrentProject(
      title: title,
      category: category,
      description: description,
      icon: icon,
      accent: accent,
      repositoryUrl: repositoryUrl,
      previewAsset: previewAsset,
      startedAt: startedAt,
      lastUpdatedAt: activity?.lastCommit ?? lastUpdatedAt,
      dailyCommits: activity?.days ?? dailyCommits,
      latestCommits: activity?.latestCommits ?? latestCommits,
      completedMilestones: completedMilestones,
      nextStep: nextStep,
      onOpen: onOpen,
      activityStatus: status,
      retryAt: retryAt,
    );
  }
}

class GitHubCommit {
  final String message;
  final String sha;
  final String url;
  final DateTime date;

  const GitHubCommit({
    required this.message,
    required this.sha,
    required this.url,
    required this.date,
  });

  String get shortSha => sha.length <= 7 ? sha : sha.substring(0, 7);
}

class GitHubActivity {
  final List<int> days;
  final DateTime? lastCommit;
  final List<GitHubCommit> latestCommits;

  const GitHubActivity({
    required this.days,
    required this.lastCommit,
    required this.latestCommits,
  });
}
