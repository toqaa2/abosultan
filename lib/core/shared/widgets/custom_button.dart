import 'package:abosultan/core/style/text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final String? leadingIcon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.8,
      height: height * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: TextStyles.font12WhiteSemiBold,
            ),
            if (leadingIcon != null) ...[
              SizedBox(width: 25),
              Image.asset(leadingIcon!,height: 20,) ,

            ],
          ],
        ),
      ),
    );
  }
}