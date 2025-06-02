import '../models/roadmap_data_models.dart';

// Helper to extract emoji and title
Map<String, String> _extractEmojiAndTitle(String rawName) {
  final parts = rawName.split(' ');
  if (parts.length > 1 &&
      parts[0].length > 0 &&
      (parts[0].codeUnitAt(0) > 255 ||
          parts[0].contains(RegExp(r'[🧱🚀📱📦🗃🔒🧪✨]')))) {
    // Basic emoji check
    return {'emoji': parts[0], 'title': parts.sublist(1).join(' ')};
  }
  return {'emoji': '', 'title': rawName};
}

final List<RoadmapPart> sampleRoadmapData = [
  RoadmapPart(
    id: 'part1',
    title: _extractEmojiAndTitle(
      '🧱 Part 1: Fundamentals of Dart Programming',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🧱 Part 1: Fundamentals of Dart Programming',
    )['emoji']!,
    description:
        'Dart is an object-oriented, class-based, garbage-collected language developed by Google. It\'s the core language behind Flutter. Learning Dart thoroughly is essential to becoming a confident Flutter developer.',
    sections: [
      Section(
        id: 'dart-basics',
        name: 'Dart Basics',
        // description: '', // No specific description for topics in original JS data
        skills: [
          Skill(
            id: 'part1_dart_variables',
            name: 'Variables and Data Types',
            description:
                'var, final, const, late, and basic types like int, double, String, bool, dynamic',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_dart_operators',
            name: 'Operators',
            description:
                'Arithmetic, relational, logical, bitwise, assignment, null-aware operators',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_dart_control_flow',
            name: 'Control Flow Statements',
            description:
                'if/else, switch/case, for loops, while loops, break, continue',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_dart_functions',
            name: 'Functions',
            description:
                'Function declaration, parameters, named parameters, anonymous functions, arrow syntax',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'collections',
        name: 'Collections',
        skills: [
          Skill(
            id: 'part1_coll_lists',
            name: 'Lists',
            description:
                'Creating and manipulating lists, spread operator, collection if/for',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_coll_sets',
            name: 'Sets',
            description:
                'Creating sets, operations like union and intersection',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_coll_maps',
            name: 'Maps',
            description:
                'Key-value pairs, accessing and iterating through maps',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'null-safety',
        name: 'Null Safety',
        skills: [
          Skill(
            id: 'part1_null_nullable_types',
            name: 'Nullable & Non-nullable Types',
            description:
                'Understanding type safety with nullable String? vs non-nullable String',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_null_null_operators',
            name: 'Null-aware Operators',
            description: '??, ??=, ?. and late keyword usage',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_null_null_assertion',
            name: 'Null Assertion',
            description:
                'Using the ! operator when you know a value won\'t be null',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'oop',
        name: 'Object-Oriented Programming (OOP)',
        skills: [
          Skill(
            id: 'part1_oop_classes',
            name: 'Classes & Objects',
            description:
                'Defining classes, creating objects, properties and methods',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_constructors',
            name: 'Constructors',
            description:
                'Default, named, redirecting, factory and const constructors',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_inheritance',
            name: 'Inheritance',
            description: 'Extending classes, method overriding with @override',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_abstract',
            name: 'Abstract Classes & Interfaces',
            description:
                'Abstract classes, implicit interfaces with implements',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_mixins',
            name: 'Mixins',
            description: 'Creating and using mixins with the with keyword',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_enums',
            name: 'Enums',
            description:
                'Basic enums and enhanced enums (Dart 2.17+) with methods and fields',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_extensions',
            name: 'Extensions',
            description:
                'Adding functionality to existing classes without modifying them',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'async',
        name: 'Futures & Asynchronous Programming',
        skills: [
          Skill(
            id: 'part1_async_futures',
            name: 'Futures',
            description:
                'Future objects, Future.delayed, then, catchError, whenComplete',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_async_async_await',
            name: 'Async/Await',
            description: 'Using async and await keywords for asynchronous code',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_async_streams',
            name: 'Streams',
            description:
                'Working with streams, broadcast streams, StreamController, listening and transforming',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part2',
    title: _extractEmojiAndTitle('🚀 Part 2: Flutter Basics')['title']!,
    iconEmoji: _extractEmojiAndTitle('🚀 Part 2: Flutter Basics')['emoji']!,
    description:
        'This section builds the foundation of Flutter app development using the Dart language you\'ve already learned.',
    sections: [
      Section(
        id: 'flutter-setup',
        name: 'Flutter SDK & Development Environment',
        skills: [
          Skill(
            id: 'part2_setup_sdk',
            name: 'Installing Flutter SDK',
            description:
                'Install Flutter SDK and Dart, configure PATH, and verify setup using flutter doctor.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_setup_cli',
            name: 'Flutter CLI Commands',
            description:
                'Learn flutter CLI: create, run, build, clean, pub get/upgrade.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'project-structure',
        name: 'Flutter Project Structure',
        skills: [
          Skill(
            id: 'part2_structure_files',
            name: 'Understanding File Structure',
            description:
                'Learn /lib, /android, /ios, /assets, pubspec.yaml layout and purpose.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_structure_main',
            name: 'main.dart & pubspec.yaml',
            description:
                'Understand app entry point and dependency configuration.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'widgets',
        name: 'Widgets: The Building Blocks',
        skills: [
          Skill(
            id: 'part2_widgets_stateless',
            name: 'StatelessWidget',
            description: 'UI that doesn’t change dynamically.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_widgets_stateful',
            name: 'StatefulWidget',
            description: 'UI that updates using setState().',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'ui-widgets',
        name: 'Basic UI Widgets',
        skills: [
          Skill(
            id: 'part2_ui_text',
            name: 'Text & Image Widgets',
            description: 'Use Text, RichText, Image.asset/network, Icon.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_ui_buttons',
            name: 'Buttons & Inputs',
            description: 'ElevatedButton, TextField, GestureDetector, InkWell.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_ui_layouts',
            name: 'Layout Widgets',
            description:
                'Row, Column, Stack, ListView, GridView, Expanded, Padding.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'navigation',
        name: 'Navigation',
        skills: [
          Skill(
            id: 'part2_nav_basic',
            name: 'Basic Navigation (Navigator 1.0)',
            description: 'Use Navigator.push/pop for screen transitions.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_nav_named',
            name: 'Named Routes',
            description: 'Define routes in MaterialApp and navigate by name.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_nav_data',
            name: 'Passing Data',
            description:
                'Pass data using constructors and ModalRoute arguments.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'theming',
        name: 'Theming & Styling',
        skills: [
          Skill(
            id: 'part2_theme_global',
            name: 'Global Themes',
            description: 'Define ThemeData for colors, fonts, and styling.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_theme_styling',
            name: 'Text & Box Styling',
            description: 'Use TextStyle, BoxDecoration, EdgeInsets, Shadows.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'extras',
        name: 'Extra Essentials',
        skills: [
          Skill(
            id: 'part2_dark_mode',
            name: 'Dark Mode Support',
            description: 'Configure darkTheme and ThemeMode.system.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_assets_fonts',
            name: 'Assets & Fonts',
            description: 'Configure pubspec.yaml for images and fonts.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part2_hot_reload',
            name: 'Hot Reload vs Hot Restart',
            description: 'Understand difference and benefits for development.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part3',
    title: _extractEmojiAndTitle(
      '📱 Part 3: Flutter Intermediate UI',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '📱 Part 3: Flutter Intermediate UI',
    )['emoji']!,
    description:
        'This part takes you beyond basics, focusing on building complex, responsive, and smooth user interfaces with Flutter.',
    sections: [
      Section(
        id: 'custom-widgets',
        name: 'Layouts & Custom Widgets',
        skills: [
          Skill(
            id: 'part3_custom_widgets',
            name: 'Custom Widgets',
            description:
                'Create reusable widgets using StatelessWidget and StatefulWidget with parameters and callbacks.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_layout_builder',
            name: 'LayoutBuilder & Constraints',
            description:
                'Use LayoutBuilder to build responsive UIs based on parent constraints.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_media_query',
            name: 'MediaQuery',
            description:
                'Access device dimensions and orientation for adaptive UI design.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_flex_wrap',
            name: 'Flex, Expanded & Wrap',
            description:
                'Understand how to use flex factor, Expanded, and Wrap widgets for flexible layouts.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_flow',
            name: 'Flow Widget',
            description:
                'Use Flow for highly customized layouts with performance control.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'animations',
        name: 'Animations',
        skills: [
          Skill(
            id: 'part3_animations_implicit',
            name: 'Implicit Animations',
            description:
                'Use AnimatedContainer, AnimatedOpacity, AnimatedAlign, and similar widgets for simple effects.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_animations_explicit',
            name: 'Explicit Animations',
            description:
                'Use AnimationController, Tween, AnimatedBuilder for full animation control.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_animations_hero',
            name: 'Hero Animations',
            description:
                'Implement smooth shared element transitions using Hero widget.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_animations_staggered',
            name: 'Staggered Animations',
            description:
                'Chain multiple animations with delays for advanced effects.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'responsive-ui',
        name: 'Responsive & Adaptive Design',
        skills: [
          Skill(
            id: 'part3_responsive_layout',
            name: 'Screen Size Adaptation',
            description:
                'Use percentage-based sizing with MediaQuery and LayoutBuilder.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_responsive_orientation',
            name: 'OrientationBuilder',
            description:
                'Adapt UI for landscape and portrait modes using OrientationBuilder.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_platform_widgets',
            name: 'Platform-specific Widgets',
            description:
                'Use Cupertino widgets for iOS and Switch.adaptive() for platform-aware UI.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_accessibility',
            name: 'Accessibility',
            description:
                'Use Semantics, font scaling, and screen reader support for inclusive design.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'advanced-navigation',
        name: 'Navigation & Routing (Advanced)',
        skills: [
          Skill(
            id: 'part3_nav_router_api',
            name: 'Navigator 2.0 (Router API)',
            description:
                'Implement declarative navigation using RouteInformationParser and RouterDelegate.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_nav_nested',
            name: 'Nested Navigation',
            description:
                'Use IndexedStack and multiple Navigators for tabbed navigation.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_nav_custom_transition',
            name: 'Custom Route Transitions',
            description:
                'Create animated page transitions using PageRouteBuilder (e.g. fade, slide).',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'theming-scale',
        name: 'Theming & Styling at Scale',
        skills: [
          Skill(
            id: 'part3_theme_custom',
            name: 'Custom Themes & Theme Extensions',
            description:
                'Define ThemeData, custom color schemes, and dark/light modes.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_typography',
            name: 'Typography',
            description:
                'Use GoogleFonts and responsive text with MediaQuery or auto_size_text.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_dynamic_style',
            name: 'Dynamic Styling',
            description:
                'Change styles based on app state or current theme using AnimatedTheme.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'complex-widgets',
        name: 'Working with Complex Widgets',
        skills: [
          Skill(
            id: 'part3_lists_grids',
            name: 'Lists & Grids',
            description:
                'Use ListView.builder, GridView.builder, and Slivers for dynamic scrollable UIs.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_forms_validation',
            name: 'Advanced Forms & Validation',
            description:
                'Use GlobalKey<FormState>, form validators, and better UX for error handling.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'gestures',
        name: 'Gesture Handling & Touch Events',
        skills: [
          Skill(
            id: 'part3_gesture_detector',
            name: 'GestureDetector vs InkWell',
            description:
                'Detect taps, swipes, long press, and ripple feedback.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part3_raw_gesture',
            name: 'RawGestureDetector',
            description: 'Customize complex gestures like drag, pinch, zoom.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'state-restoration',
        name: 'State Restoration',
        skills: [
          Skill(
            id: 'part3_restoration_mixin',
            name: 'RestorationMixin',
            description:
                'Persist widget state on app restart using Restoration IDs.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part4',
    title: _extractEmojiAndTitle(
      '📦 Part 4: State Management in Flutter',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '📦 Part 4: State Management in Flutter',
    )['emoji']!,
    description:
        'State management governs how your Flutter app handles, shares, and updates data across widgets and screens. This part covers local, global, and async state solutions including Provider, Riverpod, and BLoC.',
    sections: [
      Section(
        id: 'state-types',
        name: 'Types of State',
        skills: [
          Skill(
            id: 'part4_state_ephemeral',
            name: 'Ephemeral (Local) State',
            description:
                'Use StatefulWidget and setState for local state inside a widget.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_state_global',
            name: 'App (Global) State',
            description:
                'Manage state shared across multiple widgets/pages using external solutions.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'state-methods',
        name: 'State Management Approaches',
        skills: [
          Skill(
            id: 'part4_setstate',
            name: 'setState()',
            description: 'Built-in way to manage simple local state updates.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_inherited_widget',
            name: 'InheritedWidget & InheritedModel',
            description:
                'Flutter’s low-level mechanism to propagate data efficiently down the tree.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_provider',
            name: 'Provider',
            description:
                'Recommended state management using ChangeNotifier, FutureProvider, StreamProvider.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_riverpod',
            name: 'Riverpod',
            description:
                'Modern, safe, and powerful alternative to Provider with global access and no context needed.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_bloc',
            name: 'BLoC (Business Logic Component)',
            description:
                'Separates UI from business logic using Streams and Events. Great for complex apps.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_getx',
            name: 'GetX',
            description:
                'Lightweight solution combining state, navigation, and dependency injection.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_mobx',
            name: 'MobX',
            description:
                'Reactive state management using observables, reactions, and actions.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_redux',
            name: 'Redux',
            description:
                'Predictable state container using central store, actions, and reducers. Powerful but verbose.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'async-state',
        name: 'Managing Async State',
        skills: [
          Skill(
            id: 'part4_async_future',
            name: 'FutureBuilder',
            description:
                'Handle one-time asynchronous calls like API requests using FutureBuilder.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_async_stream',
            name: 'StreamBuilder',
            description:
                'Use StreamBuilder for continuous async data streams like chat or sensors.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_async_providers',
            name: 'Async Providers',
            description:
                'Use FutureProvider and StreamProvider with Provider or Riverpod for clean async state management.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'immutability',
        name: 'Immutability & State Mutation',
        skills: [
          Skill(
            id: 'part4_immutable',
            name: 'Immutable State',
            description:
                'Avoid bugs by using copyWith() and not mutating existing state.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_freezed',
            name: 'Freezed for Models',
            description:
                'Use freezed to generate immutable data classes and unions.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'di',
        name: 'Dependency Injection (DI)',
        skills: [
          Skill(
            id: 'part4_di_getit',
            name: 'get_it Service Locator',
            description:
                'Register and access services globally without context.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_di_riverpod',
            name: 'Riverpod DI',
            description:
                'Use Riverpod’s provider system for built-in DI and testability.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'testing',
        name: 'Testing State Management',
        skills: [
          Skill(
            id: 'part4_test_unit',
            name: 'Unit Testing',
            description:
                'Test state logic like ChangeNotifier, BLoC independently from UI.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_test_mocking',
            name: 'Mocking Dependencies',
            description:
                'Use mockito or mocktail to simulate services and APIs in tests.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_test_integration',
            name: 'Integration Tests with Providers',
            description:
                'Test app flows by injecting fake providers into widget trees.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'state-selection',
        name: 'Choosing the Right State Management',
        skills: [
          Skill(
            id: 'part4_choice_simple',
            name: 'Simple Apps (Single Screen)',
            description: 'Use setState or Provider for minimal overhead.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_choice_medium',
            name: 'Medium Apps (Multiple Screens)',
            description:
                'Use Provider or Riverpod for clean scalable architecture.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_choice_complex',
            name: 'Complex Apps (Logic Heavy)',
            description:
                'Use BLoC or Redux for predictable flow and testability.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part4_choice_fastdev',
            name: 'Rapid Development',
            description:
                'Use GetX or Riverpod for less boilerplate and faster prototyping.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part5',
    title: _extractEmojiAndTitle(
      '🔗 Part 5: Working with Backend & APIs',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🔗 Part 5: Working with Backend & APIs',
    )['emoji']!,
    description:
        'Connecting Flutter apps to backend services enables real-world functionality like data fetching, user authentication, storage, and real-time updates. This part covers HTTP, REST, authentication, WebSockets, and more.',
    sections: [
      Section(
        id: 'api-basics',
        name: 'Understanding Backend & APIs',
        skills: [
          Skill(
            id: 'part5_backend_intro',
            name: 'Backend & API Concepts',
            description:
                'Learn how apps communicate with backend servers using HTTP and APIs (REST, GraphQL, Firebase).',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'http-requests',
        name: 'Making HTTP Requests',
        skills: [
          Skill(
            id: 'part5_http_get',
            name: 'Using http Package (GET)',
            description:
                'Fetch data using GET requests and handle JSON responses.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_http_post',
            name: 'POST Requests & Payloads',
            description:
                'Send data to servers using POST and encode/decode JSON.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_http_error',
            name: 'Error Handling',
            description:
                'Handle network errors, bad status codes, timeouts using try/catch.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_http_headers',
            name: 'Headers & Authentication',
            description: 'Use headers for Authorization, Content-Type, etc.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'json-parsing',
        name: 'JSON & Model Classes',
        skills: [
          Skill(
            id: 'part5_json_manual',
            name: 'Manual JSON Parsing',
            description:
                'Parse and map JSON using dart:convert and model classes.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_json_serializable',
            name: 'json_serializable Package',
            description:
                'Use code generation to create model classes with fromJson/toJson.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_freezed_models',
            name: 'freezed Package',
            description:
                'Generate immutable models with union types and pattern matching.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'dio-networking',
        name: 'Advanced Networking with Dio',
        skills: [
          Skill(
            id: 'part5_dio_usage',
            name: 'Using Dio Client',
            description:
                'Make API calls with Dio and take advantage of its features like interceptors.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_dio_upload',
            name: 'File Upload & Multipart',
            description: 'Upload files using multipart/form-data with Dio.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_dio_caching',
            name: 'Response Caching & Retry',
            description: 'Use Dio interceptors for request retry and caching.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'api-state',
        name: 'Integrating API with State',
        skills: [
          Skill(
            id: 'part5_future_builder',
            name: 'FutureBuilder & StreamBuilder',
            description:
                'Render UI based on API response using async builders.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_state_integration',
            name: 'Combine with Provider or Riverpod',
            description:
                'Use providers to manage loading, success, and error states of API calls.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'auth',
        name: 'Authentication & Secure Storage',
        skills: [
          Skill(
            id: 'part5_auth_jwt',
            name: 'JWT & Bearer Tokens',
            description:
                'Implement token-based authentication with secure headers.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_auth_refresh',
            name: 'Token Refresh Logic',
            description:
                'Handle token expiration and auto-refresh with interceptors.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_secure_storage',
            name: 'Secure Storage',
            description:
                'Store tokens and sensitive data using flutter_secure_storage.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'realtime',
        name: 'Real-Time Communication',
        skills: [
          Skill(
            id: 'part5_websockets',
            name: 'WebSockets',
            description:
                'Enable real-time chat or live updates using web_socket_channel.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_streams_controllers',
            name: 'Stream Controllers',
            description:
                'Control real-time data flow using StreamController and broadcast streams.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'baas',
        name: 'Backend-as-a-Service (BaaS)',
        skills: [
          Skill(
            id: 'part5_firebase',
            name: 'Firebase',
            description:
                'Use Firebase for Auth, Firestore, Storage, and Realtime DB.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_supabase',
            name: 'Supabase',
            description:
                'Use open-source Supabase for auth, storage, and database services.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_amplify',
            name: 'AWS Amplify',
            description:
                'Leverage AWS Amplify for cloud-hosted backend infrastructure.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'api-testing',
        name: 'Testing API Integrations',
        skills: [
          Skill(
            id: 'part5_test_mock_http',
            name: 'Mocking API Calls',
            description:
                'Use mockito or http_mock_adapter to fake API responses.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part5_test_services',
            name: 'Testing Service Classes',
            description:
                'Write unit tests for API services independently of UI.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part6',
    title: _extractEmojiAndTitle(
      '🗃 Part 6: Data Persistence & Local Storage',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🗃 Part 6: Data Persistence & Local Storage',
    )['emoji']!,
    description:
        'Persistent data allows apps to save and retrieve information across sessions. This part covers shared preferences, local databases like SQLite and Hive, secure storage, and caching strategies.',
    sections: [
      Section(
        id: 'local-storage-options',
        name: 'Choosing the Right Storage',
        skills: [
          Skill(
            id: 'part6_intro_options',
            name: 'Storage Types Overview',
            description:
                'Understand the difference between key-value storage, databases, and file storage in Flutter.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'shared-preferences',
        name: 'Shared Preferences (Key-Value)',
        skills: [
          Skill(
            id: 'part6_sharedprefs_setup',
            name: 'Setting Up shared_preferences',
            description:
                'Add package and configure for storing small, simple data like settings and flags.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_sharedprefs_use',
            name: 'Read/Write Shared Preferences',
            description:
                'Store and retrieve String, int, double, bool, and list data types.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'hive',
        name: 'Hive (NoSQL Storage)',
        skills: [
          Skill(
            id: 'part6_hive_intro',
            name: 'Hive Basics',
            description:
                'Use Hive for fast, key-value NoSQL storage with boxes.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_hive_adapters',
            name: 'Hive Type Adapters',
            description:
                'Create custom type adapters to store complex objects in Hive.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_hive_boxes',
            name: 'Box Operations',
            description:
                'Perform CRUD operations and reactive listening with Hive boxes.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'sqlite',
        name: 'SQLite (Relational Database)',
        skills: [
          Skill(
            id: 'part6_sqlite_setup',
            name: 'Setting Up SQFlite',
            description:
                'Add sqflite package and create a local SQLite database.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_sqlite_crud',
            name: 'CRUD Operations',
            description:
                'Insert, update, delete, and query rows from database tables.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_sqlite_orm',
            name: 'Using Moor/Drift ORM',
            description:
                'Use Drift for reactive SQLite queries with code generation.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'secure-storage',
        name: 'Secure Storage',
        skills: [
          Skill(
            id: 'part6_secure_storage',
            name: 'Using flutter_secure_storage',
            description:
                'Store sensitive user data securely on device (e.g. tokens, credentials).',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_biometric_auth',
            name: 'Biometric Protection',
            description:
                'Add fingerprint/face unlock for secure access using local_auth.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'file-storage',
        name: 'File System Storage',
        skills: [
          Skill(
            id: 'part6_file_read_write',
            name: 'Read/Write Files',
            description:
                'Use dart:io to read and write text and binary files to local device.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_path_provider',
            name: 'Path Provider',
            description:
                'Get system directories for file storage (appDir, tempDir).',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'caching',
        name: 'Data Caching Strategies',
        skills: [
          Skill(
            id: 'part6_api_cache',
            name: 'Cache API Responses',
            description:
                'Store and reuse API results for performance and offline use.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part6_cache_clear',
            name: 'Cache Invalidation',
            description: 'Manage and clear outdated cached data intelligently.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'sync',
        name: 'Offline Sync',
        skills: [
          Skill(
            id: 'part6_offline_sync',
            name: 'Sync Local & Remote Data',
            description:
                'Handle local changes and synchronize with backend when online.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'testing-storage',
        name: 'Testing Storage Code',
        skills: [
          Skill(
            id: 'part6_test_storage',
            name: 'Mock Storage for Tests',
            description:
                'Write unit tests by mocking Hive, SharedPreferences, and file I/O.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part7',
    title: _extractEmojiAndTitle(
      '🔒 Part 7: App Architecture & Clean Code',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🔒 Part 7: App Architecture & Clean Code',
    )['emoji']!,
    description:
        'A scalable and maintainable architecture is essential for production-ready Flutter apps. This part teaches clean code principles, SOLID design, layered architecture, modularization, and separation of concerns.',
    sections: [
      Section(
        id: 'architecture-overview',
        name: 'Architecture Principles',
        skills: [
          Skill(
            id: 'part7_arch_solid',
            name: 'SOLID Principles',
            description:
                'Apply the five SOLID principles for better object-oriented design.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_arch_layers',
            name: 'Layered Architecture',
            description:
                'Separate app into layers: Presentation, Domain, Data.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'clean-architecture',
        name: 'Clean Architecture',
        skills: [
          Skill(
            id: 'part7_clean_entities',
            name: 'Entities & Use Cases',
            description:
                'Define pure Dart models and use cases in the domain layer.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_clean_repositories',
            name: 'Repository Pattern',
            description:
                'Abstract data access with interfaces implemented in the data layer.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_clean_data_sources',
            name: 'Remote & Local Data Sources',
            description:
                'Split actual API and storage implementations into separate data source classes.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'dependency-injection',
        name: 'Dependency Injection (DI)',
        skills: [
          Skill(
            id: 'part7_di_getit',
            name: 'Using get_it',
            description:
                'Register and inject dependencies using the get_it service locator.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_di_initializer',
            name: 'App Initialization with DI',
            description:
                'Centralize dependency registration and initialization at app startup.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'folder-structure',
        name: 'Project & Folder Structure',
        skills: [
          Skill(
            id: 'part7_folder_feature',
            name: 'Feature-first Folder Structure',
            description: 'Organize code by features/modules rather than types.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_folder_layered',
            name: 'Layered Folder Structure',
            description:
                'Separate app into /presentation, /domain, /data folders.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'clean-code',
        name: 'Clean Code Practices',
        skills: [
          Skill(
            id: 'part7_clean_naming',
            name: 'Naming & Comments',
            description:
                'Use descriptive variable/method names and comments when necessary.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_clean_modular',
            name: 'Modularity',
            description:
                'Split logic into small, reusable classes, files, and widgets.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_clean_constants',
            name: 'Centralize Constants',
            description:
                'Keep magic values in one place for reuse and easy refactoring.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'scalability',
        name: 'Scalability & Maintainability',
        skills: [
          Skill(
            id: 'part7_scalability_patterns',
            name: 'Design Patterns in Flutter',
            description:
                'Apply common design patterns like Singleton, Factory, Builder, and MVC/MVVM.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_scalability_linting',
            name: 'Code Linting & Analysis',
            description:
                'Use custom_lint, very_good_analysis or flutter_lints for consistent code.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_scalability_docs',
            name: 'Documentation',
            description:
                'Write helpful code and API documentation using DartDoc.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'testing-architecture',
        name: 'Testing Architecture Components',
        skills: [
          Skill(
            id: 'part7_testing_usecases',
            name: 'Test Use Cases',
            description:
                'Write unit tests for domain layer use cases independently.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part7_testing_repository',
            name: 'Test Repositories with Mocks',
            description: 'Mock APIs and storage and test data flow logic.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part8',
    title: _extractEmojiAndTitle(
      '🧪 Part 8: Testing, Debugging & CI/CD',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🧪 Part 8: Testing, Debugging & CI/CD',
    )['emoji']!,
    description:
        'Testing ensures your app behaves as expected. Debugging helps you fix issues. CI/CD enables rapid, automated delivery of updates. This part covers unit, widget, and integration testing, Flutter DevTools, and deployment automation.',
    sections: [
      Section(
        id: 'testing-overview',
        name: 'Types of Testing in Flutter',
        skills: [
          Skill(
            id: 'part8_testing_unit',
            name: 'Unit Testing',
            description:
                'Test individual Dart functions, classes, or logic with the test package.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_testing_widget',
            name: 'Widget Testing',
            description:
                'Test UI behavior using pumpWidget and widget matchers.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_testing_integration',
            name: 'Integration Testing',
            description:
                'Test full app flows across screens using integration_test package.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'writing-tests',
        name: 'Writing Effective Tests',
        skills: [
          Skill(
            id: 'part8_test_structure',
            name: 'Test Structure & Setup',
            description:
                'Organize tests into files, use setup/teardown, and write meaningful assertions.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_test_mocktail',
            name: 'Mocking with mockito/mocktail',
            description:
                'Simulate dependencies like services and repositories in tests.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_test_fake_widgets',
            name: 'Fake Widgets & Providers',
            description:
                'Inject fake dependencies into the widget tree for controlled testing.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'test-coverage',
        name: 'Test Coverage & Best Practices',
        skills: [
          Skill(
            id: 'part8_coverage_measure',
            name: 'Measure Test Coverage',
            description:
                'Generate code coverage reports to ensure important logic is tested.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_test_best_practices',
            name: 'Testing Best Practices',
            description:
                'Write deterministic, isolated, and meaningful tests with good naming.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'debugging',
        name: 'Debugging Tools & Techniques',
        skills: [
          Skill(
            id: 'part8_debug_devtools',
            name: 'Using Flutter DevTools',
            description:
                'Profile, debug layouts, view memory usage, and analyze performance.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_debug_logging',
            name: 'Logging & print()',
            description:
                'Use print statements and logger packages to trace app behavior.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_debug_errors',
            name: 'Handling Errors & Exceptions',
            description:
                'Gracefully catch and report errors using try/catch and FlutterError.onError.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'crash-reporting',
        name: 'Crash Reporting & Analytics',
        skills: [
          Skill(
            id: 'part8_crashlytics',
            name: 'Using Firebase Crashlytics',
            description:
                'Automatically collect and report crash logs in production apps.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_analytics',
            name: 'User Analytics',
            description:
                'Track user actions using Firebase Analytics or other tools.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'ci',
        name: 'Continuous Integration (CI)',
        skills: [
          Skill(
            id: 'part8_ci_github',
            name: 'CI with GitHub Actions',
            description:
                'Run automated tests and checks on each push using GitHub Actions.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_ci_code_quality',
            name: 'Automate Code Quality Checks',
            description:
                'Run static analysis, linting, formatting, and tests in CI pipeline.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'cd',
        name: 'Continuous Delivery (CD)',
        skills: [
          Skill(
            id: 'part8_cd_deploy_android',
            name: 'Deploy to Google Play via CI',
            description:
                'Use fastlane or CLI tools to automate publishing to Play Store.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_cd_deploy_ios',
            name: 'Deploy to TestFlight/App Store',
            description:
                'Integrate Apple account for automated iOS builds with CI tools.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part8_cd_versioning',
            name: 'Auto Versioning & Changelog',
            description:
                'Update version codes and generate changelogs automatically during CI.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
  RoadmapPart(
    id: 'part9',
    title: _extractEmojiAndTitle(
      '🎨 Part 9: Advanced Flutter Topics',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🎨 Part 9: Advanced Flutter Topics',
    )['emoji']!,
    description:
        'Master advanced Flutter concepts to build high-performance, beautiful, and deeply integrated apps. This part covers animations, platform integration, performance optimization, accessibility, and native code interoperability.',
    sections: [
      Section(
        id: 'advanced-animations',
        name: 'Advanced Animations',
        skills: [
          Skill(
            id: 'part9_animations_custom',
            name: 'Custom Animations',
            description:
                'Use AnimationController, TweenSequence, and AnimatedBuilder for fine-grained animation control.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_animations_lottie',
            name: 'Lottie Animations',
            description:
                'Use Lottie for rendering rich vector animations from JSON files.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_animations_hero_advanced',
            name: 'Advanced Hero Transitions',
            description:
                'Create smooth shared element transitions across multiple screens.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'custom-paint',
        name: 'Custom Drawing & Painting',
        skills: [
          Skill(
            id: 'part9_custom_paint',
            name: 'Using CustomPaint',
            description:
                'Draw complex shapes and paths directly using the Canvas API.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_gesture_canvas',
            name: 'Gesture Detection with Drawing',
            description:
                'Capture gestures and interact with custom canvas drawings.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'native-integration',
        name: 'Platform-Specific Code',
        skills: [
          Skill(
            id: 'part9_platform_channels',
            name: 'Platform Channels',
            description:
                'Communicate between Dart and native Android/iOS code using MethodChannel.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_platform_plugins',
            name: 'Creating Platform Plugins',
            description:
                'Create and publish plugins to expose native APIs to Flutter.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_foreground_services',
            name: 'Android Services / iOS Background Tasks',
            description:
                'Integrate platform features like foreground services, notifications, background fetch.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'performance',
        name: 'Performance Optimization',
        skills: [
          Skill(
            id: 'part9_perf_devtools',
            name: 'Using Flutter DevTools',
            description:
                'Analyze frame rendering time, widget rebuilds, and memory usage.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_perf_widgets',
            name: 'Optimizing Widgets',
            description:
                'Use const constructors, RepaintBoundary, and avoid excessive rebuilds.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_perf_listview',
            name: 'List Performance',
            description:
                'Use ListView.builder, item caching, and lazy loading for large lists.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_perf_memory',
            name: 'Memory Management',
            description:
                'Track leaks, large images, and optimize image memory usage.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'accessibility',
        name: 'Accessibility (a11y)',
        skills: [
          Skill(
            id: 'part9_accessibility_semantics',
            name: 'Semantics & Screen Readers',
            description:
                'Use the Semantics widget and label elements for accessibility.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_accessibility_scaling',
            name: 'Font & Layout Scaling',
            description:
                'Support dynamic text scaling using MediaQuery and adaptive layouts.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'desktop-web',
        name: 'Flutter for Web & Desktop',
        skills: [
          Skill(
            id: 'part9_flutter_web',
            name: 'Building for Web',
            description:
                'Build responsive web apps and use conditional imports for browser support.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_flutter_desktop',
            name: 'Flutter for Windows, macOS, Linux',
            description:
                'Build native desktop apps using Flutter with file system access and plugins.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'code-generation',
        name: 'Code Generation',
        skills: [
          Skill(
            id: 'part9_codegen_build_runner',
            name: 'build_runner',
            description:
                'Automate code generation for models, adapters, routes, etc.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_codegen_json_serializable',
            name: 'json_serializable',
            description: 'Generate JSON parsing logic from model annotations.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part9_codegen_freezed',
            name: 'Freezed + Sealed Unions',
            description:
                'Use Freezed for immutable models, pattern matching, and union types.',
            priority: SkillPriority.optional,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),

  RoadmapPart(
    id: 'part10',
    title: _extractEmojiAndTitle(
      '🌐 Part 10: App Publishing & Real-World Skills',
    )['title']!,
    iconEmoji: _extractEmojiAndTitle(
      '🌐 Part 10: App Publishing & Real-World Skills',
    )['emoji']!,
    description:
        'Learn how to professionally launch your Flutter app, maintain it post-launch, and thrive in real-world development environments. Covers app store publishing, analytics, team workflows, security, and career growth.',
    sections: [
      Section(
        id: 'release-prep',
        name: 'Preparing for App Release',
        skills: [
          Skill(
            id: 'part10_versioning',
            name: 'Semantic Versioning',
            description:
                'Apply semantic versioning (major.minor.patch) and configure version code/name for Android (build.gradle) and iOS (Info.plist).',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_app_icons',
            name: 'App Icons & Splash Screens',
            description:
                'Design and configure platform-specific app icons and splash screens using flutter_launcher_icons and native configuration.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_manifest_permissions',
            name: 'App Manifest & Permissions',
            description:
                'Configure AndroidManifest.xml and Info.plist; declare permissions for camera, location, etc.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_build_configs',
            name: 'Build Configurations & Flavors',
            description:
                'Set up debug, profile, release builds and flavoring for different environments (dev/staging/prod).',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'publishing',
        name: 'Publishing to App Stores',
        skills: [
          Skill(
            id: 'part10_google_play',
            name: 'Google Play Store Publishing',
            description:
                'Set up a developer account, prepare APK/AAB, manage signing, upload, create store listing, and handle rollouts.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_app_store',
            name: 'Apple App Store Publishing',
            description:
                'Enroll in Apple Developer Program, prepare IPA, manage certificates/profiles, upload via Xcode/Transporter, TestFlight, and app review.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'post-publish',
        name: 'Post-Publishing Maintenance',
        skills: [
          Skill(
            id: 'part10_bug_fixes',
            name: 'Bug Fixes & Updates',
            description:
                'Manage app versions, release channels, and hotfixes for smooth updates.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_analytics',
            name: 'Monitoring & Analytics',
            description:
                'Integrate Firebase Analytics, Google Analytics, and crash monitoring tools like Crashlytics or Sentry.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_user_feedback',
            name: 'User Feedback & Support',
            description:
                'Implement in-app feedback, respond to reviews, and manage support efficiently.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_performance_monitoring',
            name: 'Performance Monitoring',
            description:
                'Use Firebase Performance Monitoring and crash reporting for ongoing quality.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'real-world-skills',
        name: 'Real-World Development Skills',
        skills: [
          Skill(
            id: 'part10_git_collab',
            name: 'Team Collaboration & Git',
            description:
                'Master Git workflows, branching, code reviews, and agile practices (Scrum/Kanban).',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_documentation',
            name: 'Documentation & Communication',
            description:
                'Write clear READMEs, code comments, API docs, and onboarding guides.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_security',
            name: 'Security & Compliance',
            description:
                'Follow secure API practices, handle sensitive data, and understand GDPR/CCPA basics.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_communication',
            name: 'Effective Communication',
            description:
                'Present demos, write user stories, and gather/implement stakeholder feedback.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'continuous-learning',
        name: 'Continuous Learning & Community Engagement',
        skills: [
          Skill(
            id: 'part10_stay_updated',
            name: 'Stay Updated with Flutter',
            description:
                'Follow Flutter developments, read blog posts, and participate in Flutter community events.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part10_community_engagement',
            name: 'Engage with Flutter Community',
            description:
                'Participate in Flutter conferences, meetups, and contribute to open source projects.',
            priority: SkillPriority.mustLearn,
            status: SkillStatus.notStarted,
          ),
        ],
      ),
    ],
    progress: 0.0,
  ),
];
