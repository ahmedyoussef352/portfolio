import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;
  const AnimatedGradientBackground({super.key, required this.child});

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat(reverse: true);
  
  late final Animation<Alignment> _begin = AlignmentTween(
    begin: Alignment.topCenter,
    end: Alignment.topLeft,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  
  late final Animation<Alignment> _end = AlignmentTween(
    begin: Alignment.bottomCenter,
    end: Alignment.bottomRight,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final start = const Color(0xFF0B1020);
    final end = const Color(0xFF111827);
    final accent = c.primary.withOpacity(0.12);
    
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _begin.value,
              end: _end.value,
              colors: [start, end],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 2,
                colors: [accent, Colors.transparent],
                stops: const [0, 1],
              ),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
