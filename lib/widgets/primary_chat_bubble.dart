import 'package:flutter/material.dart';

class PrimaryChatBubble extends StatelessWidget {
  const PrimaryChatBubble({
    super.key,
    required this.text,
    this.constraints,
    this.borderWidth,
    this.textstyle,
    this.borderColor,
    this.bubbleColor,
    this.borderRadius,
    this.padding,
  });

  final String text;
  final BoxConstraints? constraints;
  final double? borderWidth;
  final TextStyle? textstyle;
  final Color? borderColor;
  final Color? bubbleColor;
  final BorderRadiusGeometry? borderRadius;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: textstyle,
      ),
      padding: EdgeInsets.all(padding ?? 12),
      constraints: constraints,
      decoration: BoxDecoration(
        color: bubbleColor,
        border: Border.all(
          width: borderWidth ?? 1,
          color: borderColor ?? Colors.grey.shade100,
        ),
        borderRadius: borderRadius,
      ),
    );
  }
}
