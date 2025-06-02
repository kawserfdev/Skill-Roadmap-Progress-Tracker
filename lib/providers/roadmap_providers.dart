import 'dart:convert'; // For jsonEncode and jsonDecode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import '../models/roadmap_data_models.dart';
import '../data/sample_roadmap_data.dart';

// Step 2: Define Storage Key
const String userProgressKey = 'user_roadmap_progress';

/// Provider for the initial/static roadmap data.
final initialRoadmapDataProvider = Provider<List<RoadmapPart>>((ref) {
  return sampleRoadmapData; // This is the base structure
});

class RoadmapNotifier extends StateNotifier<List<RoadmapPart>> {
  RoadmapNotifier(List<RoadmapPart> initialData) : super(initialData) {
    // Load progress when the notifier is created
    _loadProgress();
  }

  // Step 3: Saving Logic
  Future<void> _saveProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      Map<String, int> progressToSave = {};
      for (var part in state) {
        for (var section in part.sections) {
          for (var skill in section.skills) {
            progressToSave[skill.id] = skill.status.index;
          }
        }
      }
      String jsonProgress = jsonEncode(progressToSave);
      await prefs.setString(userProgressKey, jsonProgress);
      // print('Progress saved!'); // For debugging
    } catch (e) {
      // print('Error saving progress: $e'); // For debugging
      // Handle error, e.g., log to an analytics service
    }
  }

  // Step 4: Loading Logic (modified to be called from constructor)
  Future<void> _loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonProgress = prefs.getString(userProgressKey);

      if (jsonProgress != null) {
        final Map<String, dynamic> decodedProgress = jsonDecode(jsonProgress);
        final Map<String, int> loadedStatuses = decodedProgress.map((key, value) => MapEntry(key, value as int));

        // Create a new list based on the current state (which was initialized with sampleRoadmapData)
        // and update statuses according to loaded data.
        final updatedRoadmapParts = state.map((part) {
          return RoadmapPart(
            id: part.id,
            title: part.title,
            iconEmoji: part.iconEmoji,
            description: part.description,
            // Progress will be recalculated after statuses are updated.
            progress: 0.0, // Initialize progress, will be updated.
            sections: part.sections.map((section) {
              return Section(
                id: section.id,
                name: section.name,
                description: section.description,
                skills: section.skills.map((skill) {
                  SkillStatus newStatus = skill.status; // Default to current (initial) status
                  if (loadedStatuses.containsKey(skill.id)) {
                    final statusIndex = loadedStatuses[skill.id]!;
                    if (statusIndex >= 0 && statusIndex < SkillStatus.values.length) {
                       newStatus = SkillStatus.values[statusIndex];
                    }
                  }
                  return Skill(
                    id: skill.id,
                    name: skill.name,
                    description: skill.description,
                    priority: skill.priority,
                    status: newStatus,
                    tags: List.from(skill.tags),
                    dependencies: List.from(skill.dependencies),
                  );
                }).toList(),
              );
            }).toList(),
          );
        }).toList();

        // Recalculate progress for all parts after loading statuses
        final finalRoadmapParts = updatedRoadmapParts.map((part) {
            int completedSkillsInPart = 0;
            int totalSkillsInPart = 0;
            for (var sec in part.sections) {
              for (var skill in sec.skills) {
                totalSkillsInPart++;
                if (skill.status == SkillStatus.completed) {
                  completedSkillsInPart++;
                }
              }
            }
            final newPartProgress = totalSkillsInPart > 0 ? completedSkillsInPart / totalSkillsInPart : 0.0;
            return RoadmapPart( // Create new instance with updated progress
              id: part.id, title: part.title, iconEmoji: part.iconEmoji, description: part.description,
              sections: part.sections, progress: newPartProgress
            );
        }).toList();

        state = finalRoadmapParts;
        // print('Progress loaded and applied!'); // For debugging
      } else {
        // No saved progress, just ensure initial progress is calculated for the sample data
        _recalculateAllPartsProgress();
        // print('No saved progress found. Initializing with sample data progress.'); // For debugging
      }
    } catch (e) {
      // print('Error loading progress: $e'); // For debugging
      // Handle error, e.g., log, or proceed with initial data.
      // Ensure initial progress is calculated if loading fails.
      _recalculateAllPartsProgress();
    }
  }

  void _recalculateAllPartsProgress() {
    state = state.map((part) {
      int completedSkillsInPart = 0;
      int totalSkillsInPart = 0;
      for (var sec in part.sections) {
        for (var skill in sec.skills) {
          totalSkillsInPart++;
          if (skill.status == SkillStatus.completed) {
            completedSkillsInPart++;
          }
        }
      }
      final newPartProgress = totalSkillsInPart > 0 ? completedSkillsInPart / totalSkillsInPart : 0.0;
      // Return a new instance of RoadmapPart if progress changed, or the same instance if not.
      // For simplicity and to ensure state change notification if only progress changes:
      return RoadmapPart(
          id: part.id, title: part.title, iconEmoji: part.iconEmoji, description: part.description,
          sections: part.sections, progress: newPartProgress
      );
    }).toList();
  }

  // This is the main state update logic from the previous step, now correctly placed.
  void updateSkillStatus(String partId, String sectionId, String skillId, SkillStatus newStatus) {
    state = state.map((part) {
      if (part.id == partId) {
        final updatedSections = part.sections.map((section) {
          if (section.id == sectionId) {
            final updatedSkills = section.skills.map((skill) {
              if (skill.id == skillId) {
                return Skill(
                  id: skill.id,
                  name: skill.name,
                  description: skill.description,
                  priority: skill.priority,
                  status: newStatus,
                  tags: List.from(skill.tags),
                  dependencies: List.from(skill.dependencies),
                );
              }
              return skill;
            }).toList();
            return Section(
              id: section.id,
              name: section.name,
              description: section.description,
              skills: updatedSkills,
            );
          }
          return section;
        }).toList();

        int completedSkillsInPart = 0;
        int totalSkillsInPart = 0;
        for (var sec in updatedSections) {
          for (var skill in sec.skills) {
            totalSkillsInPart++;
            if (skill.status == SkillStatus.completed) {
              completedSkillsInPart++;
            }
          }
        }
        final newProgress = totalSkillsInPart > 0 ? completedSkillsInPart / totalSkillsInPart : 0.0;

        return RoadmapPart(
          id: part.id,
          title: part.title,
          iconEmoji: part.iconEmoji,
          description: part.description,
          sections: updatedSections,
          progress: newProgress,
        );
      }
      return part;
    }).toList();
    _saveProgress(); // Call save after state is updated
  }
}

/// StateNotifierProvider for the roadmap data.
final roadmapStateProvider = StateNotifierProvider<RoadmapNotifier, List<RoadmapPart>>((ref) {
  final initialData = ref.watch(initialRoadmapDataProvider);
  // RoadmapNotifier's constructor now calls _loadProgress, which might update the state asynchronously.
  // Riverpod handles this by providing the initial state first, then updating when the async operation completes.
  return RoadmapNotifier(initialData);
});

final overallProgressProvider = Provider<double>((ref) {
  final allParts = ref.watch(roadmapStateProvider);
  if (allParts.isEmpty) return 0.0;

  int totalCompletedSkills = 0;
  int totalSkillsInRoadmap = 0;

  for (var part in allParts) {
    for (var section in part.sections) {
      for (var skill in section.skills) {
        totalSkillsInRoadmap++;
        if (skill.status == SkillStatus.completed) {
          totalCompletedSkills++;
        }
      }
    }
  }
  return totalSkillsInRoadmap > 0 ? totalCompletedSkills / totalSkillsInRoadmap : 0.0;
});

// Step 2: Search Query Provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Step 4: Filtered Roadmap Logic
final filteredRoadmapProvider = Provider<List<RoadmapPart>>((ref) {
  final allParts = ref.watch(roadmapStateProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();

  if (query.isEmpty) {
    return allParts;
  }

  return allParts.where((part) {
    if (part.title.toLowerCase().contains(query)) return true;
    if (part.description.toLowerCase().contains(query)) return true; // Also search part description

    for (var section in part.sections) {
      if (section.name.toLowerCase().contains(query)) return true;
      // Not searching section.description as it's often empty or same as name.

      for (var skill in section.skills) {
        if (skill.name.toLowerCase().contains(query)) return true;
        if (skill.description.toLowerCase().contains(query)) return true;
        // Not searching skill.tags for now, can be added if needed
      }
    }
    return false;
  }).toList();
});
