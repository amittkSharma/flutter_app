class WifiConnection {
  String _ssid;
  String get ssid => _ssid;
  set ssid(String pSsId) {
    _ssid = pSsId;
  }

  bool _isConnected;
  get isConnected => _isConnected;
  set isConnected(bool pIsConnected) {
    _isConnected = pIsConnected;
  }
}
