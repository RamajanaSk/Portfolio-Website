import 'package:ramajana05/data/models/project_type.dart';

extension ProjectTypeExtension on ProjectType {
  String get label {
    switch (this) {
      case ProjectType.mobileApp:
        return 'MOBILE APP';

      case ProjectType.virtualReality:
        return 'VIRTUAL REALITY';

      case ProjectType.game:
        return 'GAME';

      case ProjectType.website:
        return 'WEBSITE';
    }
  }
}
