import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Widget? content;
  final double? height;
  final double? width;
  final Color? backgroundcolor;
  final Color? textColor;
  final IconData? icon;
  final double? border; // Thêm thuộc tính border
  final Color? borderColor; // Thêm thuộc tính borderColor

  const CustomButton({
    super.key,
    required this.onPressed,
    this.title,
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
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize:
              Size(width ?? MediaQuery.of(context).size.width, height ?? 50),
          backgroundColor: backgroundcolor ?? Theme.of(context).primaryColor,
          side: border != null
              ? BorderSide(width: border!, color: borderColor ?? Colors.white)
              : null, // Sử dụng borderColorcủa nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bo góc nhẹ
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: content ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, color: textColor ?? Colors.white),
                if (icon != null)
                  const SizedBox(width: 8), // Khoảng cách giữa icon và text
                Text(
                  title ?? '',
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
