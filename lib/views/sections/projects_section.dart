import 'package:flutter/material.dart';
import '../../models/cv_data.dart';
import '../widgets/hover_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 1024;
    final isMedium = screenWidth > 768;
    final crossAxisCount = isWide
        ? 3
        : isMedium
        ? 2
        : 1;
    final childAspectRatio = isWide
        ? 1.6
        : isMedium
        ? 1.4
        : 1.2;
    final spacing = isMedium ? 16.0 : 12.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final p = projects[index];
            final padding = isMedium ? 16.0 : 12.0;
            return HoverCard(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: padding * 0.5),
                    Expanded(
                      child: Text(
                        p.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: padding * 0.75),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: p.tags
                          .map(
                            (t) => Chip(
                              label: Text(
                                t,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
