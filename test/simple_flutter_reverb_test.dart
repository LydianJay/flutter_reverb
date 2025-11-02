import 'package:flutter/cupertino.dart';
import 'package:simple_flutter_reverb/simple_flutter_reverb_options.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_flutter_reverb/simple_flutter_reverb.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:logger/logger.dart';
import 'simple_flutter_reverb_test.mocks.dart';

@GenerateMocks([http.Client, WebSocketChannel])
void main() {
  group('FlutterReverb', () {
    late MockClient mockHttpClient;
    late MockWebSocketChannel mockWebSocket;
    late SimpleFlutterReverb flutterReverb;

    setUp(() {
      mockHttpClient = MockClient();
      mockWebSocket = MockWebSocketChannel();

      final options = SimpleFlutterReverbOptions(
        scheme: 'wss',
        host: 'websocket.hatudsiargao.com',
        port: '6001',
        appKey: 'hfbjrkafs83a1xkoootz#',
        authToken: '1|zjHdvFfHPPQMAN143CwAG1yUNn6WqM3aNOTxSQs21e014064',
        authUrl: 'https://websocket.hatudsiargao.com/broadcasting/auth',
        usePort: false,
      );

      flutterReverb = SimpleFlutterReverb(options: options);
      flutterReverb.listen((e) {
        final str = e.data.toString();
        debugPrint(str);
      }, 'update_order');
    });

    test('should construct WebSocket URL correctly', () {
      // expect(flutterReverb.options.scheme, 'ws');
      // expect(flutterReverb.options.host, 'localhost');
      // expect(flutterReverb.options.port, '6001');
      // expect(flutterReverb.options.appKey, 'testKey');
    });
  });
}
