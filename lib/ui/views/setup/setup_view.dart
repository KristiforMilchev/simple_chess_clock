import 'package:chess_cloack/main.dart';
import 'package:chess_cloack/ui/views/setup/setup_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../../Assets/styles.dart';
import '../components/setup/setup_welcome_component.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: Container(
        color: ThemeColors.mainThemeBackground,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Select the game interval",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ThemeColors.cardBackground)),
                  onPressed: (() async => await model.intervalPicker()),
                  child: Icon(
                    Icons.timer,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Incremental interval",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ThemeColors.cardBackground)),
                  onPressed: (() async =>
                      await model.selectIncrementInterval()),
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Begin Game",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => ThemeColors.cardBackground)),
                  onPressed: (() async => await model.beginGame()),
                  child: Icon(
                    Icons.not_started_outlined,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
      viewModelBuilder: () => SetupViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(context),
    );
  }
}
