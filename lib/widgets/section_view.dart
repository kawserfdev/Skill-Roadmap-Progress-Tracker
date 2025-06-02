import 'package:flutter/material.dart';
import '../models/roadmap_data_models.dart';
import 'skill_item_view.dart';

class SectionView extends StatelessWidget {
  final Section section;
  final String partId; // Pass partId down for SkillItemView

  const SectionView({
    Key? key,
    required this.section,
    required this.partId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.name,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          if (section.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                section.description,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 13.5),
              ),
            ),
          if (section.description.isNotEmpty) const SizedBox(height: 4),
          // Using a Column instead of ListView.builder as these lists are typically not very long
          // and this avoids nested scrolling issues if SectionView itself is in a ListView.
          Column(
            children: section.skills.map((skill) {
              return SkillItemView(
                skill: skill,
                partId: partId,
                sectionId: section.id, // Pass section.id
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
