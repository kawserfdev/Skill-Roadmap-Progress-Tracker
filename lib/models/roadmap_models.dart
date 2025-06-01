enum SkillStatus {
  notStarted,
  inProgress,
  complete,
}

class SkillItem {
  final String id;
  final String name;
  final String description;
  final bool isRequired;
  SkillStatus status; // Modifiable

  SkillItem({
    required this.id,
    required this.name,
    required this.description,
    required this.isRequired,
    this.status = SkillStatus.notStarted,
  });

  SkillItem copyWith({
    String? id,
    String? name,
    String? description,
    bool? isRequired,
    SkillStatus? status,
  }) {
    return SkillItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isRequired: isRequired ?? this.isRequired,
      status: status ?? this.status,
    );
  }
}

class Topic {
  final String id;
  final String name;
  final List<SkillItem> skills;

  Topic({
    required this.id,
    required this.name,
    required this.skills,
  });

  Topic copyWith({
    String? id,
    String? name,
    List<SkillItem>? skills,
  }) {
    return Topic(
      id: id ?? this.id,
      name: name ?? this.name,
      skills: skills ?? this.skills,
    );
  }
}

class RoadmapPart {
  final String id;
  final String name;
  final String description;
  final List<Topic> topics;
  // Progress will be calculated, not stored directly in the model if derived
  // int progress;

  RoadmapPart({
    required this.id,
    required this.name,
    required this.description,
    required this.topics,
    // this.progress = 0,
  });

  RoadmapPart copyWith({
    String? id,
    String? name,
    String? description,
    List<Topic>? topics,
    // int? progress,
  }) {
    return RoadmapPart(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      topics: topics ?? this.topics,
      // progress: progress ?? this.progress,
    );
  }

  // Helper to get all skills in a part, useful for progress calculation
  List<SkillItem> get allSkills {
    return topics.expand((topic) => topic.skills).toList();
  }
}
