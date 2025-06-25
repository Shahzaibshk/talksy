import 'package:flutter/material.dart';

import '../utils/app_textstyle.dart';
import '../utils/utils.dart';

class PrimaryChipWidget extends StatelessWidget {
  final String? text;
  final bool selected;
  final VoidCallback? onTap;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? textstyle;
  final double? borderWidth;
  final Color? boxColor;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? child;

  const PrimaryChipWidget({
    this.text,
    this.selected = false,
    this.onTap,
    super.key,
    this.horizontalPadding,
    this.verticalPadding,
    this.textstyle,
    this.borderWidth,
    this.boxColor,
    this.borderColor,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 12,
          vertical: verticalPadding ?? 4,
        ),
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(
            width: borderWidth ?? 0.5,
            color: borderColor ?? Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 24),
        ),
        child: child ??
            Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: textstyle ??
                  AppTextstyle.smMedium.copyWith(
                    color: selected ? Colors.grey.shade700 : Colors.black,
                  ),
            ).centered(),
      ),
    );
  }
}
