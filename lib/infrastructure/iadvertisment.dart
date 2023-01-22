import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class IAdvertisment {
  InterstitialAd get interstitialAd;

  late Future<InitializationStatus> initialization;

  Future<void> loadAd();
}
