import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import '../../models/cv_data.dart';
import '../widgets/fade_slide.dart';

class HeroSection extends StatelessWidget {
  final CvData data;
  const HeroSection({super.key, required this.data});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  Future<void> _launchUrlDownload(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (kIsWeb) {
      html.AnchorElement anchorElement = html.AnchorElement(href: urlString);
      anchorElement.setAttribute("download", "Resume.pdf");
      anchorElement.click();
    } else {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $urlString');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 1024;
    final isMedium = screenWidth > 768;
    final avatarSize = isWide
        ? 128.0
        : isMedium
        ? 100.0
        : 90.0;
    final nameStyle = isWide
        ? Theme.of(context).textTheme.displayLarge
        : isMedium
        ? Theme.of(context).textTheme.displayMedium
        : Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);
    final verticalSpacing = isWide
        ? 32.0
        : isMedium
        ? 24.0
        : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isWide
            ? 48
            : isMedium
            ? 32
            : 24,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeSlide(
                        delay: const Duration(milliseconds: 0),
                        child: Text(data.name, style: nameStyle),
                      ),
                      SizedBox(height: verticalSpacing * 0.25),
                      FadeSlide(
                        delay: const Duration(milliseconds: 100),
                        child: Text(
                          data.title,
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing * 0.5),
                      FadeSlide(
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          data.summary,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: verticalSpacing * 0.75),
                      FadeSlide(
                        delay: const Duration(milliseconds: 300),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            FilledButton(
                              onPressed: () => _launchUrlDownload(
                                'https://drive.google.com/uc?export=download&id=1di6uukksdar2_U4Ht_a-l7EPPm1dEPS6',
                              ),
                              child: const Text('Download Résumé'),
                            ),
                            OutlinedButton(
                              onPressed: () => _launchUrl(
                                'https://drive.google.com/file/d/1di6uukksdar2_U4Ht_a-l7EPPm1dEPS6/view?usp=drivesdk',
                              ),
                              child: const Text('Get In Touch'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isWide ? 24 : 16),
                FadeSlide(
                  delay: const Duration(milliseconds: 250),
                  child: _ProfileAvatar(
                    size: avatarSize,
                    initials: data.initials,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FadeSlide(
                    delay: const Duration(milliseconds: 0),
                    child: _ProfileAvatar(
                      size: avatarSize,
                      initials: data.initials,
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing * 0.5),
                FadeSlide(
                  delay: const Duration(milliseconds: 100),
                  child: Text(data.name, style: nameStyle),
                ),
                SizedBox(height: verticalSpacing * 0.25),
                FadeSlide(
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    data.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing * 0.35),
                FadeSlide(
                  delay: const Duration(milliseconds: 300),
                  child: Text(
                    data.summary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: verticalSpacing * 0.5),
                FadeSlide(
                  delay: const Duration(milliseconds: 400),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton(
                        onPressed: () => _launchUrlDownload(
                          'https://drive.google.com/uc?export=download&id=1di6uukksdar2_U4Ht_a-l7EPPm1dEPS6',
                        ),
                        child: const Text('Download Résumé'),
                      ),
                      OutlinedButton(
                        onPressed: () => _launchUrl(
                          'https://drive.google.com/file/d/1di6uukksdar2_U4Ht_a-l7EPPm1dEPS6/view?usp=drivesdk',
                        ),
                        child: const Text('Get In Touch'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _ProfileAvatar extends StatefulWidget {
  final double size;
  final String initials;
  const _ProfileAvatar({required this.size, required this.initials});

  @override
  State<_ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<_ProfileAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _floatAnimation = Tween<double>(
    begin: 0,
    end: 12,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  late final Animation<double> _rotateAnimation = Tween<double>(
    begin: 0,
    end: 0.05,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_floatAnimation.value),
          child: Transform.rotate(
            angle: _rotateAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 20 + _floatAnimation.value,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: ClipOval(
                child: SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: Image.asset(
                    'assets/images/me.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, _, __) => Container(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: Center(
                        child: Text(
                          widget.initials,
                          style: TextStyle(fontSize: widget.size * 0.32),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
