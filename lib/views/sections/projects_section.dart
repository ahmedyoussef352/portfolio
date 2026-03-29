import 'package:flutter/material.dart';
import 'package:portfolio/views/widgets/animation_tags.dart';
import 'package:portfolio/views/widgets/description.dart';
import 'package:portfolio/views/widgets/images_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/cv_data.dart';
import '../widgets/hover_card.dart';

class ProjectsSection extends StatefulWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool isExpanded = false;
  final List<Color> itemColors = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
  ];
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

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
        ? .7
        : isMedium
        ? screenWidth < 821
              ? 0.8
              : 1.0
        : screenWidth < 572
        ? 1.0
        : screenWidth < 616
        ? 1.2
        : 1.5;
    final spacing = isMedium ? 16.0 : 12.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final p = widget.projects[index];
            final padding = isMedium ? 16.0 : 12.0;
            return InkWell(
              onTap: () {
                setState(() {
                  _launchUrl(p.link.toString());
                });
              },
              child: HoverCard(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: padding,
                    vertical: padding,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- Logo and Name Row ---
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(padding * .5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: p.logo.contains("makemynikah")
                                      ? Colors.pink
                                      : p.logo.contains("dream_logo")
                                      ? Colors.white
                                      : p.logo.contains("jeras")
                                      ? Colors.deepPurple.shade400
                                      : Colors.white,
                                ),

                                child: Image.asset(
                                  color: p.logo.contains("makemynikah")
                                      ? Colors.amber.shade400
                                      : null,
                                  p.logo,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  // Error builder prevents the app from crashing if the URL is broken
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image),
                                ),
                              ),
                              SizedBox(
                                width: padding,
                              ), // Space between logo and text

                              Expanded(
                                child: MouseRegion(
                                  child: Text(
                                    p.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: isMedium ? 16 : 14,
                                          color: Colors.blue,
                                          decoration: TextDecoration
                                              .underline, // الخط التحتاني ضروري
                                          decorationColor: Colors.blue,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: padding * 0.5),
                              DescriptionWidget(text: p.description),
                            ],
                          ),

                          SizedBox(
                            height: isWide || isMedium
                                ? padding
                                : isMedium
                                ? padding * .7
                                : padding * .7,
                          ),
                          // --- Horizontal Image Slides (Facebook Story Style) ---
                          p.images != null
                              ? SizedBox(
                                  height:
                                      150, // Height of the story bubbles/cards
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: p
                                        .images!
                                        .length, // Assuming p.images is a List<String>
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => StoryViewer(
                                                images: p.images!,
                                                initialIndex:
                                                    index, // Start at the image the user clicked
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width:
                                              100, // Width of each story slide
                                          margin: const EdgeInsets.only(
                                            right: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: Colors.blue,
                                              width: 2,
                                            ), // Story ring
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              p.images![index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: padding),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: SequentialGlowTags(
                          tags: p.tags, // قائمة الـ tags الخاصة بك
                          isMedium: isMedium,
                        ),
                      ),

                      // داخل الـ Row في الكود الخاص بك:
                      //
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
