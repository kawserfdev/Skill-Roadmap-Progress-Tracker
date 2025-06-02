import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/roadmap_data_models.dart';
import '../providers/roadmap_providers.dart'; // Will be updated later

class SkillItemView extends ConsumerWidget {
  final Skill skill;
  final String partId; // Needed to call updateSkillStatus
  final String sectionId; // Needed to call updateSkillStatus

  const SkillItemView({
    Key? key,
    required this.skill,
    required this.partId,
    required this.sectionId,
  }) : super(key: key);

  String _priorityText(SkillPriority priority) {
    switch (priority) {
      case SkillPriority.mustLearn:
        return "Must Learn";
      case SkillPriority.optional:
        return "Optional";
    }
  }

  String _statusText(SkillStatus status) {
    switch (status) {
      case SkillStatus.notStarted:
        return "Not Started";
      case SkillStatus.inProgress:
        return "In Progress";
      case SkillStatus.completed:
        return "Completed";
    }
  }

  Color _getStatusColor(SkillStatus status, BuildContext context) {
    switch (status) {
      case SkillStatus.notStarted:
        return Colors.grey[400]!;
      case SkillStatus.inProgress:
        return Colors.orange[400]!;
      case SkillStatus.completed:
        return Colors.green[400]!;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1.5,
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (skill.description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        skill.description,
                        style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 13.0),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Priority: ${_priorityText(skill.priority)}',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        color: skill.priority == SkillPriority.mustLearn ? Colors.red.shade700 : Colors.blueGrey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            DropdownButton<SkillStatus>(
              value: skill.status,
              icon: Icon(Icons.arrow_drop_down, color: _getStatusColor(skill.status, context)),
              underline: Container(
                height: 2,
                color: _getStatusColor(skill.status, context).withOpacity(0.7),
              ),
              onChanged: (SkillStatus? newStatus) {
                if (newStatus != null) {
                  // Call the notifier method to update the skill status
                  // For now, the roadmapStateProvider.notifier is not fully defined yet,
                  // but this is where the call will go.
                  // We'll refine updateSkillStatus to accept just skillId if it's globally unique.
                  // For now, assuming we need partId and sectionId for clarity, or that skillId is unique.
                  ref.read(roadmapStateProvider.notifier).updateSkillStatus(partId, sectionId, skill.id, newStatus);
                }
              },
              items: SkillStatus.values.map((SkillStatus status) {
                return DropdownMenuItem<SkillStatus>(
                  value: status,
                  child: Text(
                    _statusText(status),
                    style: TextStyle(color: _getStatusColor(status, context).shade900.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
