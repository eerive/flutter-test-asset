# flutter_test_image_asset

To reproduce the 'Message corrupted' error, run any of the two tests inside the /test folder.


It will produce an error looking like this:
```
══╡ EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE ╞════════════════════════════════════════════════════
The following FormatException was thrown while resolving an image:
Message corrupted

When the exception was thrown, this was the stack:
#0      StandardMessageCodec.readValueOfType (package:flutter/src/services/message_codecs.dart:533:16)
#1      StandardMessageCodec.readValue (package:flutter/src/services/message_codecs.dart:478:12)
#2      StandardMessageCodec.decodeMessage (package:flutter/src/services/message_codecs.dart:342:28)
#3      new _AssetManifestBin.fromStandardMessageCodecMessage (package:flutter/src/services/asset_manifest.dart:57:55)
<asynchronous suspension>
<asynchronous suspension>
(elided 6 frames from dart:async and package:stack_trace)

Image provider: ScrollAwareImageProvider<Object>()
Image configuration: ImageConfiguration(bundle: TestAssetBundleLoadRes#d676f(), devicePixelRatio:
  3.0, locale: en_US, textDirection: TextDirection.ltr, platform: android)
════════════════════════════════════════════════════════════════════════════════════════════════════
Test failed. See exception logs above.
The test description was: Load test asset bundle with a fallback image as resource

✖ Load test asset bundle with a fallback image as resource

```

Flutter doctor -v:

```
[✓] Flutter (Channel stable, 3.10.0, on macOS 13.3.1 22E261 darwin-arm64, locale en-DE)
    • Flutter version 3.10.0 on channel stable at /Users/mdlam/development/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 84a1e904f4 (2 days ago), 2023-05-09 07:41:44 -0700
    • Engine revision d44b5a94c9
    • Dart version 3.0.0
    • DevTools version 2.23.1
```
