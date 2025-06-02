import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../models/roadmap_models.dart';
import '../state/roadmap_state.dart'; // Import RoadmapManager

class SkillItemCard extends StatelessWidget {
  final SkillItem skill; // Keep skill as direct input

  const SkillItemCard({Key? key, required this.skill}) : super(key: key);

  String _priorityText(bool isRequired) {
    return isRequired ? "Must Learn" : "Optional";
  }

  Color _priorityColor(bool isRequired, BuildContext context) {
    return isRequired ? Theme.of(context).colorScheme.error : Colors.blueGrey;
  }

  String _statusText(SkillStatus status) {
    switch (status) {
      case SkillStatus.notStarted:
        return "Not Started";
      case SkillStatus.inProgress:
        return "In Progress";
      case SkillStatus.complete:
        return "Complete";
      }
  }

  // Helper for status badge/dropdown indicator color
  Color _getStatusColor(SkillStatus status, BuildContext context) {
    switch (status) {
      case SkillStatus.notStarted:
        return Colors.grey[400]!;
      case SkillStatus.inProgress:
        return Colors.orange[400]!;
      case SkillStatus.complete:
        return Colors.green[400]!;
      }
  }

  @override
  Widget build(BuildContext context) {
    final roadmapManager = Provider.of<RoadmapManager>(context, listen: false);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0), // Consistent with part card horizontal
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start, // Align chip with top of text
                    children: [
                      Flexible( // Ensure text wraps if too long
                        child: Text(
                          skill.name,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8), // Spacing between title and chip
                      Chip(
                        label: Text(
                          _priorityText(skill.isRequired),
                          style: TextStyle(
                            color: _priorityColor(skill.isRequired, context).withOpacity(0.9),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: _priorityColor(skill.isRequired, context).withOpacity(0.12),
                        padding: EdgeInsets.zero, // Adjust padding if needed
                        labelPadding: const EdgeInsets.symmetric(horizontal: 6.0), // Compact padding
                        visualDensity: VisualDensity.compact, // Make chip smaller
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce tap target size
                      ),
                    ],
                  ),
                  if (skill.description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0), // Increased top padding
                      child: Text(
                        skill.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600], fontSize: 13), // Slightly smaller desc
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16), // Spacing before dropdown
            DropdownButton<SkillStatus>(
              value: skill.status, // Current status from the skill model
              icon: Icon(Icons.arrow_drop_down, color: _getStatusColor(skill.status, context)),
              style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black),
              underline: Container( // Custom underline with status color
                height: 2,
                color: _getStatusColor(skill.status, context).withOpacity(0.7),
              ),
              onChanged: (SkillStatus? newValue) {
                if (newValue != null) {
                  // Call changeSkillStatus from RoadmapManager
                  roadmapManager.changeSkillStatus(skill.id, newValue);
                }
              },
              items: SkillStatus.values.map((SkillStatus status) {
                return DropdownMenuItem<SkillStatus>(
                  value: status,
                  child: Text(
                    _statusText(status),
                     style: TextStyle(color: _getStatusColor(status, context).withOpacity(0.9), fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
              hint: const Text("Status", style: TextStyle(fontSize: 12)), // Fallback hint
            ),
          ],
        ),
      ),
    );
  }
}
