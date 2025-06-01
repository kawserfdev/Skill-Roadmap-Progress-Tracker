import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_skill_traking/models/roadmap_models.dart';
import 'package:flutter_skill_traking/state/roadmap_state.dart';
import 'package:flutter_skill_traking/widgets/roadmap_part_card.dart';
import 'package:flutter_skill_traking/widgets/skill_item_card.dart'; // To check for SkillItemCards

// Using a slightly enhanced FakeRoadmapManager from SkillItemCard tests
// or we can create a new one if needs diverge significantly.
// For now, let's assume we can reuse/enhance the existing fake concept.

class FakeRoadmapManagerForPartCard extends ChangeNotifier implements RoadmapManager {
  List<RoadmapPart> _parts = [];
  Map<String, double> partProgressOverrides = {}; // Allow overriding progress for testing

  @override
  List<RoadmapPart> get roadmapParts => _parts;

  void setRoadmapDataForTest(List<RoadmapPart> parts) {
    _parts = parts;
    notifyListeners();
  }

  void setPartProgressOverride(String partId, double progress) {
    partProgressOverrides[partId] = progress;
  }

  @override
  double calculatePartProgress(RoadmapPart part) {
    if (partProgressOverrides.containsKey(part.id)) {
      return partProgressOverrides[part.id]!;
    }
    // Basic real calculation if not overridden, good for some tests
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
    return totalRequiredSkills == 0 ? 0.0 : completedRequiredSkills / totalRequiredSkills;
  }

  // Other methods needed by the interface
  @override
  bool changeSkillStatus(String skillId, SkillStatus newStatus) {
    // Find and update the skill, then notify.
    for (var p in _parts) {
      for (var t in p.topics) {
        for (var s in t.skills) {
          if (s.id == skillId) {
            s.status = newStatus;
            notifyListeners();
            return true;
          }
        }
      }
    }
    return false;
  }
  @override
  double calculateOverallProgress() => 0.0;
  @override
  Map<SkillStatus, int> calculateSkillCounters() => {};
   @override
  void setRoadmapData(List<RoadmapPart> newParts) {
    _parts = newParts;
    notifyListeners();
  }
   @override
  Map<String, int> getSkillSummaryCounters() => {};
}

Widget createRoadmapPartCardScreen({required RoadmapPart part, required FakeRoadmapManagerForPartCard manager}) {
  return ChangeNotifierProvider<RoadmapManager>.value( // Use the base class type for Provider
    value: manager,
    child: MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView( // In case content expands beyond screen
          child: RoadmapPartCard(part: part),
        ),
      ),
    ),
  );
}

void main() {
  group('RoadmapPartCard Widget Tests', () {
    late RoadmapPart testPart1;
    late RoadmapPart testPart2NoSkills;
    late FakeRoadmapManagerForPartCard fakeRoadmapManager;

    setUp(() {
      testPart1 = RoadmapPart(
        id: 'part1',
        name: 'Part 1 Name',
        description: 'Part 1 Description.',
        topics: [
          Topic(id: 'topic1', name: 'Topic 1.1', skills: [
            SkillItem(id: 's1', name: 'Skill 1', description: 'Desc S1', isRequired: true, status: SkillStatus.notStarted),
            SkillItem(id: 's2', name: 'Skill 2', description: 'Desc S2', isRequired: true, status: SkillStatus.complete),
          ]),
          Topic(id: 'topic2', name: 'Topic 1.2', skills: [
            SkillItem(id: 's3', name: 'Skill 3', description: 'Desc S3', isRequired: false, status: SkillStatus.inProgress),
          ]),
        ]
      );
      testPart2NoSkills = RoadmapPart(
        id: 'part2NS',
        name: 'Part 2 No Skills',
        description: 'This part has no skills, only topics.',
        topics: [Topic(id: 'topic3', name: 'An Empty Topic', skills: [])]
      );

      fakeRoadmapManager = FakeRoadmapManagerForPartCard();
      fakeRoadmapManager.setRoadmapDataForTest([testPart1, testPart2NoSkills]);
    });

    testWidgets('displays part name and description', (WidgetTester tester) async {
      await tester.pumpWidget(createRoadmapPartCardScreen(part: testPart1, manager: fakeRoadmapManager));

      expect(find.text('Part 1 Name'), findsOneWidget);
      expect(find.text('Part 1 Description.'), findsOneWidget);
    });

    testWidgets('displays calculated progress correctly', (WidgetTester tester) async {
      // For testPart1: 2 required skills, 1 complete -> 50%
      // Override not needed if fake calc is accurate enough for the test case
      // fakeRoadmapManager.setPartProgressOverride('part1', 0.5);
      await tester.pumpWidget(createRoadmapPartCardScreen(part: testPart1, manager: fakeRoadmapManager));

      expect(find.text('50%'), findsOneWidget); // Progress text
      // Check LinearProgressIndicator value
      final progressIndicator = tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));
      expect(progressIndicator.value, 0.5);
    });

    testWidgets('renders SkillItemCards when expanded', (WidgetTester tester) async {
      await tester.pumpWidget(createRoadmapPartCardScreen(part: testPart1, manager: fakeRoadmapManager));

      // Initially, SkillItemCards should not be visible (or exist if lazily built, but here they are conditional)
      expect(find.byType(SkillItemCard), findsNothing);

      // Tap to expand
      await tester.tap(find.byIcon(Icons.expand_more));
      await tester.pumpAndSettle(); // Rebuilds with the expanded content

      // Check for SkillItemCards (3 skills in testPart1)
      expect(find.byType(SkillItemCard), findsNWidgets(3));
      expect(find.text('Skill 1'), findsOneWidget);
      expect(find.text('Skill 2'), findsOneWidget);
      expect(find.text('Skill 3'), findsOneWidget);
      expect(find.text('Topic 1.1'), findsOneWidget); // Also check for topic names
      expect(find.text('Topic 1.2'), findsOneWidget);
    });

    testWidgets('expand/collapse functionality works', (WidgetTester tester) async {
      await tester.pumpWidget(createRoadmapPartCardScreen(part: testPart1, manager: fakeRoadmapManager));

      // Check initial state (collapsed)
      expect(find.byIcon(Icons.expand_more), findsOneWidget);
      expect(find.byIcon(Icons.expand_less), findsNothing);
      expect(find.byType(SkillItemCard), findsNothing);

      // Tap to expand
      await tester.tap(find.byIcon(Icons.expand_more));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.expand_less), findsOneWidget);
      expect(find.byIcon(Icons.expand_more), findsNothing);
      expect(find.byType(SkillItemCard), findsNWidgets(3));

      // Tap to collapse
      await tester.tap(find.byIcon(Icons.expand_less));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.expand_more), findsOneWidget);
      expect(find.byIcon(Icons.expand_less), findsNothing);
      expect(find.byType(SkillItemCard), findsNothing);
    });

    testWidgets('displays correctly for a part with no skills', (WidgetTester tester) async {
      fakeRoadmapManager.setPartProgressOverride('part2NS', 0.0); // Explicitly set progress
      await tester.pumpWidget(createRoadmapPartCardScreen(part: testPart2NoSkills, manager: fakeRoadmapManager));

      expect(find.text('Part 2 No Skills'), findsOneWidget);
      expect(find.text('0%'), findsOneWidget);

      // Expand
      await tester.tap(find.byIcon(Icons.expand_more));
      await tester.pumpAndSettle();

      expect(find.byType(SkillItemCard), findsNothing); // No skills to display
      expect(find.text('An Empty Topic'), findsOneWidget); // Topic name should still be there
    });
  });
}
