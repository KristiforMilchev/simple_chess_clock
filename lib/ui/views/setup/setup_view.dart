import 'package:chess_cloack/main.dart';
import 'package:chess_cloack/ui/views/setup/setup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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
                child: Container(
                  color: ThemeColors.cardBackground,
                  child: NumberPicker(
                    value: model.minutes,
                    axis: Axis.horizontal,
                    selectedTextStyle:
                        TextStyle(color: ThemeColors.mainText, fontSize: 50),
                    textStyle:
                        TextStyle(color: ThemeColors.innerText, fontSize: 25),
                    minValue: 0,
                    maxValue: 100,
                    onChanged: (value) => model.minutesChanged(value),
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
                child: Container(
                  color: ThemeColors.cardBackground,
                  child: NumberPicker(
                    value: model.incremental,
                    axis: Axis.horizontal,
                    selectedTextStyle:
                        TextStyle(color: ThemeColors.mainText, fontSize: 50),
                    textStyle:
                        TextStyle(color: ThemeColors.innerText, fontSize: 25),
                    minValue: 0,
                    maxValue: 60,
                    onChanged: (value) => model.incrementalChanged(value),
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
