import 'package:flutter/material.dart';
import '../../models/cv_data.dart';

class ContactSection extends StatelessWidget {
  final CvData data;
  const ContactSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final entries = <Widget>[
      _ContactRow(icon: Icons.email, label: data.email),
      if (data.phone.isNotEmpty)
        _ContactRow(icon: Icons.phone, label: data.phone),
      _ContactRow(icon: Icons.location_on, label: data.location),
    ];
    for (final entry in data.socials.entries) {
      entries.add(
        _ContactRow(icon: Icons.link, label: '${entry.key}: ${entry.value}'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Column(children: entries),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ContactRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(child: SelectableText(label)),
        ],
      ),
    );
  }
}
