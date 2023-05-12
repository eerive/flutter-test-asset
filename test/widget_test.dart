import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_image_asset/main.dart';

void main() {
  testWidgets('Load test asset bundle as platform asset bundle ',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: DefaultAssetBundle(
            bundle: TestAssetBundlePlatform(),
            child: const MyHomePage(
              title: 'test',
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key("IMAGE_TEST")), findsOneWidget);
  });
  testWidgets(
      'Load test asset bundle as caching asset bundle', //note: this will surely fail
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

/// This bundle will work by using the [PlatformAssetBundle]
/// instead of [CachingAssetBundle].
class TestAssetBundlePlatform extends PlatformAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    // Matches "AssetManifest.json", "AssetManifest.bin", and "AssetManifest.smcbin"
    if (key.startsWith('AssetManifest')) {
      return super.load(key);
    }

    if (key == 'lib/assets/fallback.jpg') {
      return await rootBundle.load("lib/assets/fallback.jpg");
    }

    throw Exception('Unexpected key: $key');
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
