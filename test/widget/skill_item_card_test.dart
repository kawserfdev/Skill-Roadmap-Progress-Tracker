import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_skill_traking/models/roadmap_models.dart';
import 'package:flutter_skill_traking/state/roadmap_state.dart';
import 'package:flutter_skill_traking/widgets/skill_item_card.dart';

// A simple fake RoadmapManager for testing SkillItemCard interactions
class FakeRoadmapManager extends ChangeNotifier implements RoadmapManager {
  SkillStatus? _lastChangedStatus;
  String? _lastChangedSkillId;
  List<RoadmapPart> _parts = [];

  // Method to check what was called
  SkillStatus? get lastChangedStatus => _lastChangedStatus;
  String? get lastChangedSkillId => _lastChangedSkillId;

  @override
  bool changeSkillStatus(String skillId, SkillStatus newStatus) {
    _lastChangedSkillId = skillId;
    _lastChangedStatus = newStatus;
    // Simulate finding and updating the skill for the sake of the test
    for (var part in _parts) {
      for (var topic in part.topics) {
        for (var skill in topic.skills) {
          if (skill.id == skillId) {
            skill.status = newStatus;
            notifyListeners(); // Notify to mimic real behavior though not strictly needed for this fake
            return true;
          }
        }
      }
    }
    return false;
  }

  // Implement other RoadmapManager methods and properties with minimal functionality if needed by SkillItemCard
  // For SkillItemCard, changeSkillStatus is primary.
  @override
  List<RoadmapPart> get roadmapParts => _parts;

  void setParts(List<RoadmapPart> parts) { // Helper to set parts for testing
      _parts = parts;
  }

  // Unused methods for this specific test, but needed by interface/abstract class
  @override
  double calculateOverallProgress() => 0.0;
  @override
  Map<SkillStatus, int> calculateSkillCounters() => {};
  @override
  double calculatePartProgress(RoadmapPart part) => 0.0;
  @override
  void setRoadmapData(List<RoadmapPart> newParts) {
    _parts = newParts;
    notifyListeners();
  }
   @override
  Map<String, int> getSkillSummaryCounters() => {};


  // Not calling super for ChangeNotifier methods unless this fake actually uses them.
}


Widget createSkillItemCardScreen({required SkillItem skill, required FakeRoadmapManager manager}) {
  return ChangeNotifierProvider<RoadmapManager>.value(
    value: manager,
    child: MaterialApp(
      home: Scaffold(
        body: SkillItemCard(skill: skill),
      ),
    ),
  );
}

void main() {
  group('SkillItemCard Widget Tests', () {
    late SkillItem testSkillRequired;
    late SkillItem testSkillOptional;
    late FakeRoadmapManager fakeRoadmapManager;

    setUp(() {
      testSkillRequired = SkillItem(
        id: 'req1',
        name: 'Required Skill Name',
        description: 'This is a required skill description.',
        isRequired: true,
        status: SkillStatus.notStarted,
      );
      testSkillOptional = SkillItem(
        id: 'opt1',
        name: 'Optional Skill Name',
        description: 'This is an optional skill description.',
        isRequired: false,
        status: SkillStatus.inProgress,
      );
      fakeRoadmapManager = FakeRoadmapManager();
      // Set some parts in the manager in case the widget tries to access them indirectly, though it shouldn't for this test
      fakeRoadmapManager.setParts([
         RoadmapPart(id: "p1", name: "P1", description: "d", topics: [
           Topic(id: "t1", name: "T1", skills: [testSkillRequired, testSkillOptional])
         ])
      ]);
    });

    testWidgets('displays skill name, description, and priority correctly for required skill', (WidgetTester tester) async {
      await tester.pumpWidget(createSkillItemCardScreen(skill: testSkillRequired, manager: fakeRoadmapManager));

      expect(find.text('Required Skill Name'), findsOneWidget);
      expect(find.text('This is a required skill description.'), findsOneWidget);
      expect(find.text('Must Learn'), findsOneWidget);
    });

    testWidgets('displays skill name, description, and priority correctly for optional skill', (WidgetTester tester) async {
      await tester.pumpWidget(createSkillItemCardScreen(skill: testSkillOptional, manager: fakeRoadmapManager));

      expect(find.text('Optional Skill Name'), findsOneWidget);
      expect(find.text('This is an optional skill description.'), findsOneWidget);
      expect(find.text('Optional'), findsOneWidget);
    });

    testWidgets('DropdownButton shows the current status of the skill', (WidgetTester tester) async {
      await tester.pumpWidget(createSkillItemCardScreen(skill: testSkillRequired, manager: fakeRoadmapManager));
      // Check if the DropdownButton's value matches the skill's status
      // The text displayed for the selected item in DropdownButton is what we look for.
      expect(find.text('Not Started'), findsOneWidget); // SkillStatus.notStarted for testSkillRequired

      await tester.pumpWidget(createSkillItemCardScreen(skill: testSkillOptional, manager: fakeRoadmapManager));
      expect(find.text('In Progress'), findsOneWidget); // SkillStatus.inProgress for testSkillOptional
    });

    testWidgets('Selecting a new status in DropdownButton calls changeSkillStatus on RoadmapManager', (WidgetTester tester) async {
      await tester.pumpWidget(createSkillItemCardScreen(skill: testSkillRequired, manager: fakeRoadmapManager));

      // Tap the DropdownButton to open it
      await tester.tap(find.byType(DropdownButton<SkillStatus>));
      await tester.pumpAndSettle(); // Wait for animation to complete

      // Tap the 'Complete' status item in the dropdown.
      // We are looking for the Text widget within the DropdownMenuItem
      await tester.tap(find.text('Complete').last); // .last in case 'Complete' text appears elsewhere
      await tester.pumpAndSettle();

      // Verify that changeSkillStatus was called on the fake manager with correct parameters
      expect(fakeRoadmapManager.lastChangedSkillId, testSkillRequired.id);
      expect(fakeRoadmapManager.lastChangedStatus, SkillStatus.complete);
    });

    testWidgets('DropdownButton for a completed skill shows "Complete"', (WidgetTester tester) async {
      final completedSkill = SkillItem(
        id: 'comp1',
        name: 'Completed Skill',
        description: 'This skill is done.',
        isRequired: true,
        status: SkillStatus.complete,
      );
      fakeRoadmapManager.setParts([
         RoadmapPart(id: "p1", name: "P1", description: "d", topics: [
           Topic(id: "t1", name: "T1", skills: [completedSkill])
         ])
      ]);
      await tester.pumpWidget(createSkillItemCardScreen(skill: completedSkill, manager: fakeRoadmapManager));
      expect(find.text('Complete'), findsOneWidget);
    });
  });
}
