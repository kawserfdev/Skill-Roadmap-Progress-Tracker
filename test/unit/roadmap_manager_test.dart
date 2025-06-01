import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_skill_traking/models/roadmap_models.dart';
import 'package:flutter_skill_traking/state/roadmap_state.dart';

// Helper function to create sample data easily
List<RoadmapPart> createSampleRoadmap() {
  return [
    RoadmapPart(
      id: 'part1',
      name: 'Part 1: Dart Basics',
      description: 'Fundamentals of Dart Programming.',
      topics: [
        Topic(id: 'topic1_1', name: 'Dart Variables', skills: [
          SkillItem(id: 'skill1_1_1', name: 'Variables', description: 'desc', isRequired: true, status: SkillStatus.notStarted),
          SkillItem(id: 'skill1_1_2', name: 'Data Types', description: 'desc', isRequired: true, status: SkillStatus.inProgress),
        ]),
        Topic(id: 'topic1_2', name: 'Dart Collections', skills: [
          SkillItem(id: 'skill1_2_1', name: 'Lists', description: 'desc', isRequired: true, status: SkillStatus.complete),
          SkillItem(id: 'skill1_2_2', name: 'Maps', description: 'desc', isRequired: false, status: SkillStatus.notStarted),
        ]),
      ]
    ),
    RoadmapPart(
      id: 'part2',
      name: 'Part 2: Flutter Basics',
      description: 'Introduction to Flutter.',
      topics: [
        Topic(id: 'topic2_1', name: 'Flutter Widgets', skills: [
          SkillItem(id: 'skill2_1_1', name: 'StatelessWidget', description: 'desc', isRequired: true, status: SkillStatus.notStarted),
          SkillItem(id: 'skill2_1_2', name: 'StatefulWidget', description: 'desc', isRequired: true, status: SkillStatus.complete),
        ]),
      ]
    ),
  ];
}

void main() {
  group('RoadmapManager Unit Tests', () {
    late RoadmapManager roadmapManager;
    List<RoadmapPart> sampleData;

    setUp(() {
      sampleData = createSampleRoadmap();
      roadmapManager = RoadmapManager(initialParts: sampleData);
    });

    test('Initial state loads correctly', () {
      expect(roadmapManager.roadmapParts.length, 2);
      expect(roadmapManager.roadmapParts[0].name, 'Part 1: Dart Basics');
      // Check a specific skill's initial status
      expect(roadmapManager.roadmapParts[0].topics[0].skills[0].status, SkillStatus.notStarted);
    });

    test('changeSkillStatus updates skill status', () {
      // Change status of skill1_1_1 from Not Started to Complete
      bool result = roadmapManager.changeSkillStatus('skill1_1_1', SkillStatus.complete);
      expect(result, isTrue);
      expect(roadmapManager.roadmapParts[0].topics[0].skills[0].status, SkillStatus.complete);

      // Try to change status of a non-existent skill
      result = roadmapManager.changeSkillStatus('non_existent_skill', SkillStatus.complete);
      expect(result, isFalse);
    });

    test('calculatePartProgress calculates progress correctly', () {
      // Part 1: 3 required skills. skill1_1_1 (NS), skill1_1_2 (IP), skill1_2_1 (C)
      // Initially, 1 out of 3 required skills is complete.
      double progressP1 = roadmapManager.calculatePartProgress(roadmapManager.roadmapParts[0]);
      expect(progressP1, closeTo(1.0 / 3.0, 0.001));

      roadmapManager.changeSkillStatus('skill1_1_1', SkillStatus.complete); // Now 2/3 complete
      progressP1 = roadmapManager.calculatePartProgress(roadmapManager.roadmapParts[0]);
      expect(progressP1, closeTo(2.0 / 3.0, 0.001));

      roadmapManager.changeSkillStatus('skill1_1_2', SkillStatus.complete); // Now 3/3 complete
      progressP1 = roadmapManager.calculatePartProgress(roadmapManager.roadmapParts[0]);
      expect(progressP1, closeTo(1.0, 0.001));

      // Part 2: 2 required skills. skill2_1_1 (NS), skill2_1_2 (C)
      // Initially, 1 out of 2 required skills is complete.
      double progressP2 = roadmapManager.calculatePartProgress(roadmapManager.roadmapParts[1]);
      expect(progressP2, closeTo(1.0 / 2.0, 0.001));
    });

    test('calculateOverallProgress calculates progress correctly', () {
      // Total required skills = 3 (Part1) + 2 (Part2) = 5
      // Initially completed required skills = 1 (skill1_2_1) + 1 (skill2_1_2) = 2
      // Initial overall progress = 2/5 = 0.4
      expect(roadmapManager.calculateOverallProgress(), closeTo(2.0 / 5.0, 0.001));

      roadmapManager.changeSkillStatus('skill1_1_1', SkillStatus.complete); // Part1: skill1_1_1 -> C
      // Now completed = 1 (skill1_1_1) + 1 (skill1_2_1) + 1 (skill2_1_2) = 3
      // Overall progress = 3/5 = 0.6
      expect(roadmapManager.calculateOverallProgress(), closeTo(3.0 / 5.0, 0.001));

      roadmapManager.changeSkillStatus('skill2_1_1', SkillStatus.complete); // Part2: skill2_1_1 -> C
      // Now completed = 1 (skill1_1_1) + 1 (skill1_2_1) + 1 (skill2_1_1) + 1 (skill2_1_2) = 4
      // Overall progress = 4/5 = 0.8
      expect(roadmapManager.calculateOverallProgress(), closeTo(4.0 / 5.0, 0.001));

      roadmapManager.changeSkillStatus('skill1_1_2', SkillStatus.complete); // Part1: skill1_1_2 -> C
      // Now all 5 required skills are complete
      // Overall progress = 5/5 = 1.0
      expect(roadmapManager.calculateOverallProgress(), closeTo(1.0, 0.001));
    });

    test('calculateSkillCounters counts skills correctly', () {
      // Initial state:
      // Part 1: skill1_1_1 (NS, req), skill1_1_2 (IP, req), skill1_2_1 (C, req), skill1_2_2 (NS, opt) -> 2 NS, 1 IP, 1 C
      // Part 2: skill2_1_1 (NS, req), skill2_1_2 (C, req) -> 1 NS, 1 C
      // Total: 3 NS, 1 IP, 2 C
      Map<SkillStatus, int> counters = roadmapManager.calculateSkillCounters();
      expect(counters[SkillStatus.notStarted], 3);
      expect(counters[SkillStatus.inProgress], 1);
      expect(counters[SkillStatus.complete], 2);

      roadmapManager.changeSkillStatus('skill1_1_1', SkillStatus.inProgress); // skill1_1_1: NS -> IP
      // Now: 2 NS, 2 IP, 2 C
      counters = roadmapManager.calculateSkillCounters();
      expect(counters[SkillStatus.notStarted], 2);
      expect(counters[SkillStatus.inProgress], 2);
      expect(counters[SkillStatus.complete], 2);
    });

    test('getSkillSummaryCounters provides correct summary', () {
      // Initial total skills = 4 (Part1) + 2 (Part2) = 6
      // NS = 3, IP = 1, C = 2
      Map<String, int> summary = roadmapManager.getSkillSummaryCounters();
      expect(summary['total'], 6);
      expect(summary['notStarted'], 3);
      expect(summary['inProgress'], 1);
      expect(summary['completed'], 2);

      roadmapManager.changeSkillStatus('skill1_1_1', SkillStatus.complete); // NS -> C
      // Now: Total = 6, NS = 2, IP = 1, C = 3
      summary = roadmapManager.getSkillSummaryCounters();
      expect(summary['total'], 6);
      expect(summary['notStarted'], 2);
      expect(summary['inProgress'], 1);
      expect(summary['completed'], 3);
    });

     test('calculatePartProgress with no required skills returns 0', () {
      final partWithNoRequiredSkills = RoadmapPart(
        id: 'part3',
        name: 'Part 3: Optional Only',
        description: 'All optional skills.',
        topics: [
          Topic(id: 'topic3_1', name: 'Optional Topic', skills: [
            SkillItem(id: 'skill3_1_1', name: 'Optional Skill 1', description: 'desc', isRequired: false, status: SkillStatus.complete),
            SkillItem(id: 'skill3_1_2', name: 'Optional Skill 2', description: 'desc', isRequired: false, status: SkillStatus.notStarted),
          ]),
        ]
      );
      double progress = roadmapManager.calculatePartProgress(partWithNoRequiredSkills);
      expect(progress, 0.0);
    });

    test('calculateOverallProgress with no parts returns 0', () {
      final emptyManager = RoadmapManager(initialParts: []);
      expect(emptyManager.calculateOverallProgress(), 0.0);
    });

    test('calculateOverallProgress with only optional skills returns 0', () {
       final managerWithOptionalOnly = RoadmapManager(initialParts: [
         RoadmapPart(
            id: 'partOpt', name: 'Optional Part', description: 'desc', topics: [
              Topic(id: 'tOpt', name: 'TOpt', skills: [
                SkillItem(id: 'sOpt1', name: 'SOpt1', description: 'd', isRequired: false, status: SkillStatus.complete)
              ])
            ]
         )
       ]);
       expect(managerWithOptionalOnly.calculateOverallProgress(), 0.0);
    });


  });
}
