import 'package:flutter/material.dart';
import '../../models/cv_data.dart';

class AboutSection extends StatelessWidget {
  final CvData data;
  const AboutSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text(data.about, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
