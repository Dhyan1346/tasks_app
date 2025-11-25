import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
  final double radius;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon; // <-- OPTIONAL ICON
  final double iconSize;
  final Color iconColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 50,
    this.width = double.infinity,
    this.color = Colors.blue,
    this.radius = 12,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.icon, // <-- OPTIONAL
    this.iconSize = 20,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // If icon is provided → show it
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
              const SizedBox(width: 8),
            ],

            // Text
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
