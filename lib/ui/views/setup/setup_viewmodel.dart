import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../application/router.gr.dart';
import '../../../infrastructure/iadvertisment.dart';
import '../../../infrastructure/ipage_router_service.dart';

class SetupViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IPageRouterService router;
  late BuildContext _context;
  late IAdvertisment _advertisment;

  late int? _minutes = 0;
  late int? _increment = 0;

  get minutes => _minutes;
  get incremental => _increment;

  void initialise(BuildContext context) async {
    router = getIt.get<IPageRouterService>();
    _advertisment = getIt.get<IAdvertisment>();
    _context = context;

    notifyListeners();
  }

  beginGame() async {
    await _advertisment.interstitialAd.show();
    await _advertisment.loadAd();
    var minutes = _minutes ?? 5;
    var increment = _increment ?? 0;

    router.router.navigate(PlaytimerView(
      minutes: minutes,
      increment: increment,
    ));
  }

  minutesChanged(int value) {
    _minutes = value;
    notifyListeners();
  }

  incrementalChanged(int value) {
    _increment = value;
    notifyListeners();
  }
}
