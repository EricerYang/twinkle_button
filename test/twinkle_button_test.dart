import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twinkle_button/twinkle_button.dart';

void main() {
  const MethodChannel channel = MethodChannel('twinkle_button');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
