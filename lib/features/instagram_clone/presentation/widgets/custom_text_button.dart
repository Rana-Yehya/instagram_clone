import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const CustomTextButton(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            text,
          )
        ],
      ),
    );
  }
}
