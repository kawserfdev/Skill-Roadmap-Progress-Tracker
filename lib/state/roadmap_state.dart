import 'package:flutter/foundation.dart'; // Required for ChangeNotifier
import '../models/roadmap_models.dart';

class RoadmapManager extends ChangeNotifier {
  List<RoadmapPart> _roadmapParts = [];

  // Constructor to initialize with some data (optional, can be loaded later)
  RoadmapManager({List<RoadmapPart>? initialParts}) {
    if (initialParts != null) {
      _roadmapParts = initialParts;
    }
  }

  // Method to get the current roadmap data
  List<RoadmapPart> get roadmapParts => List.unmodifiable(_roadmapParts); // Getter for read-only access

  // Method to update the list of roadmap parts (e.g., after loading from a file or initial setup)
  void setRoadmapData(List<RoadmapPart> newParts) {
    _roadmapParts = newParts;
    notifyListeners(); // Notify listeners about the change
  }

  // Step 1: Status Update Logic (Dart equivalent of changeStatus)
  bool changeSkillStatus(String skillId, SkillStatus newStatus) {
    bool skillFoundAndUpdated = false;
    for (var part in _roadmapParts) { // Iterate over _roadmapParts
      for (var topic in part.topics) {
        for (var skill in topic.skills) {
          if (skill.id == skillId) {
            skill.status = newStatus;
            skillFoundAndUpdated = true;
            notifyListeners(); // Notify listeners about the change
            // print("Skill '${skill.name}' status changed to $newStatus");
            break;
          }
        }
        if (skillFoundAndUpdated) break;
      }
      if (skillFoundAndUpdated) break;
    }
    if (!skillFoundAndUpdated) {
      // print("Skill with ID '$skillId' not found.");
    }
    return skillFoundAndUpdated;
  }

  // Step 2: Progress Calculation Logic

  /// Calculates the completion progress of a single RoadmapPart.
  /// Only required skills are considered for progress.
  /// Returns a value between 0.0 and 1.0.
  double calculatePartProgress(RoadmapPart part) {
    int totalRequiredSkills = 0;
    int completedRequiredSkills = 0;

    for (var topic in part.topics) {
      for (var skill in topic.skills) {
        if (skill.isRequired) {
          totalRequiredSkills++;
          if (skill.status == SkillStatus.complete) {
            completedRequiredSkills++;
          }
        }
      }
    }

    if (totalRequiredSkills == 0) {
      return 0.0; // Avoid division by zero if no required skills
    }
    return completedRequiredSkills / totalRequiredSkills;
  }

  /// Calculates the overall completion progress for the entire roadmap.
  /// Only required skills are considered for progress.
  /// Returns a value between 0.0 and 1.0.
  double calculateOverallProgress() {
    int totalRequiredSkills = 0;
    int completedRequiredSkills = 0;

    for (var part in _roadmapParts) { // Iterate over _roadmapParts
      for (var topic in part.topics) {
        for (var skill in topic.skills) {
          if (skill.isRequired) {
            totalRequiredSkills++;
            if (skill.status == SkillStatus.complete) {
              completedRequiredSkills++;
            }
          }
        }
      }
    }
     if (totalRequiredSkills == 0) {
      return 0.0; // Avoid division by zero
    }
    return completedRequiredSkills / totalRequiredSkills;
  }

  /// Calculates the count of skills by their status across the entire roadmap.
  Map<SkillStatus, int> calculateSkillCounters() {
    Map<SkillStatus, int> counters = {
      SkillStatus.notStarted: 0,
      SkillStatus.inProgress: 0,
      SkillStatus.complete: 0,
    };
    int totalSkills = 0; // For overall count if needed later

    for (var part in _roadmapParts) { // Iterate over _roadmapParts
      for (var topic in part.topics) {
        for (var skill in topic.skills) {
          totalSkills++;
          counters[skill.status] = (counters[skill.status] ?? 0) + 1;
        }
      }
    }
    // If you need total skills count: counters[SkillStatus.total] = totalSkills;
    return counters;
  }

  // Helper to get all skill counts for summary (total, completed, inProgress, notStarted)
  // This combines total count with status counts.
  Map<String, int> getSkillSummaryCounters() {
    final statusCounters = calculateSkillCounters();
    int totalSkills = 0;
    statusCounters.values.forEach((count) => totalSkills += count);

    return {
      'total': totalSkills,
      'completed': statusCounters[SkillStatus.complete] ?? 0,
      'inProgress': statusCounters[SkillStatus.inProgress] ?? 0,
      'notStarted': statusCounters[SkillStatus.notStarted] ?? 0,
    };
  }
}
