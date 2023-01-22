import 'package:flutter/material.dart';

import '../../../Assets/styles.dart';

class ApproveDialog extends StatelessWidget {
  final String title;
  final List<Widget> render;
  const ApproveDialog({super.key, required this.title, required this.render});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(title, style: TextStyle(color: ThemeColors.mainText))),
      buttonPadding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: render,
      ),
      backgroundColor: ThemeColors.mainThemeBackground,
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => ThemeColors.cardBackground)),
          child: Text('Cancel', style: TextStyle(color: ThemeColors.mainText)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Approve'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => ThemeColors.cardBackground)),
          child: Text('Approve', style: TextStyle(color: ThemeColors.mainText)),
        ),
      ],
    );
  }
}
