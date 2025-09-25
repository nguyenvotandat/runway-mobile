import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  final Color? backgroundcolor;
  final Color? textColor;
  final IconData? icon;
  final double? border; // Thêm thuộc tính border
  final Color? borderColor; // Thêm thuộc tính borderColor

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.content,
    this.height,
    this.width,
    this.backgroundcolor,
    this.textColor,
    this.icon,
    this.border, // Thêm border vào constructor
    this.borderColor, // Thêm borderColor vào constructor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize:
            Size(width ?? MediaQuery.of(context).size.width, height ?? 50),
        backgroundColor: backgroundcolor ?? Theme.of(context).colorScheme.primary,
        side: border != null
            ? BorderSide(
                width: border!,
                color: borderColor ?? Theme.of(context).colorScheme.primary
              )
            : null, // Sử dụng borderColor
      ),
      child: content ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon,
                ),
              if (icon != null)
                const SizedBox(width: 8), // Khoảng cách giữa icon và text
              Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
    );
  }
}
