import 'package:flutter/material.dart';

import '../../../../Assets/styles.dart';

class SlideButton extends StatelessWidget {
  final bool direction;
  final IconData icon;
  final String label;

  const SlideButton(
      {super.key,
      required this.direction,
      required this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    if (direction) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ThemeColors.innerText,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: ThemeColors.innerText,
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ThemeColors.innerText,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ThemeColors.innerText,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }
}
