import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/utils.dart';
import 'primary_button.dart';

class PrimaryImageButton extends StatelessWidget {
  const PrimaryImageButton({
    this.image,
    this.textcolor,
    this.text,
    required this.ontap,
    this.isoutline,
    this.color,
    super.key,
  });

  final String? image;
  final String? text;
  final VoidCallback ontap;
  final Color? color;
  final Color? textcolor;
  final bool? isoutline;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      verticalPadding: 16,
      borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.12)),
      isOutline: isoutline ?? false,
      color: color,
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image ?? '',
            width: 0.04.sw(context),
          ),
          10.widthBox,
          Text(
            text ?? '',
            style: TextStyle(
              color: textcolor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
