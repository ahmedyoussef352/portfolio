import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/portfolio_viewmodel.dart';
import 'widgets/animated_gradient_background.dart';
import 'widgets/fade_slide.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/programming_languages_section.dart';
import 'sections/mobile_development_section.dart';
import 'sections/tools_section.dart';
import 'sections/software_engineering_section.dart';
import 'sections/currently_learning_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      context.read<PortfolioViewModel>().updateAppBarVisibility(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    context.read<PortfolioViewModel>().scrollToSection(key);
  }

  @override
  Widget build(BuildContext context) {
    // This captures the width of the current screen
  double screenWidth = MediaQuery.of(context).size.width;
  
  // This prints the width to your console every time the screen orientation changes
  print("Current Screen Width: $screenWidth ✅");
    final viewModel = context.watch<PortfolioViewModel>();
    final maxWidth = 1100.0;
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      appBar: isMobile
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 1,
              title: Text(
                viewModel.cvData.name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 1,
              title: Text(
                viewModel.cvData.name,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 16 : 20,
                  color: Colors.white,
                ),
              ),
              actions: [
                _NavButton(label: 'Home', onTap: () => _scrollTo(_homeKey)),
                _NavButton(label: 'About', onTap: () => _scrollTo(_aboutKey)),
                _NavButton(label: 'Skills', onTap: () => _scrollTo(_skillsKey)),
                _NavButton(label: 'Experience', onTap: () => _scrollTo(_experienceKey)),
                _NavButton(label: 'Projects', onTap: () => _scrollTo(_projectsKey)),
                _NavButton(label: 'Contact', onTap: () => _scrollTo(_contactKey)),
              ],
            ),
      drawer: isMobile ? _buildDrawer(context) : null,
      body: AnimatedGradientBackground(
        child: _buildBody(context, maxWidth),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final viewModel = context.read<PortfolioViewModel>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: FadeSlide(
              delay: const Duration(milliseconds: 0),
              child: Text(
                viewModel.cvData.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _AnimatedDrawerItem(
            delay: const Duration(milliseconds: 100),
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              Navigator.pop(context);
              _scrollTo(_homeKey);
            },
          ),
          _AnimatedDrawerItem(
            delay: const Duration(milliseconds: 150),
            icon: Icons.person,
            label: 'About',
            onTap: () {
              Navigator.pop(context);
              _scrollTo(_aboutKey);
            },
          ),
          _AnimatedDrawerItem(
            delay: const Duration(milliseconds: 200),
            icon: Icons.code,
            label: 'Skills',
            onTap: () {
              Navigator.pop(context);
              _scrollTo(_skillsKey);
            },
          ),
          _AnimatedDrawerItem(
            delay: const Duration(milliseconds: 250),
            icon: Icons.work,
            label: 'Experience',
            onTap: () {
              Navigator.pop(context);
              _scrollTo(_experienceKey);
            },
          ),
          _AnimatedDrawerItem(
            delay: const Duration(milliseconds: 300),
            icon: Icons.folder,
            label: 'Projects',
            onTap: () {
              Navigator.pop(context);
              _scrollTo(_projectsKey);
            },
          ),
          _AnimatedDrawerItem(
            delay: const Duration(milliseconds: 350),
            icon: Icons.contact_mail,
            label: 'Contact',
            onTap: () {
              Navigator.pop(context);
              _scrollTo(_contactKey);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, double maxWidth) {
    final viewModel = context.read<PortfolioViewModel>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.maxWidth > 1024
            ? 48.0
            : constraints.maxWidth > 768
            ? 32.0
            : 16.0;
        final verticalSpacing = constraints.maxWidth > 768 ? 48.0 : 32.0;
        
        return ScrollConfiguration(
          behavior: _SmoothScrollBehavior(),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionContainer(
                        key: _homeKey,
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 0),
                          child: HeroSection(data: viewModel.cvData),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        key: _aboutKey,
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 150),
                          child: AboutSection(data: viewModel.cvData),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        key: _skillsKey,
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 300),
                          child: ProgrammingLanguagesSection(
                            languages: viewModel.cvData.programmingLanguages,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 375),
                          child: MobileDevelopmentSection(
                            categories: viewModel.cvData.mobileDevelopment,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 450),
                          child: ToolsSection(
                            toolCategories: viewModel.cvData.tools,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 525),
                          child: SoftwareEngineeringSection(
                            fundamentals: viewModel.cvData.softwareEngineering,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 600),
                          child: CurrentlyLearningSection(
                            learningItems: viewModel.cvData.currentlyLearning,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        key: _experienceKey,
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 675),
                          child: ExperienceSection(
                            experiences: viewModel.cvData.experiences,
                          ),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        key: _projectsKey,
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 750),
                          child: ProjectsSection(projects: viewModel.cvData.projects),
                        ),
                      ),
                      SizedBox(height: verticalSpacing),
                      _SectionContainer(
                        key: _contactKey,
                        child: FadeSlide(
                          delay: const Duration(milliseconds: 825),
                          child: ContactSection(data: viewModel.cvData),
                        ),
                      ),
                    ],
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

class _SmoothScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

class _SectionContainer extends StatelessWidget {
  final Widget child;
  const _SectionContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: child,
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton({required this.label, required this.onTap});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.5,
            ),
            color: Colors.transparent,
            boxShadow: _isHovered
                ? [
                    const BoxShadow(
                      color: Colors.black,
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              padding: EdgeInsets.zero,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedDrawerItem extends StatelessWidget {
  final Duration delay;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _AnimatedDrawerItem({
    required this.delay,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FadeSlide(
      delay: delay,
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}
