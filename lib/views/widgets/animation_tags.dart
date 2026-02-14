import 'dart:async';
import 'package:flutter/material.dart';

class SequentialGlowTags extends StatefulWidget {
  final List<String> tags;
  final bool isMedium;

  const SequentialGlowTags({
    super.key,
    required this.tags,
    this.isMedium = false,
  });

  @override
  State<SequentialGlowTags> createState() => _SequentialGlowTagsState();
}

class _SequentialGlowTagsState extends State<SequentialGlowTags> {
  int _activeIndex = 0;
  Timer? _timer;
  final ScrollController _scrollController = ScrollController();

  final List<Color> _itemColors = [
    Colors.blue, Colors.purple, Colors.orange, 
    Colors.teal, Colors.pink, Colors.indigo,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoAnimation();
  }

  void _startAutoAnimation() {
    // المؤقت يتحكم في سرعة الانتقال بين العناصر
    _timer = Timer.periodic(const Duration(milliseconds: 1200), (timer) {
      if (mounted && widget.tags.isNotEmpty) {
        setState(() {
          _activeIndex = (_activeIndex + 1) % widget.tags.length;
        });
        _animateScroll();
      }
    });
  }

  void _animateScroll() {
    if (_scrollController.hasClients) {
      // حساب عرض العنصر التقريبي + المسافات (Margin)
      double itemEstimatedWidth = widget.isMedium ? 90.0 : 70.0;
      
      // التمرير إلى العنصر النشط مع جعله في المنتصف تقريباً
      double offset = (_activeIndex * (itemEstimatedWidth + 10)) - 50;
      
      // التأكد من أن السكرول لا يتخطى الحدود
      if (offset < 0) offset = 0;
      if (offset > _scrollController.position.maxScrollExtent) {
        offset = _scrollController.position.maxScrollExtent;
      }

      // إضافة أنيميشن التمرير السلس
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 800), // وقت حركة السكرول
        curve: Curves.easeInOutQuart, // منحنى حركة احترافي وسلس
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.tags.asMap().entries.map((entry) {
          int index = entry.key;
          String tag = entry.value;
          bool isFocused = index == _activeIndex;
          Color baseColor = _itemColors[index % _itemColors.length];
    
          return SizedBox(
            height: widget.isMedium ? 70 : 50,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.symmetric(horizontal: isFocused ? 8.0 : 4.0),
              child: AnimatedScale(
                scale: isFocused ? 1.15 : 1, // تكبير العنصر النشط
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutSine, // يعطي تأثير "قفزة" بسيطة عند التكبير
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: isFocused ? [
                      BoxShadow(
                        color: baseColor.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 3,
                      )
                    ] : [],
                  ),
                  child: Chip(
                    backgroundColor: isFocused ? baseColor : baseColor.withOpacity(0.05),
                    side: BorderSide(
                      color: isFocused ? Colors.white : baseColor.withOpacity(0.2),
                      width: 1.5,
                    ),
                    label: Text(
                      tag,
                      style: TextStyle(
                        fontSize: widget.isMedium ? 12 : 9,
                        color: isFocused ? Colors.white : baseColor.withOpacity(0.8),
                        fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}