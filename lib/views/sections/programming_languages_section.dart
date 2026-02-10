import 'package:flutter/material.dart';
import '../../models/cv_data.dart';
import '../widgets/hover_card.dart';

class ProgrammingLanguagesSection extends StatelessWidget {
  final List<ProgrammingLanguage> languages;
  const ProgrammingLanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SKILLS', style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        )),
        const SizedBox(height: 24),
        Text(
          'Programming Languages',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: languages.map((lang) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: HoverCard(
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 12 : 16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          lang.icon,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          lang.name,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
