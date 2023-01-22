import 'package:another_flushbar/flushbar.dart';
import 'package:chess_cloack/application/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';
import 'package:chess_cloack/application/services/timer_manager.dart';
import 'package:chess_cloack/infrastructure/itime_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../Assets/styles.dart';
import '../../../infrastructure/ipage_router_service.dart';

class PlayTimerViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router;
  ITimeManager _timerOne = TimerManager();
  ITimeManager _timerTwo = TimerManager();
  late BuildContext _context;

  String? _secondst1 = "--";
  String? _secondst2 = "--";
  String? get secondsTimerOne => _secondst1;
  String? get secondsTimerTwo => _secondst2;

  String? _minutest1 = "--";
  String? _minutest2 = "--";
  String? get minutesTimerOne => _minutest1;
  String? get minutesTimerTwo => _minutest2;

  bool _playerOneMove = true;
  get playerOneMove => _playerOneMove;
  bool _playerTwoMove = true;
  get playerTwoMove => _playerTwoMove;
  bool _starting = true;

  void initialise(int minutes, int incrementBy, BuildContext context) async {
    _context = context;
    router = getIt.get<IPageRouterService>();
    _timerOne.setTimer(minutes, incrementBy, timerExipred);
    _timerTwo.setTimer(minutes, incrementBy, timerExipred);

    Timer.periodic(
      Duration(seconds: 1),
      (_) {
        setLabelInitial();
        _minutest1 = _timerOne.minutes;
        _minutest2 = _timerTwo.minutes;

        _secondst1 = _timerOne.seconds;
        _secondst2 = _timerTwo.seconds;

        notifyListeners();
      },
    );

    notifyListeners();
  }

  void setLabelInitial() {
    if (_starting) {
      if (_timerOne.minutes!.isNotEmpty) {
        _minutest1 = _timerOne.minutes;
        _secondst1 = _timerOne.seconds;
        _minutest2 = _timerOne.minutes;
        _secondst2 = _timerOne.seconds;
        _starting = false;
      } else if (_timerTwo.minutes!.isNotEmpty) {
        _minutest1 = _timerTwo.minutes;
        _secondst1 = _timerTwo.seconds;
        _minutest2 = _timerTwo.minutes;
        _secondst2 = _timerTwo.seconds;
        _starting = false;
      }
    }
  }

  pageChanged(
    int action,
    BuildContext context,
  ) async {
    switch (action) {
      //Import existing account
      case 2:
        router.callbackResult = this;
        router.changePage("/qr-scanner-view");
        break;

      //Create new account
      case 0:
        createNewAccount();
        break;
    }
  }

  void importAccount(String result) {}

  void createNewAccount() async {}

  playerOneClicked() {
    _playerOneMove = false;
    _playerTwoMove = true;

    _timerOne.stopTimer();
    _timerTwo.startTimer();
    notifyListeners();
  }

  playerTwoClicked() {
    _playerTwoMove = false;
    _playerOneMove = true;

    _timerTwo.stopTimer();
    _timerOne.startTimer();

    notifyListeners();
  }

  void timerExipred() {
    router.initActionDialog(
        Center(
          child: Column(
            children: [
              Text(
                "Timer has expired.",
                style: TextStyle(color: ThemeColors.mainText),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => ThemeColors.cardBackground)),
                onPressed: (() async => router.router.navigate(
                      const SetupView(),
                    )),
                child: Icon(
                  Icons.keyboard_return,
                  color: ThemeColors.mainText,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        FlushbarPosition.BOTTOM,
        ThemeColors.mainThemeBackground,
        1,
        BorderRadius.circular(12),
        _context,
        "expiryBox");
  }
}
