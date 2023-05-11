import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_image_asset/main.dart';

void main() {
  testWidgets('Load test asset bundle with a fallback image as resource',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: DefaultAssetBundle(
            bundle: TestAssetBundleLoadRes(),
            child: const MyHomePage(
              title: 'test',
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key("IMAGE_TEST")), findsOneWidget);
  });
  testWidgets('Load test asset bundle with a fallback image as resource',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: DefaultAssetBundle(
            bundle: TestAssetBundleByteData(),
            child: const MyHomePage(
              title: 'test',
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key("IMAGE_TEST")), findsOneWidget);
  });
}

/// Default asset bundle for tests. Fixes an error when asset images are being used for tests
/// Needs to have a fallback.jpg file in the lib/assets folder.
class TestAssetBundleLoadRes extends CachingAssetBundle {
//TODO: using this with a default asset bundle will create the 'Message corrupted' exception
  @override
  Future<ByteData> load(String key) async {
    ByteData bytes = await rootBundle.load("lib/assets/fallback.jpg");
    return bytes;
  }
}

/// Default asset bundle for tests.
class TestAssetBundleByteData extends CachingAssetBundle {
//TODO: using this with a default asset bundle will create the 'Message corrupted' exception
  @override
  Future<ByteData> load(String key) async {
    ByteData bytes = ByteData(12);
    return bytes;
  }
}
