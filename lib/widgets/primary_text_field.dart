import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_textstyle.dart';
import '../utils/utils.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    this.title,
    this.validator,
    this.obscureText = false,
    this.focusNode,
    this.nextNode,
    this.onSubmitAction,
    this.keyboardType,
    this.disabled = false,
    this.initialText,
    this.helperText,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.minLines = 1,
    this.maxLines = 1,
    this.border,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.onTap,
    this.titlePaddingLeft = 4,
    this.spacingBetweenTitleAndField = 4,
    this.filled = false,
    this.autoFocus = false,
    this.contentPadding,
    this.onChanged,
    this.fillColor,
    this.borderRadius,
    this.prefixconstraints,
  });
  final TextEditingController controller;
  final String? title;
  final String? Function(String?)? validator;
  final bool obscureText;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final VoidCallback? onSubmitAction;
  final TextInputType? keyboardType;
  final bool disabled;
  final String? initialText;
  final String? helperText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final InputBorder? border;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final double titlePaddingLeft;
  final double spacingBetweenTitleAndField;
  final void Function(String)? onChanged;
  final bool filled;
  final bool autoFocus;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final double? borderRadius;
  final BoxConstraints? prefixconstraints;

  @override
  Widget build(BuildContext context) {
    final currentBorder =
        border ??
        OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(borderRadius ?? kBorderRadius),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: AppTextstyle.smSemiBold,
          ).pOnly(left: titlePaddingLeft),
          spacingBetweenTitleAndField.heightBox,
        ],
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(kBorderRadius),
          ),
          child: TextFormField(
            autofocus: autoFocus,
            readOnly: disabled || onTap != null,
            onTap: onTap == null ? null : () => onTap!(),
            inputFormatters: inputFormatters,
            minLines: minLines,
            maxLines: maxLines,
            initialValue: initialText,
            keyboardType: keyboardType,
            focusNode: focusNode,
            obscureText: obscureText,
            controller: controller,
            validator: validator,
            textAlign: textAlign,
            onChanged: onChanged,
            style: TextStyle(
              color: context.adaptive,
              fontWeight: FontWeight.w500,
            ),
            onFieldSubmitted: (_) {
              if (nextNode != null) {
                FocusScope.of(context).requestFocus(nextNode);
              }
              if (onSubmitAction != null) {
                onSubmitAction!();
              }
            },
            textAlignVertical: TextAlignVertical.center,
            textInputAction:
                textInputAction ??
                (nextNode == null
                    ? TextInputAction.done
                    : TextInputAction.next),
            decoration: InputDecoration(
              prefixIconConstraints: prefixconstraints,
              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: (maxLines ?? 1) > 1 ? 16 : 0,
                  ),
              errorMaxLines: 3,
              fillColor: fillColor ?? context.cardColor,
              filled: filled,

              border: currentBorder,
              enabledBorder: currentBorder,
              focusedBorder: currentBorder,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade600),
              errorStyle: TextStyle(color: Colors.redAccent.shade400),
              helperText: helperText,
              helperMaxLines: 3,
              helperStyle: TextStyle(
                color: context.adaptive,
                fontWeight: FontWeight.w600,
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ).pOnly(bottom: 14),
        ),
      ],
    );
  }
}
