import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/cv_data.dart';

class ContactSection extends StatelessWidget {
  final CvData data;
  const ContactSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final entries = <Widget>[
      _ContactRow(
        icon: Icons.email,
        label: data.email,
        link: true,
        linkType: "",
      ),
      if (data.phone.isNotEmpty)
        _ContactRow(
          icon: Icons.phone,
          label: data.phone,
          link: true,
          linkType: "",
        ),
      _ContactRow(
        icon: Icons.location_on,
        label: data.location,
        link: false,
        linkType: "",
      ),
    ];
    for (final entry in data.socials.entries) {
      entries.add(
        _ContactRow(
          icon: Icons.link,
          label: entry.value,
          link: true,
          linkType: entry.key,
        ),
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
  final String linkType;
  final bool link;

  const _ContactRow({
    required this.icon,
    required this.label,
    required this.link,
    required this.linkType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              linkType == "" ? label : '$linkType : $label',
              // style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          // --- COPY BUTTON ---
          link
              ? IconButton(
                  icon: const Icon(Icons.copy, size: 18, color: Colors.grey),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: label)).then((_) {
                      // Show a small confirmation toast/snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$label copied to clipboard!'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    });
                  },
                  tooltip: 'Copy to clipboard',
                )
              : const SizedBox.shrink(), // Empty space when not a link
        ],
      ),
    );
  }
}
