import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ReachabilityState { mobiledataOrWifi, noInternet }

final reachabilityManagerProvider =
    StateNotifierProvider<ReachabilityManager, ReachabilityState>((ref) {
  final _reachabilityManager =
      ReachabilityManager(ReachabilityState.mobiledataOrWifi);
  _reachabilityManager.init();
  return _reachabilityManager;
});

class ReachabilityManager extends StateNotifier<ReachabilityState> {
  ReachabilityManager(ReachabilityState state) : super(state);
  final Connectivity _connectivity = Connectivity();
  var _connectivitySubscription;

  void init() {
    _initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        state = ReachabilityState.mobiledataOrWifi;
        break;
      case ConnectivityResult.mobile:
        state = ReachabilityState.mobiledataOrWifi;
        break;
      case ConnectivityResult.none:
        state = ReachabilityState.noInternet;
        break;
      default:
        state = ReachabilityState.noInternet;
        break;
    }
  }
}
