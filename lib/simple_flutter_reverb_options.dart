class SimpleFlutterReverbOptions {
  final String scheme;
  final String host;
  final String port;
  final String appKey;
  final dynamic authToken;
  final String? authUrl;
  final String privatePrefix;
  final bool usePrefix;
  final void Function(String channelName)? onClose;
  final void Function(dynamic error)? onError;
  final bool reconnectOnClose;
  final int maxReconnectAttempts;
  final Duration reconnectInterval;

  SimpleFlutterReverbOptions({
    required this.scheme,
    required this.host,
    required this.port,
    required this.appKey,
    this.authToken,
    this.authUrl,
    this.privatePrefix = 'private-',
    this.usePrefix = true,
    this.onClose,
    this.onError,
    this.reconnectOnClose = false,
    this.maxReconnectAttempts = 5,
    this.reconnectInterval = const Duration(seconds: 2),
  });
}
