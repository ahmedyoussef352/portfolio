import 'package:flutter/material.dart';

class StoryViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const StoryViewer({required this.images, this.initialIndex = 0});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void _onTap(TapUpDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 3) {
      // Tap Left: Go to previous image
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Tap Right: Go to next image
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. The Story Content
          GestureDetector(
            onTapUp: _onTap,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Image.asset(widget.images[index], fit: BoxFit.contain);
              },
            ),
          ),

          // 2. The Back Button
          Positioned(
            top: 40, // Adjust for status bar height
            left: 10,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () =>
                    Navigator.pop(context), // Goes back to the portfolio
              ),
            ),
          ),
        ],
      ),
    );
  }
}
