import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../models/roadmap_models.dart';
import '../state/roadmap_state.dart'; // Import RoadmapManager
import 'skill_item_card.dart';

class RoadmapPartCard extends StatefulWidget {
  final RoadmapPart part; // Keep part as direct input

  const RoadmapPartCard({Key? key, required this.part}) : super(key: key);

  @override
  _RoadmapPartCardState createState() => _RoadmapPartCardState();
}

class _RoadmapPartCardState extends State<RoadmapPartCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Access the RoadmapManager to calculate progress for this specific part
    // Use Consumer if only this part of the widget tree needs to rebuild on specific changes.
    // Or Provider.of if many things in build method depend on it.
    // For progress, it's good to rebuild when data changes.
    final roadmapManager = Provider.of<RoadmapManager>(context, listen: true);
    final double progressValue = roadmapManager.calculatePartProgress(widget.part);
    final String progressPercent = (progressValue * 100).toStringAsFixed(0);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.part.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        if (widget.part.description.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              widget.part.description,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          value: progressValue, // Use calculated progress
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("$progressPercent%", style: Theme.of(context).textTheme.bodyMedium), // Display calculated progress
                    ],
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align topic names to the start
                children: widget.part.topics.expand((topic) {
                  return [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 4.0), // Add some spacing for topic name
                      child: Text(
                        topic.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600), // Slightly bolder
                      ),
                    ),
                    // Pass the skill to SkillItemCard. SkillItemCard will handle its own state/interactions.
                    ...topic.skills.map((skill) => SkillItemCard(skill: skill)).toList(),
                  ];
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
