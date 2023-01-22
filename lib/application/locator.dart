import 'package:chess_cloack/application/services/advertisments.dart';
import 'package:chess_cloack/application/services/page_router_service.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../infrastructure/iadvertisment.dart';
import '../infrastructure/ipage_router_service.dart';

//There is also a shortcut (if you don't like it just ignore it):
GetIt getIt = GetIt.I;

void registerDependency() {
  getIt.registerSingleton<IPageRouterService>(PageRouterService());

  final initFeature = MobileAds.instance.initialize();
  getIt.registerSingleton<IAdvertisment>(Advertisments(initFeature));
}

void registerFactory<T>(FactoryFunc<T> func) {
  getIt.registerFactory(() => func);
}

void registerSingleton<T>(FactoryFunc<T> instance) {
  getIt.registerSingleton(instance);
}

void registerLazySingleton<T>(FactoryFunc<T> func) {
  getIt.registerLazySingleton(() => func);
}
