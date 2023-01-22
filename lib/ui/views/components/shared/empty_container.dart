import 'package:flutter/material.dart';

import '../../../../Assets/styles.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColors.mainThemeBackground,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.accessibility_new,
                color: ThemeColors.mainText,
                size: 45,
              ),
              Text(
                "It's lonely here...",
                style: TextStyle(color: ThemeColors.mainText, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
