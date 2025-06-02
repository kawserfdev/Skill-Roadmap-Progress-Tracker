import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/roadmap_data_models.dart';
import '../providers/roadmap_providers.dart';
import 'roadmap_part_view.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use filteredRoadmapProvider for displaying roadmap parts
    final List<RoadmapPart> roadmapData = ref.watch(filteredRoadmapProvider);
    final double overallProgress = ref.watch(overallProgressProvider);
    final String currentSearchQuery = ref.watch(searchQueryProvider);
    final TextEditingController searchController = TextEditingController(text: currentSearchQuery);
    // Ensure cursor is at the end if there's text
    searchController.selection = TextSelection.fromPosition(TextPosition(offset: searchController.text.length));


    return Scaffold(
      appBar: AppBar(
        // Step 1: Add Search Bar UI
        title: Container(
          height: 40, // Consistent height for the search bar area
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: searchController,
            autofocus: false, // Set to true if you want it to focus on load
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)),
              hintText: "Search skills, sections, parts...",
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7), fontSize: 16),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0), // Adjust vertical padding
              suffixIcon: currentSearchQuery.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)),
                      onPressed: () {
                        searchController.clear();
                        ref.read(searchQueryProvider.notifier).state = '';
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              // Step 3: Connect TextField to Provider
              ref.read(searchQueryProvider.notifier).state = value;
            },
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: overallProgress,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.onPrimary.withOpacity(0.9)),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Overall: ${(overallProgress * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: roadmapData.isEmpty && currentSearchQuery.isNotEmpty
          ? Center(child: Text("No results found for \"$currentSearchQuery\""))
          : ListView.builder(
              itemCount: roadmapData.length,
              itemBuilder: (BuildContext context, int index) {
                final part = roadmapData[index];
                return RoadmapPartView(part: part);
              },
            ),
    );
  }
}
