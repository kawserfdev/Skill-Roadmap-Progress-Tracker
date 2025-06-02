enum SkillStatus { notStarted, inProgress, completed }

enum SkillPriority { mustLearn, optional }

// Though not explicitly in the JS data, adding as per subtask requirement.
class SkillDependency {
  final String skillId; // The ID of the current skill
  final String dependsOnSkillId; // The ID of the skill this one depends on
  final String type; // e.g., 'prerequisite', 'related', 'unlocks'

  SkillDependency({
    required this.skillId,
    required this.dependsOnSkillId,
    required this.type,
  });
}

class Skill {
  final String id;
  final String name;
  final String description;
  SkillStatus status; // Modifiable
  final SkillPriority priority;
  final List<String> tags; // e.g., "State Management", "UI"
  final List<SkillDependency> dependencies;

  Skill({
    required this.id,
    required this.name,
    required this.description,
    this.status = SkillStatus.notStarted,
    required this.priority,
    List<String>? tags,
    List<SkillDependency>? dependencies,
  })  : this.tags = tags ?? [],
        this.dependencies = dependencies ?? [];
}

class Section { // Corresponds to "topics" in the JS data
  final String id; // from topic.id
  final String name;
  final String description; // JS topics didn't have a description, so this might be empty or use section name.
  final List<Skill> skills;

  Section({
    required this.id,
    required this.name,
    this.description = '', // Defaulting to empty as it wasn't in the JS topic structure
    required this.skills,
  });
}

class RoadmapPart {
  final String id;
  final String title;
  final String iconEmoji; // Extracted from the combined name in JS data
  final String description;
  final List<Section> sections;
  double progress; // Modifiable

  RoadmapPart({
    required this.id,
    required this.title,
    this.iconEmoji = '',
    required this.description,
    required this.sections,
    this.progress = 0.0,
  });
}
