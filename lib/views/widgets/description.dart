import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final String text;
  const DescriptionWidget({super.key, required this.text});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  // ✅ التعريف يجب أن يكون هنا (خارج الـ build)
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          print("Current state: $isExpanded"); // للتأكد في الـ Console
        });
      },
      // أضفنا Container بلون شفاف أو Behavior لضمان أن اللمس يعمل على كامل المساحة
      child: Container(
        height:
            MediaQuery.of(context).size.width > 1024 ||
                MediaQuery.of(context).size.width > 768
            ? 100
            : 40, // ارتفاع محدود عندما لا يكون موسع
        color: Colors.transparent,
        child: isExpanded
            ? SingleChildScrollView(
                // يظهر السكرول فقط عند التوسع
                child: Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            : Text(
                // يظهر النص المختصر بنقاط
                widget.text,
                maxLines:
                    MediaQuery.of(context).size.width > 1024 ||
                        MediaQuery.of(context).size.width > 768
                    ? 5
                    : 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ),
    );
  }
}
