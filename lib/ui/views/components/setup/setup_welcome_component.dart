import 'package:flutter/material.dart';

import '../../../../Assets/styles.dart';
import '../shared/slide_button.dart';

class SetupWelcomeComponent extends StatelessWidget {
  const SetupWelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: ThemeColors.mainThemeBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: NetworkImage("https://escrow.linksync.tech/logomain.png"),
            width: 200,
            height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Sync Authenticator",
            style: GeneralTheme.setuph1,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "The linksync authenicator is a web3 based 2 factor authenicator manager designed around the SYNC 2FA authorization protocol.",
            textAlign: TextAlign.center,
            softWrap: true,
            textWidthBasis: TextWidthBasis.longestLine,
            style: GeneralTheme.setupP,
          ),
          const SizedBox(
            height: 50,
          ),
          const Chip(
            label: Text(
              "Developer Documentation",
              style: TextStyle(color: Colors.white),
            ),
            avatar: Icon(Icons.wb_iridescent_rounded, color: Colors.white),
            backgroundColor: Color.fromARGB(255, 170, 49, 77),
          ),
          const SizedBox(
            height: 20,
          ),
          const SlideButton(
              direction: true,
              icon: Icons.arrow_circle_right,
              label: "Scroll right to create new account"),
          const SlideButton(
              direction: false,
              icon: Icons.arrow_circle_left,
              label: "Scroll left to import existing account"),
        ],
      ),
    );
  }
}
