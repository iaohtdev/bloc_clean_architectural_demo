import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    var result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}