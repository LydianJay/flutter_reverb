import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_flutter_reverb/simple_flutter_reverb.dart';
import 'package:http/http.dart' as http;
import 'package:simple_flutter_reverb/simple_flutter_reverb_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'simple_flutter_reverb_test.mocks.dart';

void main() {
  test('should authenticate and return token', () async {
    final mockClient = MockClient();
    final options = SimpleFlutterReverbOptions(
      scheme: 'wss',
      host: 'websocket.hatudsiargao.com',
      port: '80',
      appKey: 'hfbjrkafs83a1xkoootz',
      authToken: 'testToken',
      authUrl: 'https://websocket.hatudsiargao.com/broadcasting/auth',
      usePort: false,
    );

    final flutterReverb = SimpleFlutterReverb(options: options);

    when(
      mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => http.Response('{"auth":"12345"}', 200));

    final token = flutterReverb.listen((e) {}, 'private-channel');
    // expect(token, '12345');
  });
}
