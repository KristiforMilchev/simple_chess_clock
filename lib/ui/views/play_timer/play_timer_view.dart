import 'package:chess_cloack/ui/views/play_timer/play_timer_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../Assets/styles.dart';

class PlaytimerView extends StatelessWidget {
  final int increment;
  final int minutes;

  const PlaytimerView(
      {super.key, required this.minutes, required this.increment});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlayTimerViewModel>.reactive(
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
                flex: 0,
                child: Center(
                  child: Text(
                    "${model.minutesTimerOne}:${model.secondsTimerOne}",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 60),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => model.playerOneMove
                              ? ThemeColors.cardBackground
                              : ThemeColors.mainThemeBackground)),
                  onPressed: (() async => model.playerOneMove
                      ? await model.playerOneClicked()
                      : null),
                  child: Icon(
                    Icons.circle_rounded,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: ThemeColors.innerText,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => model.playerTwoMove
                              ? ThemeColors.cardBackground
                              : ThemeColors.mainThemeBackground)),
                  onPressed: (() async => model.playerTwoMove
                      ? await model.playerTwoClicked()
                      : null),
                  child: Icon(
                    Icons.circle_rounded,
                    color: ThemeColors.mainText,
                    size: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Center(
                  child: Text(
                    "${model.minutesTimerTwo}:${model.secondsTimerTwo}",
                    style: TextStyle(color: ThemeColors.mainText, fontSize: 60),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
      viewModelBuilder: () => PlayTimerViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(
        minutes,
        increment,
        context,
      ),
    );
  }
}
