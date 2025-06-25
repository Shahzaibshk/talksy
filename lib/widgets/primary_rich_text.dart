import 'package:flutter/material.dart';

import '../utils/app_textstyle.dart';

class PrimaryRichText extends StatelessWidget {
  const PrimaryRichText({
    super.key,
    required this.text,
    required this.linkedText,
    this.textstyle = AppTextstyle.mdSemiBold,
    this.linktextstyle = AppTextstyle.linktedstyle,
    this.ontap,
    this.secondaryText,
    this.secondaryTextStyle = AppTextstyle.mdSemiBold,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final String linkedText;
  final TextStyle? textstyle;
  final TextStyle? linktextstyle;
  final VoidCallback? ontap;
  final String? secondaryText;
  final TextStyle? secondaryTextStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: textstyle,
            ),
            TextSpan(
              text: linkedText,
              style: linktextstyle,
            ),
            TextSpan(
              text: secondaryText,
              style: secondaryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
