import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import '../models/cv_data.dart';
import '../data/cv_repository.dart';

class PortfolioViewModel extends ChangeNotifier {
  final CvData cvData = CvRepository.getCvData();
  
  bool _showAppBar = false;
  bool get showAppBar => _showAppBar;

  void updateAppBarVisibility(double scrollOffset) {
    final shouldShow = scrollOffset > 300;
    if (shouldShow != _showAppBar) {
      _showAppBar = shouldShow;
      notifyListeners();
    }
  }

  Future<void> launchWebUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  Future<void> launchUrlDownload(String urlString) async {
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

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 900),
        curve: Curves.fastOutSlowIn,
        alignment: 0.1,
      );
    }
  }
}
