import 'package:flutter/material.dart';
import '../models/roadmap_data_models.dart';
import 'section_view.dart';

class RoadmapPartView extends StatefulWidget {
  final RoadmapPart part;

  const RoadmapPartView({Key? key, required this.part}) : super(key: key);

  @override
  _RoadmapPartViewState createState() => _RoadmapPartViewState();
}

class _RoadmapPartViewState extends State<RoadmapPartView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // The part.progress is now updated by RoadmapNotifier, so we can use it directly.
    // No need to make this widget a ConsumerWidget if it only reads data from the part object.
    // The parent widget (MainLayout) is a ConsumerWidget, so when the state updates,
    // MainLayout rebuilds, passing the new part data (with updated progress) to RoadmapPartView.

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: widget.part.iconEmoji.isNotEmpty
                ? Text(widget.part.iconEmoji, style: const TextStyle(fontSize: 24))
                : null,
            title: Column( // Wrap title and progress in a Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.part.title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4), // Spacing
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: widget.part.progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                        minHeight: 6, // Make it a bit thicker
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${(widget.part.progress * 100).toStringAsFixed(0)}%",
                      style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: widget.part.description.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0), // Add padding above description
                    child: Text(widget.part.description, style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 13)),
                  )
                : null,
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            isThreeLine: widget.part.description.isNotEmpty, // Adjust list tile height if description is present
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  ...widget.part.sections.map((section) {
                    return SectionView(
                      section: section,
                      partId: widget.part.id,
                    );
                  }).toList(),
                  if (widget.part.sections.isEmpty)
                    Text(
                      "No sections defined for this part yet.",
                       style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
